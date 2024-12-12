--- ===============================
-- SIMPLE QUERIES - DATA SELECTION
-- ===============================

-- Select all data from the 'produtos' table
SELECT * FROM produtos;

-- Select only the name and price of the products
SELECT nome, preco FROM produtos;

-- Select all products with price greater than 15
SELECT nome, preco FROM produtos WHERE preco > 15;

-- Select products with quantity greater than 100
SELECT nome, quantidade FROM produtos WHERE quantidade > 100;


-- ========================================
-- QUERIES WITH SORTING - ORDER BY
-- ========================================

-- Sort products by name in ascending order
SELECT nome, preco FROM produtos ORDER BY nome ASC;

-- Sort products by price in descending order
SELECT nome, preco FROM produtos ORDER BY preco DESC;

-- Sort products by quantity in ascending order
SELECT nome, quantidade FROM produtos ORDER BY quantidade ASC;


-- ===================================================
-- QUERIES WITH RESULT LIMITATION - LIMIT
-- ===================================================

-- Select only the top 3 products with the highest price
SELECT nome, preco FROM produtos ORDER BY preco DESC LIMIT 3;

-- Select the top 5 products with the highest quantity
SELECT nome, quantidade FROM produtos ORDER BY quantidade DESC LIMIT 5;


-- ========================================
-- QUERIES WITH AGGREGATE FUNCTIONS
-- ========================================

-- Count the total number of products
SELECT COUNT(*) AS total_produtos FROM produtos;

-- Sum the total price of all products
SELECT SUM(preco) AS total_preco FROM produtos;

-- Calculate the average price of the products
SELECT AVG(preco) AS media_preco FROM produtos;

-- Find the highest price among the products
SELECT MAX(preco) AS preco_maximo FROM produtos;

-- Find the lowest price among the products
SELECT MIN(preco) AS preco_minimo FROM produtos;
