import openai
from approaches.approach import Approach
from azure.search.documents import SearchClient
from azure.search.documents.models import QueryType
from text import nonewlines

# Simple retrieve-then-read implementation, using the Cognitive Search and OpenAI APIs directly. It first retrieves
# top documents from search, then constructs a prompt with them, and then uses OpenAI to generate an completion 
# (answer) with that prompt.
class RetrieveThenReadApproach(Approach):

    template = \
"You are a SQL assistant helping users to generate SQL queries from their English language requests. Create the SQL statement based on the information provided in the user's request. Include the query name for each SQL statement you generate in your response. If the user's request does not provide enough information to create a SQL query, ask a clarifying question. Do not execute any SQL queries or provide answers based on their results." + \
"""

###
Question: 'What is the difference between INNER JOIN and OUTER JOIN in SQL?'

Sources:
source1.txt: An INNER JOIN returns only the rows which have common values in both tables. An OUTER JOIN returns all the rows from one table and the matched rows from the second table. If no match is found, NULL values will be displayed for the second table.
source2.pdf: INNER JOIN and OUTER JOIN are SQL operations used to combine data from two tables based on a related column between them.
source3.pdf: There are three types of OUTER JOINs in SQL: LEFT OUTER JOIN, RIGHT OUTER JOIN, and FULL OUTER JOIN. LEFT OUTER JOIN returns all the rows from the left table and the matched rows from the right table. If no match is found, NULL values will be displayed for the right table. The RIGHT OUTER JOIN and FULL OUTER JOIN work symmetrically for the right table and both tables, respectively.

Answer:
An INNER JOIN returns only the rows which have common values in both tables [source1.txt], while an OUTER JOIN returns all the rows from one table and the matched rows from the second table; If no match is found, NULL values will be displayed for the second table [source1.txt]. INNER JOIN and OUTER JOIN are operations used in SQL to combine data from two tables based on a related column between them [source2.pdf]. There are three types of OUTER JOINs: LEFT OUTER JOIN, RIGHT OUTER JOIN, and FULL OUTER JOIN [source3.pdf].

###
Question: '{q}'?

Sources:
{retrieved}

Answer:
"""

    def __init__(self, search_client: SearchClient, openai_deployment: str, sourcepage_field: str, content_field: str):
        self.search_client = search_client
        self.openai_deployment = openai_deployment
        self.sourcepage_field = sourcepage_field
        self.content_field = content_field

    def run(self, q: str, overrides: dict) -> any:
        use_semantic_captions = True if overrides.get("semantic_captions") else False
        top = overrides.get("top") or 3
        exclude_category = overrides.get("exclude_category") or None
        filter = "category ne '{}'".format(exclude_category.replace("'", "''")) if exclude_category else None

        if overrides.get("semantic_ranker"):
            r = self.search_client.search(q, 
                                          filter=filter,
                                          query_type=QueryType.SEMANTIC, 
                                          query_language="en-us", 
                                          query_speller="lexicon", 
                                          semantic_configuration_name="default", 
                                          top=top, 
                                          query_caption="extractive|highlight-false" if use_semantic_captions else None)
        else:
            r = self.search_client.search(q, filter=filter, top=top)
        if use_semantic_captions:
            results = [doc[self.sourcepage_field] + ": " + nonewlines(" . ".join([c.text for c in doc['@search.captions']])) for doc in r]
        else:
            results = [doc[self.sourcepage_field] + ": " + nonewlines(doc[self.content_field]) for doc in r]
        content = "\n".join(results)

        prompt = (overrides.get("prompt_template") or self.template).format(q=q, retrieved=content)
        completion = openai.Completion.create(
            engine=self.openai_deployment, 
            prompt=prompt, 
            temperature=overrides.get("temperature") or 0.3, 
            max_tokens=1024, 
            n=1, 
            stop=["\n"])

        return {"data_points": results, "answer": completion.choices[0].text, "thoughts": f"Question:<br>{q}<br><br>Prompt:<br>" + prompt.replace('\n', '<br>')}
