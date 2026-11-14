USE HSDDatabase;
GO

-- Insert Data in Customer Table
INSERT INTO customer (last_name, first_name, email, encrypted_password,
 phone, street_address, city, state, zip) VALUES
('Jacobs', 'Nancy', 'Nancy.Jacobs@somewhere.com', 'nf46tG9E',
'817-871-8123', '1440 West Palm Drive', 'Fort Worth', 'TX', '76110'),
('Jacobs', 'Chantel', 'Chantel.Jacobs@somewhere.com', 'b65TG03f',
'817-871-8234', '1550 East Palm Drive', 'Fort Worth', 'TX', '76112'),
('Able', 'Ralph', 'Ralph.Able@somewhere.com', 'm56fGH08',
'210-281-7987', '123 Elm Street', 'San Antonio', 'TX', '78214'),
('Baker', 'Susan', 'Susan.Baker@elsewhere.com', 'PC93fEk9',
'210-281-7876', '456 Oak Street', 'San Antonio', 'TX', '78216'),
('Eagleton', 'Sam', 'Sam.Eagleton@elsewhere.com', 'bnvR44W8',
'210-281-7765', '789 Pine Street', 'San Antonio', 'TX', '78218'),
('Foxtrot', 'Kathy', 'Kathy.Foxtrot@somewhere.com', 'aa8tY4GL',
'972-233-6234', '11023 Elm Street', 'Dallas', 'TX', '75220'),
('George', 'Sally', 'Sally.George@somewhere.com', 'LK8G2tyF',
'972-233-6345', '12034 San Jacinto', 'Dallas', 'TX', '75223'),
('Hullett', 'Shawn', 'Shawn.Hullett@elsewhere.com', 'bu78WW3t',
'972-233-6456', '13045 Flora', 'Dallas', 'TX', '75224'),
('Pearson', 'Bobbi', 'Bobbi.Pearson@elsewhere.com', 'kq6N2O0p',
'512-974-3344', '43 West 23rd Street', 'Austin', 'TX', '78710'),
('Ranger', 'Terry', 'Terry.Ranger@somewhere.com', 'bv3F9Qc4',
'512-974-4455', '56 East 18th Street', 'Austin', 'TX', '78712'),
('Tyler', 'Jenny', 'Jenny.Tyler@somewhere.com', 'Yu4be77Z',
'972-233-6567', '14056 South Ervay Street', 'Dallas', 'TX', '75225'),
('Wayne', 'Joan', 'Joan.Wayne@elsewhere.com', 'JW4TX6g',
'817-871-8245', '1660 South Aspen Drive', 'Fort Worth', 'TX', '76115');

-- Insert Data in Seminar Table
INSERT INTO seminar (seminar_date, seminar_time, seminar_location, seminar_title) VALUES
('2017-10-12', '11:00:00', geography::Point(29.4241, -98.4936, 4326), 'Kitchen on a Budget'),
('2017-10-26', '16:00:00', geography::Point(32.7767, -96.7970, 4326), 'Kitchen on a Big D Budget'),
('2017-11-02', '08:30:00', geography::Point(30.2672, -97.7431, 4326), 'Kitchen on a Budget'),
('2018-03-22', '11:00:00', geography::Point(32.7767, -96.7970, 4326), 'Kitchen on a Big D Budget'),
('2018-03-23', '11:00:00', geography::Point(32.7767, -96.7970, 4326), 'Kitchen on a Big D Budget'),
('2018-04-05', '08:30:00', geography::Point(30.2672, -97.7431, 4326), 'Kitchen on a Budget');

-- Insert Data in Seminar_Customer Table
INSERT INTO seminar_customer (seminar_id, customer_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
(2, 6), (2, 7), (2, 8),
(3, 9), (3, 10),
(4, 6), (4, 7), (4, 11), (4, 12);

-- Insert Data in Contact Table
INSERT INTO contact (customer_id, contact_number, contact_date, contact_type, seminar_id) VALUES
(1, 1, '2017-10-12', 'Seminar', 1),
(2, 1, '2017-10-12', 'Seminar', 1),
(3, 1, '2017-10-12', 'Seminar', 1),
(4, 1, '2017-10-12', 'Seminar', 1),
(5, 1, '2017-10-12', 'Seminar', 1),
(6, 1, '2017-10-26', 'Seminar', 2),
(7, 1, '2017-10-26', 'Seminar', 2),
(8, 1, '2017-10-26', 'Seminar', 2),
(9, 1, '2017-11-02', 'Seminar', 3),
(10, 1, '2017-11-02', 'Seminar', 3),
(6, 6, '2018-03-22', 'Seminar', 4),
(7, 6, '2018-03-22', 'Seminar', 4),
(11, 1, '2018-03-22', 'Seminar', 4),
(12, 1, '2018-03-22', 'Seminar', 4);

INSERT INTO contact (customer_id, contact_number, contact_date, contact_type) VALUES
(1, 2, '2017-10-15', 'EmailSeminarMessage'),
(2, 2, '2017-10-15', 'EmailSeminarMessage'),
(3, 2, '2017-10-15', 'EmailSeminarMessage'),
(4, 2, '2017-10-15', 'EmailSeminarMessage'),
(5, 2, '2017-10-15', 'EmailSeminarMessage'),
(1, 3, '2017-10-15', 'FormLetterSeminar'),
(2, 3, '2017-10-15', 'FormLetterSeminar'),
(3, 3, '2017-10-15', 'FormLetterSeminar'),
(4, 3, '2017-10-15', 'FormLetterSeminar'),
(5, 3, '2017-10-15', 'FormLetterSeminar'),
(6, 2, '2017-10-30', 'EmailSeminarMessage'),
(7, 2, '2017-10-30', 'EmailSeminarMessage'),
(8, 2, '2017-10-30', 'EmailSeminarMessage'),
(6, 3, '2017-10-30', 'FormLetterSeminar'),
(7, 3, '2017-10-30', 'FormLetterSeminar'),
(8, 3, '2017-10-30', 'FormLetterSeminar'),
(9, 2, '2017-11-06', 'EmailSeminarMessage'),
(10, 2, '2017-11-06', 'EmailSeminarMessage'),
(9, 3, '2017-11-06', 'FormLetterSeminar'),
(10, 3, '2017-11-06', 'FormLetterSeminar'),
(3, 4, '2018-02-20', 'WebAccountCreation'),
(3, 5, '2018-02-20', 'EmailAccountMessage'),
(6, 4, '2018-02-22', 'WebAccountCreation'),
(6, 5, '2018-02-22', 'EmailAccountMessage'),
(7, 4, '2018-02-25', 'WebAccountCreation'),
(7, 5, '2018-02-25', 'EmailAccountMessage'),
(8, 4, '2018-03-07', 'WebAccountCreation'),
(8, 5, '2018-03-07', 'EmailAccountMessage');

-- Insert Data in Products Table
INSERT INTO products (product_number, product_type, product_description,
 unit_price, quantity_on_hand) VALUES
('VK001', 'Video', 'Kitchen Remodeling Basics', 14.95, 50),
('VK002', 'Video', 'Advanced Kitchen Remodeling', 14.95, 35),
('VK003', 'Video', 'Kitchen Remodeling Dallas Style', 19.95, 25),
('VK004', 'Video', 'Heather Sweeney Seminar Live in Dallas on 25-OCT-16', 24.95, 20),
('VB001', 'Video Companion', 'Kitchen Remodeling Basics', 7.99, 50),
('VB002', 'Video Companion', 'Advanced Kitchen Remodeling I', 7.99, 35),
('VB003', 'Video Companion', 'Kitchen Remodeling Dallas Style', 9.99, 25),
('BK001', 'Book', 'Kitchen Remodeling Basics For Everyone', 24.95, 75),
('BK002', 'Book', 'Advanced Kitchen Remodeling For Everyone', 24.95, 75),
('BK003', 'Book', 'Kitchen Remodeling Dallas Style For Everyone', 24.95, 75);

-- Insert Data in Invoice Table
INSERT INTO invoice (invoice_date, customer_id, payment_type, sub_total, shipping, tax, total)
VALUES
('2017-10-15', 3, 'VISA', 22.94, 5.95, 1.31, 30.20), -- 35000
('2017-10-25', 4, 'MasterCard', 47.89, 5.95, 2.73, 56.57), -- 35001
('2017-12-20', 7, 'VISA', 24.95, 5.95, 1.42, 32.32), -- 35002
('2018-03-25', 4, 'MasterCard', 64.85, 5.95, 3.70, 74.50), -- 35003
('2018-03-27', 6, 'MasterCard', 94.79, 5.95, 5.40, 106.14), -- 35004
('2018-03-27', 7, 'MasterCard', 94.80, 5.95, 5.40, 106.15), 
('2018-03-31', 9, 'VISA', 47.89, 5.95, 2.73, 56.57), 
('2018-04-03', 11, 'MasterCard',109.78, 5.95, 6.26, 121.99), 
('2018-04-08', 5, 'MasterCard', 47.89, 5.95, 2.73, 56.57),
('2018-04-08', 1, 'VISA', 47.89, 5.95, 2.73, 56.57), 
('2018-04-23', 3, 'VISA', 24.95, 5.95, 1.42, 32.32),
('2018-05-07', 9, 'VISA', 22.94, 5.95, 1.31, 30.20), 
('2018-05-21', 8, 'MasterCard', 54.89, 5.95, 3.13, 63.97),
('2018-06-05', 3, 'VISA', 47.89, 5.95, 2.73, 56.57),
('2018-06-05', 11, 'MasterCard', 45.88, 5.95, 2.62, 54.45), 
('2018-06-05', 12, 'MasterCard', 94.79, 5.95, 5.40, 106.14),
('2018-06-05', 3, 'VISA', 45.88, 5.95, 2.62, 54.45); 


-- Insert Data in Line Item Table
INSERT INTO line_item (invoice_number, line_number, product_number, quantity, unit_price, total)
VALUES
(35000, 1, 'VK001', 1, 14.95, 14.95),
(35000, 2, 'VB001', 1, 7.99, 7.99),
(35001, 1, 'VK001', 1, 14.95, 14.95),
(35001, 2, 'VB001', 1, 7.99, 7.99),
(35001, 3, 'BK001', 1, 24.95, 24.95),
(35002, 1, 'VK004', 1, 24.95, 24.95),
(35003, 1, 'VK002', 1, 14.95, 14.95),
(35003, 2, 'BK002', 1, 24.95, 24.95),
(35003, 3, 'VK004', 1, 24.95, 24.95),
(35004, 1, 'VK002', 1, 14.95, 14.95),
(35004, 2, 'BK002', 1, 24.95, 24.95),
(35004, 3, 'VK003', 1, 19.95, 19.95),
(35004, 4, 'VB003', 1, 9.99, 9.99),
(35004, 5, 'VK004', 1, 24.95, 24.95),
(35005, 1, 'VK002', 1, 14.95, 14.95),
(35005, 2, 'BK002', 1, 24.95, 24.95),
(35005, 3, 'VK003', 1, 19.95, 19.95),
(35005, 4, 'VK004', 1, 24.95, 24.95),
(35006, 1, 'BK001', 1, 24.95, 24.95),
(35006, 2, 'VK001', 1, 14.95, 14.95),
(35006, 3, 'VB001', 1, 7.99, 7.99),
(35007, 1, 'VK003', 2, 19.95, 39.90),
(35007, 2, 'VB003', 2, 9.99, 19.98),
(35007, 3, 'VK004', 2, 24.95, 49.90),
(35008, 1, 'BK001', 1, 24.95, 24.95),
(35008, 2, 'VK001', 1, 14.95, 14.95),
(35008, 3, 'VB001', 1, 7.99, 7.99),
(35009, 1, 'BK001', 1, 24.95, 24.95),
(35009, 2, 'VK001', 1, 14.95, 14.95),
(35009, 3, 'VB001', 1, 7.99, 7.99),
(35010, 1, 'BK001', 1, 24.95, 24.95),
(35011, 1, 'VK002', 1, 14.95, 14.95),
(35011, 2, 'VB002', 1, 7.99, 7.99),
(35012, 1, 'VK003', 1, 19.95, 19.95),
(35012, 2, 'VB003', 1, 9.99, 9.99),
(35012, 3, 'VK004', 1, 24.95, 24.95),
(35013, 1, 'VK002', 1, 14.95, 14.95),
(35013, 2, 'VB002', 1, 7.99, 7.99),
(35013, 3, 'BK002', 1, 24.95, 24.95),
(35014, 1, 'VK002', 2, 14.95, 29.90),
(35014, 2, 'VB002', 2, 7.99, 15.98),
(35015, 1, 'VK002', 1, 14.95, 14.95),
(35015, 2, 'BK002', 1, 24.95, 24.95),
(35015, 3, 'VK003', 1, 19.95, 19.95),
(35015, 4, 'VB003', 1, 9.99, 9.99),
(35015, 5, 'VK004', 1, 24.95, 24.95),
(35016, 1, 'VK001', 1, 14.95, 14.95),
(35016, 2, 'VB001', 1, 7.99, 7.99),
(35016, 3, 'VK002', 1, 14.95, 14.95),
(35016, 4, 'VB002', 1, 7.99, 7.99);
