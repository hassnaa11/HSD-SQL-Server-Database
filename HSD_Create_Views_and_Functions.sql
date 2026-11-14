USE HSDDatabase;
/* 
Create a view named InvoiceSummaryView containing INVOICE.InvoiceNumber, 
INVOICE.InvoiceDate, LINE_ITEM.LineNumber, LINE_ITEM.ProductNumber, 
PRODUCT.ProductDescription and LINE_ITEM.UnitPrice. Run it, then test it with a SELECT. 
*/
CREATE VIEW InvoiceSummaryView AS
SELECT 
	i.invoice_number, i.invoice_date, l.line_number, 
	l.product_number, p.product_description, l.unit_price
FROM invoice i
JOIN line_item l ON i.invoice_number = l.invoice_number
JOIN products p  ON p.product_number = l.product_number;

SELECT * FROM InvoiceSummaryView;

/*
Create and test a user-defined function named FirstNameFirst that takes FirstName and 
LastName and returns one value, FullName: the first name, a space, then the last name. For 
example, Steve and Smith become Steve Smith. 
*/
DROP FUNCTION IF EXISTS FirstNameFirst;
GO

CREATE FUNCTION dbo.FirstNameFirst (@first_name CHAR(25), @last_name CHAR(25))
RETURNS CHAR(51)
AS 
BEGIN
	RETURN CONCAT(TRIM(@first_name), ' ', TRIM(@last_name))
END;
GO 

SELECT dbo.FirstNameFirst ('Steve', 'smith') AS full_name;


/* 
Create a view named CustomerInvoiceSummaryView containing INVOICE.InvoiceNumber, 
INVOICE.InvoiceDate, the customer's full name built with FirstNameFirst, 
CUSTOMER.EmailAddress and INVOICE.Total. Run it, then test it with a SELECT. 
*/
CREATE VIEW CustomerInvoiceSummaryView AS
SELECT 
	i.invoice_number, i.invoice_date, 
	dbo.FirstNameFirst (c.first_name, c.last_name) AS full_name,
	c.email, i.total
FROM invoice i 
JOIN customer c ON c.customer_id = i.customer_id;
	
SELECT * FROM CustomerInvoiceSummaryView;