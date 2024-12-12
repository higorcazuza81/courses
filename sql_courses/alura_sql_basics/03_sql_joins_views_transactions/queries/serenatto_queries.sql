/*
* File: sql_queries.sql
* Purpose: This file contains SQL queries for data analysis and manipulation from the Serenatto Café system.
* Author: System team
* Created: 2024
*/

-- Retrieves all records from the 'colaboradores' table.
-- Includes information such as name, role, phone number, and address.
SELECT *
FROM colaboradores;

-- Retrieves all records from the 'produtos' table.
-- Includes details such as name, description, price, and category.
SELECT *
FROM produtos;

-- Retrieves all records from the 'fornecedores' table.
-- Includes data about suppliers, such as contact and address.
SELECT *
FROM fornecedores;

-- Retrieves all records from the 'clientes' table.
-- Includes information such as name, phone number, email, and address.
SELECT *
FROM clientes;

-- Combines the addresses of collaborators and suppliers into a single result set.
-- Uses the UNION operation to remove duplicates between the sets.
SELECT Rua, Bairro, Cidade, Estado, CEP
FROM colaboradores
UNION
SELECT Rua, Bairro, Cidade, Estado, CEP
FROM fornecedores;

-- Combines the addresses of collaborators and suppliers into a single result set.
-- Uses the UNION ALL operation to include duplicates.
SELECT Rua, Bairro, Cidade, Estado, CEP
FROM colaboradores
UNION ALL
SELECT Rua, Bairro, Cidade, Estado, CEP
FROM fornecedores;

-- Searches for the ID of the customer who placed the first order based on specific date and time.
-- Filters records in the 'pedidos' table using the DataHoraPedido criterion.
SELECT idcliente
FROM pedidos
WHERE DataHoraPedido = '2023-01-02 08:15:00';

-- Retrieves the name and phone number of the customer who placed the first order.
-- Uses a subquery to identify the customer's ID.
SELECT Nome, Telefone
FROM clientes
WHERE id = (
    SELECT idcliente
    FROM pedidos
    WHERE DataHoraPedido = '2023-01-02 08:15:00'
);

-- Retrieves the names of customers who placed orders in January 2023.
-- Uses a subquery to filter customer IDs who made orders during this period.
SELECT Nome
FROM clientes
WHERE id IN (
    SELECT idcliente
    FROM pedidos
    WHERE strftime('%m', DataHoraPedido) = '01'
);

-- Retrieves the names and prices of products whose price is above the average.
-- Calculates the average price with a subquery and filters the results with HAVING.
SELECT nome, preco
FROM produtos
GROUP BY nome, preco
HAVING preco > (
    SELECT AVG(preco)
    FROM produtos
);

-- Relates customers with orders placed, showing the customer's name, order ID, and order date/time.
-- Uses INNER JOIN to combine the 'clientes' and 'pedidos' tables.
SELECT c.nome, p.id, p.DataHoraPedido
FROM clientes c
INNER JOIN pedidos p 
ON c.id = p.idcliente;

-- Checks which products were ordered in October.
-- Uses JOIN to relate 'produtos' and the ordered items filtered by month.
SELECT pr.nome, x.idproduto, x.idpedido 
FROM (
    SELECT ip.idpedido, ip.idproduto
    FROM pedidos p
    JOIN itenspedidos ip 
    ON p.id = ip.idpedido
    WHERE strftime('%m', p.DataHoraPedido) = '10'
) x
RIGHT JOIN produtos pr
ON pr.id = x.idproduto;

-- Retrieves the names of customers who did not place orders in October.
-- Uses LEFT JOIN to relate 'clientes' and a subquery that filters orders in October.
SELECT c.nome, x.id
FROM clientes c 
LEFT JOIN (
    SELECT p.id, p.idcliente
    FROM pedidos p
    WHERE strftime('%m', p.DataHoraPedido) = '10'
) x
ON c.id = x.idcliente
WHERE x.idcliente IS NULL;

-- Retrieves orders that do not have an associated customer.
-- Uses FULL JOIN to combine 'clientes' and 'pedidos', showing orphan records from both sides.
SELECT c.nome, p.id
FROM clientes c
FULL JOIN pedidos p
ON c.id = p.idcliente
WHERE c.id IS NULL;

-- Displays the customer's name and the total value of each order.
-- Uses JOIN to combine tables, GROUP BY to group results by order, and SUM to calculate the total value.
SELECT p.id, c.nome, p.DataHoraPedido, SUM(ip.precounitario) AS ValorTotalPedido
FROM pedidos p
JOIN clientes c 
ON p.idcliente = c.id
JOIN itenspedidos ip
ON p.id = ip.idpedido
GROUP BY p.id, c.nome;

-- Displays the results from the view created for the total order value.
SELECT * FROM ViewValorTotalPedido;

-- Displays all records from the 'pedidos' table.
SELECT * FROM pedidos;

-- Displays the daily revenue based on the configured view.
SELECT * FROM FaturamentoDiario;

-- Checks specific products after updates were made.
SELECT * FROM produtos WHERE id = 31 OR id = 28;

-- Checks the deletion of the collaborator with ID 3.
SELECT * FROM colaboradores;

-- Checks the update of the order status from 'in progress' to 'completed'.
SELECT * FROM pedidos;
