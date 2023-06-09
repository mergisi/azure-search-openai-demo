import { Example } from "./Example";

import styles from "./Example.module.css";

export type ExampleModel = {
    text: string;
    value: string;
};

const EXAMPLES: ExampleModel[] = [
    {
        text: "Query all data from the 'employees' table where 'age' is greater than 30.",
        value: "SELECT * FROM employees WHERE age > 30;"
    },
    {
        text: "Retrieve all records from the Employees table",
        value: "SELECT * FROM Employees;"
    },
    {
        text: "Find the total number of sales made by each 'salesperson' in the 'sales' table.",
        value: "SELECT salesperson, COUNT(*) as total_sales FROM sales GROUP BY salesperson;"
    }
];

interface Props {
    onExampleClicked: (value: string) => void;
}

export const ExampleList = ({ onExampleClicked }: Props) => {
    return (
        <ul className={styles.examplesNavList}>
            {EXAMPLES.map((x, i) => (
                <li key={i}>
                    <Example text={x.text} value={x.value} onClick={onExampleClicked} />
                </li>
            ))}
        </ul>
    );
};
