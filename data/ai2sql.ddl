-- [AI2sql_2023-01-20T19-44Z].dbo.Bubble_Connections definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.Bubble_Connections;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.Bubble_Connections (
	id int IDENTITY(1,1) NOT NULL,
	dbserver nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	database_name nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	dbusername nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	dbpassword nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	dbdriver nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	user_email nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__Bubble_C__3213E83F57C70A1D PRIMARY KEY (id)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.azure_connections definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.azure_connections;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.azure_connections (
	id int IDENTITY(1,1) NOT NULL,
	username nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	token nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	servername nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	databasename nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[user] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	password nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	created_at datetime2 DEFAULT getdate() NULL,
	CONSTRAINT PK__azure_co__3213E83FD5DF0DAF PRIMARY KEY (id),
	CONSTRAINT UQ__azure_co__CA90DA7A8AC47579 UNIQUE (token)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.azure_connections2 definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.azure_connections2;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.azure_connections2 (
	servername varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	dbuser varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	dbpassword varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	databasename varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	user_email varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	token varchar(512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
);


-- [AI2sql_2023-01-20T19-44Z].dbo.offices definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.offices;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.offices (
	officeCode varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	city varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	phone varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	addressLine1 varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	addressLine2 varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	state varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	country varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	postalCode varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	territory varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__offices__FEBDCF639B0BE330 PRIMARY KEY (officeCode)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.orders definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.orders;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.orders (
	orderNumber int NOT NULL,
	orderDate date NOT NULL,
	requiredDate date NOT NULL,
	shippedDate date DEFAULT NULL NULL,
	status varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	comments text COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	customerNumber int NOT NULL,
	CONSTRAINT PK__orders__6296129E46D23BAC PRIMARY KEY (orderNumber)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.plugins_logs definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.plugins_logs;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.plugins_logs (
	id int IDENTITY(1,1) NOT NULL,
	[text] nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	username nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[timestamp] datetime IDENTITY(1,1) NULL,
	CONSTRAINT PK__plugins___3213E83F5D6A628E PRIMARY KEY (id)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.productlines definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.productlines;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.productlines (
	productLine varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	textDescription varchar(4000) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	htmlDescription text COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[image] varbinary(MAX) NULL,
	CONSTRAINT PK__productl__B847E499510E7EE7 PRIMARY KEY (productLine)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.user_tokens definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.user_tokens;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.user_tokens (
	id int IDENTITY(1,1) NOT NULL,
	username nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	token nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__user_tok__3213E83F0E2B8C96 PRIMARY KEY (id)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.users definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.users;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.users (
	user_id int NOT NULL,
	username text COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	email text COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	password text COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	name text COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	profile_pic text COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__users__B9BE370F5449C9C4 PRIMARY KEY (user_id)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.employees definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.employees;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.employees (
	employeeNumber int NOT NULL,
	lastName varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	firstName varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	extension varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	email varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	officeCode varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	reportsTo int DEFAULT NULL NULL,
	jobTitle varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__employee__CB72B235BD627E08 PRIMARY KEY (employeeNumber),
	CONSTRAINT employees_ibfk_1 FOREIGN KEY (reportsTo) REFERENCES [AI2sql_2023-01-20T19-44Z].dbo.employees(employeeNumber),
	CONSTRAINT employees_ibfk_2 FOREIGN KEY (officeCode) REFERENCES [AI2sql_2023-01-20T19-44Z].dbo.offices(officeCode)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.posts definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.posts;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.posts (
	post_id int NOT NULL,
	user_id int NOT NULL,
	content text COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[image] text COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[timestamp] datetime IDENTITY(0,1) NOT NULL,
	CONSTRAINT PK__posts__3ED78766440CE721 PRIMARY KEY (post_id),
	CONSTRAINT FK__posts__user_id__5EBF139D FOREIGN KEY (user_id) REFERENCES [AI2sql_2023-01-20T19-44Z].dbo.users(user_id)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.products definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.products;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.products (
	productCode varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	productName varchar(70) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	productLine varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	productScale varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	productVendor varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	productDescription text COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	quantityInStock smallint NOT NULL,
	buyPrice decimal(10,2) NOT NULL,
	MSRP decimal(10,2) NOT NULL,
	CONSTRAINT PK__products__C2068388C791D3EB PRIMARY KEY (productCode),
	CONSTRAINT products_ibfk_1 FOREIGN KEY (productLine) REFERENCES [AI2sql_2023-01-20T19-44Z].dbo.productlines(productLine)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.comments definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.comments;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.comments (
	comment_id int NOT NULL,
	post_id int NOT NULL,
	user_id int NOT NULL,
	content text COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[timestamp] datetime IDENTITY(0,1) NOT NULL,
	CONSTRAINT PK__comments__E79576877E61F5B8 PRIMARY KEY (comment_id),
	CONSTRAINT FK__comments__post_i__619B8048 FOREIGN KEY (post_id) REFERENCES [AI2sql_2023-01-20T19-44Z].dbo.posts(post_id),
	CONSTRAINT FK__comments__user_i__628FA481 FOREIGN KEY (user_id) REFERENCES [AI2sql_2023-01-20T19-44Z].dbo.users(user_id)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.customers definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.customers;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.customers (
	customerNumber int NOT NULL,
	customerName varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	contactLastName varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	contactFirstName varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	phone varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	addressLine1 varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	addressLine2 varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	city varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	state varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	postalCode varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	country varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	salesRepEmployeeNumber int DEFAULT NULL NULL,
	creditLimit decimal(10,2) DEFAULT NULL NULL,
	CONSTRAINT PK__customer__6B63699643E107D6 PRIMARY KEY (customerNumber),
	CONSTRAINT customers_ibfk_1 FOREIGN KEY (salesRepEmployeeNumber) REFERENCES [AI2sql_2023-01-20T19-44Z].dbo.employees(employeeNumber)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.orderdetails definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.orderdetails;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.orderdetails (
	orderNumber int NOT NULL,
	productCode varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	quantityOrdered int NOT NULL,
	priceEach decimal(10,2) NOT NULL,
	orderLineNumber smallint NOT NULL,
	CONSTRAINT PK__orderdet__FEB67AA6F5DC793E PRIMARY KEY (orderNumber,productCode),
	CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY (orderNumber) REFERENCES [AI2sql_2023-01-20T19-44Z].dbo.orders(orderNumber),
	CONSTRAINT orderdetails_ibfk_2 FOREIGN KEY (productCode) REFERENCES [AI2sql_2023-01-20T19-44Z].dbo.products(productCode)
);


-- [AI2sql_2023-01-20T19-44Z].dbo.payments definition

-- Drop table

-- DROP TABLE [AI2sql_2023-01-20T19-44Z].dbo.payments;

CREATE TABLE [AI2sql_2023-01-20T19-44Z].dbo.payments (
	customerNumber int NOT NULL,
	checkNumber varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	paymentDate date NOT NULL,
	amount decimal(10,2) NOT NULL,
	CONSTRAINT PK__payments__6C3E46E6B7DEB8FF PRIMARY KEY (customerNumber,checkNumber),
	CONSTRAINT FK__payments__custom__151B244E FOREIGN KEY (customerNumber) REFERENCES [AI2sql_2023-01-20T19-44Z].dbo.customers(customerNumber)
);