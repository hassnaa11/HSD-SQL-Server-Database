USE HSDDatabase;

-- 1. List all columns of every table

SELECT * FROM customer;

SELECT * FROM seminar;

SELECT * FROM seminar_customer;

SELECT * FROM products;

SELECT * FROM invoice;

SELECT * FROM contact;

SELECT * FROM line_item;


-- 2. List the LastName, FirstName and Phone of all customers who live in Dallas
SELECT last_name, first_name, phone
FROM customer 
WHERE city = 'Dallas';


-- 3. List the LastName, FirstName and Phone of all customers who live in Dallas and whose last name begins with the letter T
SELECT last_name, first_name, phone
FROM customer 
WHERE city = 'Dallas' AND last_name LIKE 'T%';

/* 4. List the InvoiceNumber of every sale that includes the video "Heather Sweeney Seminar Live in 
Dallas on 25-OCT-16". Use a subquery. (Hint: the correct solution touches three tables, 
because the product is identified by its description.) */
SELECT l.invoice_number 
FROM line_item l
WHERE l.product_number IN (
	SELECT p.product_number
	FROM products p
	WHERE p.product_description = 'Heather Sweeney Seminar Live in Dallas on 25-OCT-16'
);


/* 5. Same question 4 but using joins */
SELECT i.invoice_number 
FROM invoice i
JOIN line_item  l ON i.invoice_number = l.invoice_number
JOIN products p ON p.product_number = l.product_number
WHERE p.product_description = 'Heather Sweeney Seminar Live in Dallas on 25-OCT-16';


/* 6. List the FirstName, LastName and Phone of customers who attended the "Kitchen on a Big D 
Budget" seminar. List each person once. Sort by LastName descending, then FirstName 
descending. */
SELECT DISTINCT c.first_name, c.last_name, c.phone
FROM customer c
JOIN seminar_customer sc ON c.customer_id = sc.customer_id
JOIN seminar s ON s.seminar_id = sc.seminar_id
WHERE s.seminar_title = 'Kitchen on a Big D Budget'
ORDER BY c.last_name DESC, c.first_name DESC;

/* 7. List the FirstName, LastName, Phone, ProductNumber and ProductDescription of customers 
who have purchased a video. List each name and video combination once. Sort by LastName 
descending, then FirstName descending, then ProductNumber descending. (Hint: video 
product numbers start with VK.) */
SELECT DISTINCT c.first_name, c.last_name, c.phone, p.product_number, p.product_description
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN line_item l ON l.invoice_number = i.invoice_number
JOIN products p ON l.product_number = p.product_number
WHERE p.product_type = 'Video'
ORDER BY c.last_name DESC, c.first_name DESC, p.product_number DESC;

/* 8. Show the sum of SubTotal for INVOICE (the money earned on products, excluding shipping and 
tax) as SumOfSubTotal. */
SELECT SUM(sub_total) AS 'SumOfSubTotal'
FROM invoice;

/* 9. Show the average of SubTotal for INVOICE as AverageOfSubTotal. */
SELECT AVG(sub_total) AS 'AverageOfSubTotal'
FROM invoice;

/* 10. Show both the sum and the average of SubTotal in one statement, named SumOfSubTotal and 
AverageOfSubTotal. */
SELECT 
	SUM(sub_total) AS 'SumOfSubTotal', 
	AVG(sub_total) AS 'AverageOfSubTotal'
FROM invoice;

/* 11. Change the UnitPrice of product VK004 to 34.95 instead of the current 24.95.*/
UPDATE products 
SET unit_price = 34.95
WHERE product_number = 'VK004';

/* 12. Undo the price change from question O. */
UPDATE products 
SET unit_price = 24.95
WHERE product_number = 'VK004';
