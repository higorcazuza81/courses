-- File: 01_queries.sql

-- This query selects all columns and rows from the 'categorias' table.
SELECT * FROM categorias;


-- This query counts the total number of rows in the 'categorias' table
-- and returns the result as 'Qtd_Categorias'.
SELECT COUNT(*) AS Qtd_Categorias FROM categorias;

-- This query counts the total number of clients in the 'clientes' table
-- and returns the result as 'Qtd_Clientes'.
SELECT COUNT(*) AS Qtd_Clientes FROM clientes;


-- This query counts the total number of suppliers in the 'fornecedores' table
-- and returns the result with the alias 'Qtd_Fornecedores'.
SELECT COUNT(*) AS Qtd_Fornecedores FROM fornecedores;


-- This query counts the total number of items sold in the 'itens_venda' table.
-- The result is returned as 'Qtd_ItensVenda'.
SELECT COUNT(*) AS Qtd_ItensVenda FROM itens_venda;


-- This query counts the total number of rows in the 'marcas' table
-- and returns the result as 'Qtd_marcas'.
SELECT COUNT(*) AS Qtd_marcas FROM marcas;


-- This query counts the total number of products in the 'produtos' table.
-- The result is returned in a column named 'Qtd_Produtos'.
SELECT COUNT(*) AS Qtd_Produtos FROM produtos;


-- This query counts the total number of sales records in the 'vendas' table.
-- It returns the count as 'Qtd_Vendas'.
SELECT COUNT(*) AS Qtd_Vendas FROM vendas;

-- This query selects all columns from the 'vendas' table and limits the result to the first 5 rows.
SELECT * FROM vendas LIMIT 5;

-- Select distinct years from the 'vendas' table
-- This query retrieves a list of unique years from the 'data_venda' column in the 'vendas' table.
-- The results are ordered by year in ascending order.
SELECT DISTINCT (strftime('%Y', data_venda)) AS Ano FROM vendas
ORDER BY Ano;

-- Select distinct years and count of sales per year from the 'vendas' table
-- This query retrieves a list of unique years along with the total number of sales (id_venda) for each year from the 'vendas' table.
-- The results are grouped by year and ordered by year in ascending order.
SELECT DISTINCT (strftime('%Y', data_venda)) AS Ano,
Count(id_venda) AS Total_Vendas
 FROM vendas
GROUP BY Ano
ORDER BY Ano;


-- Select distinct years, months, and count of sales per month from the 'vendas' table
-- This query retrieves a list of unique years and months along with the total number of sales (id_venda) for each month from the 'vendas' table.
-- The results are grouped by year and month, and ordered by year in ascending order.
SELECT DISTINCT (strftime('%Y', data_venda)) AS Ano,(strftime('%m', data_venda)) AS Mes,Count(id_venda) AS Total_Vendas
FROM vendas
WHERE Mes = '01' OR Mes ='11' OR Mes = '12'
GROUP BY Ano, Mes
ORDER BY Ano;
