--------- TABLE CREATION -------
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
 
DROP SCHEMA mydb;
CREATE SCHEMA IF NOT EXISTS mydb;

USE mydb ;

CREATE TABLE IF NOT EXISTS mydb.Account (
  emailID VARCHAR(255) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  Password VARCHAR(45) NOT NULL,
  PhoneNumber VARCHAR(10) NOT NULL,
  Address VARCHAR(45) NOT NULL,
  SessionID INT NOT NULL,
  isEmployee INT NOT NULL,
  AccountID VARCHAR(45) NOT NULL,
  PRIMARY KEY (AccountID) 
);

CREATE TABLE IF NOT EXISTS mydb.category (
  category_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (category_id)
);

CREATE TABLE IF NOT EXISTS mydb.Product (
  ProductID VARCHAR(255) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  Cost DECIMAL(10,2) NOT NULL,
  Description VARCHAR(45) NULL,
  Discount DECIMAL(10,2) NULL,
  Rating DECIMAL(3,1) NULL,
  Quantity INT NOT NULL,
  category_category_id INT NOT NULL,
  PRIMARY KEY (ProductID),
  INDEX fk_ProductID_idx(ProductID ASC) VISIBLE,
  INDEX fk_Product_category1_idx (category_category_id ASC) VISIBLE,
  CONSTRAINT fk_Product_category1
    FOREIGN KEY (category_category_id)
    REFERENCES mydb.category (category_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS mydb.Membership (
  MembershipID INT NOT NULL,
  NumberofMembers INT NOT NULL,
  PRIMARY KEY (MembershipID)
);

CREATE TABLE IF NOT EXISTS mydb.Discount (
  DiscountID INT NOT NULL,
  Percentage DECIMAL(10,2) NOT NULL,
  -- category_category_id INT NOT NULL,
  category_category_id1 INT NOT NULL,
  PRIMARY KEY (DiscountID),
  INDEX fk_Discount_category1_idx (category_category_id1 ASC) VISIBLE,
  CONSTRAINT fk_Discount_category1
    FOREIGN KEY (category_category_id1)
    REFERENCES mydb.category (category_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS mydb.CART (
  CartID INT NOT NULL,
  PRIMARY KEY (CartID)
);

CREATE TABLE IF NOT EXISTS mydb.Purchase_History (
  HistoryID INT NOT NULL,
  PRIMARY KEY (HistoryID)
);

CREATE TABLE IF NOT EXISTS mydb.User (
  MembershipStartDate DATE NOT NULL,
  MembershipEndDate DATE NULL,
  Cart INT NULL,
  Purchase_History INT NULL,
  Membership_MembershipID INT NOT NULL,
  Account_AccountID VARCHAR(45) NOT NULL,
  CART_CartID INT NOT NULL,
  Purchase_History_HistoryID INT NOT NULL,
  PRIMARY KEY (Account_AccountID),
  INDEX fk_User_Account1_idx (Account_AccountID ASC) VISIBLE,
  INDEX fk_User_CART1_idx (CART_CartID ASC) VISIBLE,
  INDEX fk_User_Purchase_History1_idx (Purchase_History_HistoryID ASC) VISIBLE,
  CONSTRAINT fk_User_Membership
    FOREIGN KEY (Membership_MembershipID)
    REFERENCES mydb.Membership (MembershipID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_User_Account1
    FOREIGN KEY (Account_AccountID)
    REFERENCES mydb.Account (AccountID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_User_CART1
    FOREIGN KEY (CART_CartID)
    REFERENCES mydb.CART (CartID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_User_Purchase_History1
    FOREIGN KEY (Purchase_History_HistoryID)
    REFERENCES mydb.Purchase_History (HistoryID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS mydb.Session (
  SessionID INT NOT NULL,
  CartValue DECIMAL(10,2) NOT NULL,
  Membership_MembershipID INT NOT NULL,
  User_Account_AccountID VARCHAR(45) NOT NULL,
  CART_CartID INT NOT NULL,
  Purchase_History_HistoryID INT NOT NULL,
  PRIMARY KEY (SessionID),
  INDEX fk_Session_User1_idx (User_Account_AccountID ASC) VISIBLE,
  INDEX fk_Session_CART1_idx (CART_CartID ASC) VISIBLE,
  INDEX fk_Session_Purchase_History1_idx (Purchase_History_HistoryID ASC) VISIBLE,
  CONSTRAINT fk_Session_User1
    FOREIGN KEY (User_Account_AccountID)
    REFERENCES mydb.User (Account_AccountID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Session_CART1
    FOREIGN KEY (CART_CartID)
    REFERENCES mydb.CART (CartID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Session_Purchase_History1
    FOREIGN KEY (Purchase_History_HistoryID)
    REFERENCES mydb.Purchase_History (HistoryID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS mydb.Employee (
  MonthlySalary DECIMAL(10,2) NOT NULL,
  IsSalaryCredited BINARY(1) NOT NULL,
  Account_AccountID VARCHAR(45) NOT NULL,
  PRIMARY KEY (Account_AccountID),
  INDEX fk_Employee_Account1_idx (Account_AccountID ASC) VISIBLE,
  CONSTRAINT fk_Employee_Account1
    FOREIGN KEY (Account_AccountID)
    REFERENCES mydb.Account (AccountID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS mydb.CartItem (
  ItemQuantity INT NOT NULL,
  Product_ProductID VARCHAR(255) NOT NULL,
  INDEX fk_CartItem_Product1_idx (Product_ProductID ASC) VISIBLE,
  CONSTRAINT fk_CartItem_Product1
    FOREIGN KEY (Product_ProductID )
    REFERENCES mydb.Product (ProductID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS mydb.Reviews (
  ReviewID INT NOT NULL,
  Product_ProductID VARCHAR(255) NOT NULL,
  User_Account_AccountID VARCHAR(45) NOT NULL,
  Data VARCHAR(150) NULL,
  Rating INT NOT NULL,
  PRIMARY KEY (ReviewID),
  INDEX fk_Reviews_Product1_idx (Product_ProductID ASC) VISIBLE,
  INDEX fk_Reviews_User1_idx (User_Account_AccountID ASC) VISIBLE,
  CONSTRAINT fk_Reviews_Product1
    FOREIGN KEY (Product_ProductID)
    REFERENCES mydb.Product (ProductID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Reviews_User1
    FOREIGN KEY (User_Account_AccountID)
    REFERENCES mydb.User (Account_AccountID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS mydb.Employee_UPDATES_category (
  category_category_id INT NOT NULL,
  Employee_AccountID VARCHAR(45) NOT NULL,
  PRIMARY KEY (category_category_id, Employee_AccountID),
  INDEX fk_Employee_has_category_category1_idx (category_category_id ASC) VISIBLE,
  INDEX fk_Employee_UPDATES_category_Employee1_idx (Employee_AccountID ASC) VISIBLE,
  CONSTRAINT fk_Employee_has_category_category1
    FOREIGN KEY (category_category_id)
    REFERENCES mydb.category (category_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Employee_UPDATES_category_Employee1
    FOREIGN KEY (Employee_AccountID)
    REFERENCES mydb.Employee (Account_AccountID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS mydb.Employee_UPDATES_Product (
  Product_ProductID VARCHAR(255) NOT NULL,
  Employee_AccountID VARCHAR(45) NOT NULL,
  PRIMARY KEY (Product_ProductID, Employee_AccountID),
  INDEX fk_Employee_has_Product_Product1_idx (Product_ProductID ASC) VISIBLE,
  INDEX fk_Employee_UPDATES_Product_Employee1_idx (Employee_AccountID ASC) VISIBLE,
  CONSTRAINT fk_Employee_has_Product_Product1
    FOREIGN KEY (Product_ProductID)
    REFERENCES mydb.Product (ProductID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Employee_UPDATES_Product_Employee1
    FOREIGN KEY (Employee_AccountID)
    REFERENCES mydb.Employee (Account_AccountID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS mydb.Membership_has_Discount (
  Membership_MembershipID INT NOT NULL,
  Discount_DiscountID INT NOT NULL,
  PRIMARY KEY (Membership_MembershipID, Discount_DiscountID),
  INDEX fk_Membership_has_Discount_Discount1_idx (Discount_DiscountID ASC) VISIBLE,
  INDEX fk_Membership_has_Discount_Membership1_idx (Membership_MembershipID ASC) VISIBLE,
  CONSTRAINT fk_Membership_has_Discount_Membership1
    FOREIGN KEY (Membership_MembershipID)
    REFERENCES mydb.Membership (MembershipID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Membership_has_Discount_Discount1
    FOREIGN KEY (Discount_DiscountID)
    REFERENCES mydb.Discount (DiscountID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

/*CREATE TABLE IF NOT EXISTS mydb.CartItem_has_Session (
  CartItem_Product_ProductID VARCHAR(255) NOT NULL,
  Session_SessionID INT NOT NULL,
  Session_User_Account_AccountID VARCHAR(45) NOT NULL,
  ItemQuantity INT NOT NULL,
  PRIMARY KEY (CartItem_Product_ProductID, Session_SessionID, Session_User_Account_AccountID),
  INDEX fk_CartItem_has_Session_Session1_idx (Session_SessionID ASC, Session_User_Account_AccountID ASC) VISIBLE,
  INDEX fk_CartItem_has_Session_CartItem1_idx (CartItem_Product_ProductID ASC) VISIBLE,
  CONSTRAINT fk_CartItem_has_Session_CartItem1
    FOREIGN KEY (CartItem_Product_ProductID)
    REFERENCES mydb.CartItem (Product_ProductID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CartItem_has_Session_Session1
    FOREIGN KEY (Session_SessionID )
    REFERENCES mydb.Session (SessionID )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);*/

/*ALTER TABLE mydb.Account
ADD COLUMN login_attempts INT DEFAULT 0;

CREATE TRIGGER on_three_incorrect_attempts
BEFORE UPDATE ON account
FOR EACH ROW 
	DELETE FROM account
    WHERE AccountID = NEW.AccountID AND NEW.login_attempts = 3;*/
    
DELIMITER //

CREATE TRIGGER update_product_quantity
AFTER INSERT ON mydb.CartItem
FOR EACH ROW
BEGIN
    UPDATE mydb.Product
    SET Quantity = Quantity - NEW.ItemQuantity
    WHERE ProductID = NEW.Product_ProductID;
END//

DELIMITER ;

/*DELIMITER //

CREATE TRIGGER update_product_quantity2
AFTER UPDATE ON mydb.CartItem
FOR EACH ROW
BEGIN
    IF OLD.CartItemID IS NULL THEN
     Insert operation - no old quantity 
       SET old_quantity = 0;
	if NEW.ItemQuantity>OLD.ItemQuantity THEN
    UPDATE mydb.Product
    SET Quantity = Quantity - 1
    WHERE ProductID = NEW.Product_ProductID;
    ELSEIF NEW.ItemQuantity<OLD.ItemQuantity THEN
    UPDATE mydb.Product
    SET Quantity = Quantity + 1
    WHERE ProductID = NEW.Product_ProductID;
    end if;
END//

DELIMITER ;*/

/*DELIMITER //
CREATE TRIGGER update_product_quantity2
AFTER UPDATE ON mydb.CartItem
FOR EACH ROW
BEGIN
  IF OLD.CartItemID IS NULL THEN
    SET old_quantity = 0;
  ELSE
    SET old_quantity = OLD.ItemQuantity;  -- Use OLD.ItemQuantity for updates
  END IF;

  SET new_quantity = NEW.ItemQuantity;

  SELECT Quantity INTO product_quantity
  FROM mydb.Product
  WHERE ProductID = NEW.Product_ProductID;

  IF new_quantity > old_quantity THEN
    UPDATE mydb.Product
    SET Quantity = Quantity - (new_quantity - old_quantity)
    WHERE ProductID = NEW.Product_ProductID;
  ELSEIF new_quantity < old_quantity THEN
    UPDATE mydb.Product
    SET Quantity = Quantity + (old_quantity - new_quantity)
    WHERE ProductID = NEW.Product_ProductID;
  END IF;
END //
DELIMITER ;*/

DELIMITER //

CREATE TRIGGER update_product_quantity_on_cartitem_update
AFTER UPDATE ON mydb.CartItem
FOR EACH ROW
BEGIN
    DECLARE updated_quantity INT;
    
    -- Calculate the difference in quantity
    SET updated_quantity = NEW.ItemQuantity - OLD.ItemQuantity;
    
    -- Update the product quantity in the Product table
    UPDATE mydb.Product
    SET Quantity = Quantity - updated_quantity
    WHERE ProductID = NEW.Product_ProductID;
END//

DELIMITER ;

DELIMITER $$
CREATE TRIGGER validate_cart_item_product
BEFORE INSERT ON CartItem
FOR EACH ROW
BEGIN
    DECLARE product_exists INT;
    SELECT COUNT(*) INTO product_exists
    FROM Product
    WHERE ProductID = NEW.Product_ProductID;
    IF product_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product does not exist';
    END IF;
END$$
DELIMITER ;






SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

