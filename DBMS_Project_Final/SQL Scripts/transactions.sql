-- TRANSACTIONS

-- 1. Conflicting Transactions

-- Outer T1 shows products after updation

use mydb;

START TRANSACTION; -- Outer Transaction 1
    START TRANSACTION; -- Inner Transaction 1
    -- Inner Transaction 1 logic
    UPDATE product 
    SET Cost = Cost - 10 
    WHERE ProductID = 'Product10';
    COMMIT; -- Inner Transaction 1
    
    -- Outer Transaction 1 logic
    SELECT * FROM product;
COMMIT; -- Outer Transaction 1
-- ==================================================
-- Outer T1 shows sum after addition of new row
START TRANSACTION; -- Outer Transaction 4
    START TRANSACTION; -- Inner Transaction 4
    -- Inner Transaction 4 logic
    INSERT INTO product 
    VALUES (200,'item', 50,'good',12.0,5,10,4);
    COMMIT; -- Inner Transaction 4
    
    -- Outer Transaction 4 logic
    SELECT SUM(Cost) FROM product;
COMMIT; -- Outer Transaction 4
-- ====================================================
-- ====================================================

-- 2. Non-Conflicting Transactions

-- since the both transaction do thge same thing, order does not matter
START TRANSACTION; -- Outer Transaction 1
    START TRANSACTION; -- Inner Transaction 1
    -- Inner Transaction 1 logic
    UPDATE product
    SET Cost = Cost - 10 
    WHERE ProductId = 'Product10';
    COMMIT; -- Inner Transaction 1
    
    -- Outer Transaction 1 logic
    UPDATE product 
    SET Cost = Cost - 10
    WHERE ProductId = 'Product10';
COMMIT; -- Outer Transaction 1
-- ==================================================
-- 10% price reduction on product1
START TRANSACTION;
UPDATE mydb.Product 
SET Cost = Cost * 0.9 
WHERE ProductID = 'product1';
COMMIT;
-- ==================================================
-- Read product information
START TRANSACTION;
SELECT * FROM mydb.product; -- Retrieve product data for display or analysis
COMMIT;
-- ==================================================
-- Update product price
START TRANSACTION;
UPDATE product
SET Cost = Cost- 10 
WHERE ProductId = 'product10'; -- Decrease price of a specific product
COMMIT;