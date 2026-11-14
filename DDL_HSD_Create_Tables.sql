CREATE DATABASE HSDDatabase;

USE HSDDatabase;
GO

-------------------
-- Drop child tables first

IF OBJECT_ID('line_item', 'U') IS NOT NULL
    DROP TABLE line_item;
GO

IF OBJECT_ID('seminar_customer', 'U') IS NOT NULL
    DROP TABLE seminar_customer;
GO

IF OBJECT_ID('contact', 'U') IS NOT NULL
    DROP TABLE contact;
GO

IF OBJECT_ID('invoice', 'U') IS NOT NULL
    DROP TABLE invoice;
GO

-- Drop parent tables

IF OBJECT_ID('products', 'U') IS NOT NULL
    DROP TABLE products;
GO

IF OBJECT_ID('seminar', 'U') IS NOT NULL
    DROP TABLE seminar;
GO

IF OBJECT_ID('customer', 'U') IS NOT NULL
    DROP TABLE customer;
GO

-------------------
-- Create Tables 
 
CREATE TABLE customer(
	customer_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	last_name CHAR(25) NOT NULL,
	first_name CHAR(25) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	encrypted_password VARCHAR(50) NULL,
	phone CHAR(12) NOT NULL,
	street_address CHAR(50) NULL,
	city CHAR(50) DEFAULT('Dallas'),
	state CHAR(2) DEFAULT('TX'),
	zip CHAR(10) DEFAULT('75201'),

    CONSTRAINT CHK_Email
    CHECK (
        email LIKE '[A-Za-z]%' 
        AND email LIKE '%_@_%._%'
        AND email NOT LIKE '% %'
    )
);
GO

-----------

CREATE TABLE seminar(
	seminar_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	seminar_date DATE NOT NULL,
	seminar_time TIME NOT NULL,
	seminar_location GEOGRAPHY NOT NULL,
	seminar_title VARCHAR(100) NOT NULL
);
GO

-----------

CREATE TABLE seminar_customer(
	seminar_id INT NOT NULL,
	customer_id INT NOT NULL,
	CONSTRAINT PK_Seminar_Customer PRIMARY KEY (seminar_id, customer_id),
	CONSTRAINT FK_Seminar FOREIGN KEY (seminar_id) REFERENCES seminar(seminar_id),
	CONSTRAINT FK_Customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
GO

-----------

CREATE TABLE contact(
	customer_id INT NOT NULL,
	contact_number INT,
	contact_date DATE NOT NULL,
	contact_type CHAR(30),
	seminar_id INT NULL,
	CONSTRAINT PK_Contact PRIMARY KEY (customer_id, contact_number),
	CONSTRAINT FK_Contact_Customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	CONSTRAINT FK_Contact_Seminar FOREIGN KEY (seminar_id) REFERENCES seminar(seminar_id),
	CONSTRAINT CHK_Contact_Type CHECK 
	(contact_type IN('Seminar', 'FormLetterSeminar', 'WebAccountCreation', 'WebPurchase', 'EmailAccountMessage', 'EmailSeminarMessage', 'EmailPurchaseMessage', 'EmailExchangeMessage', 'PhoneConversation'))
);
GO

-----------

CREATE TABLE products(
	product_number CHAR(35) NOT NULL PRIMARY KEY,
	product_type CHAR(25) NOT NULL,
	product_description VARCHAR(100) NOT NULL,
	unit_price NUMERIC(9,2) NOT NULL,
	quantity_on_hand INT NOT NULL,
	CONSTRAINT CHK_Product_Type CHECK(product_type IN('Video', 'Video Companion', 'Book'))
);
GO

-----------

CREATE TABLE invoice(
	invoice_number INT IDENTITY(35000,1) NOT NULL PRIMARY KEY,
	invoice_date DATE NOT NULL,
	customer_id INT NOT NULL,
	payment_type CHAR(25) NOT NULL DEFAULT('Cash'),
	sub_total NUMERIC(9,2),
	shipping NUMERIC(9,2),
	tax NUMERIC(9,2),
	total NUMERIC(9,2),
	CONSTRAINT FK_Invoice_Customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	CONSTRAINT CHK_Payment_Type CHECK(payment_type IN('VISA', 'MasterCard', 'American Express', 'PayPal', 'Check', 'Cash'))
);
GO

-----------

CREATE TABLE line_item(
	invoice_number INT NOT NULL,
	line_number INT NOT NULL,
	product_number CHAR(35) NOT NULL,
	quantity INT NOT NULL,
	unit_price NUMERIC(9,2),
	total NUMERIC(9,2),
	CONSTRAINT PK_Line PRIMARY KEY (invoice_number, line_number),
	CONSTRAINT FK_Line_Invoice FOREIGN KEY (invoice_number) REFERENCES invoice(invoice_number),
	CONSTRAINT FK_Line_Product FOREIGN KEY (product_number) REFERENCES products(product_number)
);
GO