-- Inserting sample data into Account table
INSERT INTO mydb.Account (emailID, Name, Password, PhoneNumber, Address, SessionID, isEmployee, AccountID) 
VALUES 
('alice3@gmail.com', 'Alice Johnson', 'pass123', '9876543210', '789 Oak St', 3, 0, 'account3'),
('bobby@yahoo.com', 'Bob Wilson', 'abc123', '8765432109', '567 Pine St', 4, 0, 'account4'),
('charlie@hero.com', 'Charlie Brown', 'password', '7654321098', '345 Maple St', 5, 0, 'account5'),
('david@crypt.com', 'David Lee', 'securepass', '6543210987', '123 Cedar St', 6, 1, 'account6'),
('emma@gmail.com', 'Emma Watson', 'hello123', '5432109876', '987 Elm St', 7, 1, 'account7'),
('franky@gmail.com', 'Frank Smith', 'password123', '4321098765', '765 Birch St', 8, 1, 'account8'),
('gracy@gmail.com', 'Grace Miller', 'abc123xyz', '3210987654', '543 Oak St', 9, 0, 'account9'),
('henry@gmail.com', 'Henry Taylor', 'passwordxyz', '2109876543', '321 Pine St', 10, 0, 'account10'),
('bellatrix@yahoo.com', 'Isabella Davis', 'pass123xyz', '1098765432', '234 Maple St', 11, 0, 'account11'),
('jack@here.com', 'Jack Wilson', 'abcxyz123', '0987654321', '432 Cedar St', 12, 1, 'account12');

-- Inserting sample data into category table
INSERT INTO mydb.category (category_id, name)
VALUES 
(4, 'Home Appliances'),
(5, 'Accessories'),
(6, 'Toys'),
(7, 'Furniture'),
(8, 'Beauty'),
(9, 'Sports'),
(10, 'Stationery'),
(11, 'Food'),
(12, 'Music'),
(13, 'Movies');

-- Inserting sample data into Product table
INSERT INTO mydb.Product (ProductID, Name, Cost, Description, Discount, Rating, Quantity, category_category_id)
VALUES 
('product4', 'Refrigerator', 799.99, 'Energy-efficient refrigerator', 100.00, 4.5, 50, 4),
('product5', 'Watch', 49.99, 'Stylish wristwatch', 10.00, 4.2, 150, 5),
('product6', 'LEGO Set', 39.99, 'Build your own adventure', NULL, 4.7, 100, 6),
('product7', 'Sofa', 299.99, 'Comfortable living room sofa', 20.00, 4.0, 30, 7),
('product8', 'Lipstick', 9.99, 'Long-lasting matte lipstick', 5.00, 4.8, 200, 8),
('product9', 'Football', 19.99, 'Durable football for outdoor games', NULL, 4.5, 50, 9),
('product10', 'Notebook', 4.99, 'College-ruled spiral notebook', 15.00, 4.0, 300, 10),
('product11', 'Chocolate', 2.99, 'Delicious milk chocolate bar', NULL, 4.9, 1000, 11),
('product12', 'Guitar', 199.99, 'Acoustic guitar for beginners', 30.00, 4.6, 20, 12),
('product14', 'Refrigerator', 799.99, 'NOT Energy-efficient refrigerator', 100.00, 4.5, 50, 4),
('product13', 'Movie DVD', 12.99, 'Latest blockbuster movie', NULL, 4.2, 500, 13);

-- Inserting sample data into Membership table
INSERT INTO mydb.Membership (MembershipID, NumberofMembers)
VALUES 
(3, 150),
(4, 300),
(5, 400),
(6, 200),
(7, 500),
(8, 100),
(9, 250),
(10, 350),
(11, 450),
(12, 150);

-- Inserting sample data into Discount table
INSERT INTO mydb.Discount (DiscountID, Percentage, category_category_id1)
VALUES 
(3, 15.00, 4),
(4, 25.00, 5),
(5, 35.00, 6),
(6, 45.00, 7),
(7, 20.00, 8),
(8, 10.00, 9),
(9, 5.00, 10),
(10, 30.00, 11),
(11, 40.00, 12),
(12, 50.00, 13);

-- Inserting sample data into CART table
INSERT INTO mydb.CART (CartID)
VALUES 
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12);

-- Inserting sample data into Purchase_History table
INSERT INTO mydb.Purchase_History (HistoryID)
VALUES 
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12);

-- Inserting sample data into User table
INSERT INTO mydb.User (MembershipStartDate, MembershipEndDate, Cart, Purchase_History, Membership_MembershipID, Account_AccountID, CART_CartID, Purchase_History_HistoryID)
VALUES 
('2023-01-01', '2024-01-01', NULL, NULL, 3, 'account3', 3, 3),
('2023-01-01', '2024-01-01', NULL, NULL, 4, 'account4', 4, 4),
('2023-01-01', '2024-01-01', NULL, NULL, 5, 'account5', 5, 5),
('2023-01-01', '2024-01-01', NULL, NULL, 6, 'account6', 6, 6),
('2023-01-01', '2024-01-01', NULL, NULL, 7, 'account7', 7, 7),
('2023-01-01', '2024-01-01', NULL, NULL, 8, 'account8', 8, 8),
('2023-01-01', '2024-01-01', NULL, NULL, 9, 'account9', 9, 9),
('2023-01-01', '2024-01-01', NULL, NULL, 10, 'account10', 10, 10),
('2023-01-01', '2024-01-01', NULL, NULL, 11, 'account11', 11, 11),
('2023-01-01', '2024-01-01', NULL, NULL, 12, 'account12', 12, 12);

-- Inserting sample data into Session table
/*INSERT INTO mydb.Session (SessionID, CartValue, Membership_MembershipID, User_Account_AccountID, CART_CartID, Purchase_History_HistoryID)
VALUES 
(3, 300.00, 3, 'account3', 3, 3),
(4, 250.00, 4, 'account4', 4, 4),
(5, 200.00, 5, 'account5', 5, 5),
(6, 350.00, 6, 'account6', 6, 6),
(7, 400.00, 7, 'account7', 7, 7),
(8, 150.00, 8, 'account8', 8, 8),
(9, 450.00, 9, 'account9', 9, 9),
(10, 500.00, 10, 'account10', 10, 10),
(11, 150.00, 11, 'account11', 11, 11),
(12, 200.00, 12, 'account12', 12, 12);*/

-- Inserting sample data into Employee table
INSERT INTO mydb.Employee (MonthlySalary, IsSalaryCredited, Account_AccountID)
VALUES 
(2500.00, 0, 'account3'),
(2800.00, 1, 'account4'),
(3000.00, 1, 'account5'),
(3200.00, 0, 'account6'),
(3500.00, 1, 'account7'),
(2700.00, 0, 'account8'),
(2900.00, 1, 'account9'),
(2600.00, 1, 'account10'),
(2800.00, 0, 'account11'),
(3100.00, 1, 'account12');

-- Inserting sample data into CartItem table
/*INSERT INTO mydb.CartItem (ItemQuantity, Product_ProductID)
VALUES 
(1, 'product4'),
(2, 'product5'),
(3, 'product6'),
(4, 'product7'),
(5, 'product8'),
(1, 'product9'),
(2, 'product10'),
(3, 'product11'),
(4, 'product12'),
(5, 'product13');*/

-- Inserting sample data into Reviews table
INSERT INTO mydb.Reviews (ReviewID, Product_ProductID, User_Account_AccountID, Data, Rating)
VALUES 
(3, 'product4', 'account3', 'Great refrigerator!', 4),
(4, 'product5', 'account4', 'Nice watch.', 4),
(5, 'product6', 'account5', 'Love building with LEGO.', 5),
(6, 'product7', 'account6', 'Comfortable sofa.', 4),
(7, 'product8', 'account7', 'Best lipstick ever!', 5),
(8, 'product9', 'account8', 'Excellent football.', 4),
(9, 'product10', 'account9', 'Good quality notebook.', 4),
(10, 'product11', 'account10', 'Delicious chocolate!', 5),
(11, 'product12', 'account11', 'Great guitar for beginners.', 4),
(12, 'product13', 'account12', 'Awesome movie!', 5);

-- Inserting sample data into Employee_UPDATES_category table
INSERT INTO mydb.Employee_UPDATES_category (category_category_id, Employee_AccountID)
VALUES 
(4, 'account4'),
(5, 'account5'),
(6, 'account6'),
(7, 'account7'),
(8, 'account8'),
(9, 'account9'),
(10, 'account10'),
(11, 'account11'),
(12, 'account12'),
(13, 'account3');

-- Inserting sample data into Employee_UPDATES_Product table
INSERT INTO mydb.Employee_UPDATES_Product (Product_ProductID, Employee_AccountID)
VALUES 
('product4', 'account4'),
('product5', 'account5'),
('product6', 'account6'),
('product7', 'account7'),
('product8', 'account8'),
('product9', 'account9'),
('product10', 'account10'),
('product11', 'account11'),
('product12', 'account12'),
('product13', 'account3');

-- Inserting sample data into Membership_has_Discount table
INSERT INTO mydb.Membership_has_Discount (Membership_MembershipID, Discount_DiscountID)
VALUES 
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12);

-- Inserting sample data into CartItem_has_Session table
/*INSERT INTO mydb.CartItem_has_Session (CartItem_Product_ProductID, Session_SessionID, Session_User_Account_AccountID, ItemQuantity)
VALUES 
('product4', 3, 'account3', 1),
('product5', 4, 'account4', 2),
('product6', 5, 'account5', 3),
('product7', 6, 'account6', 4),
('product8', 7, 'account7', 5),
('product9', 8, 'account8', 1),
('product10', 9, 'account9', 2),
('product11', 10, 'account10', 3),
('product12', 11, 'account11', 4),
('product13', 12, 'account12', 5);*/