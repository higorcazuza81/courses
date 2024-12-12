/*
* File: update_data.sql
* Purpose: Update existing information in the Serenatto Café database.
* Author: System team
* Created: 2024
*/

-- Enabling foreign keys
-- The PRAGMA command ensures that referential integrity constraints are respected
-- during update and delete operations.
PRAGMA foreign_keys = ON;

-- Updating data in the 'produtos' table
-- Updates the price of the product with ID 31.
-- The current price will be set to 13.0.
UPDATE produtos 
SET preco = 13.0 
WHERE id = 31;

-- Updates the description of the product with ID 28.
-- The description will be changed to 'Croissant recheado com amêndoas'.
UPDATE produtos 
SET descricao = 'Croissant recheado com amêndoas' 
WHERE id = 28;

-- Querying updated product records
-- Displays products with IDs 31 and 28 to verify the applied changes.
SELECT * 
FROM produtos 
WHERE id = 31 OR id = 28;

-- Deleting data in the 'colaboradores' table
-- Removes the record of the collaborator with ID 3.
-- This deletion is permanent and cannot be reversed without a backup.
DELETE FROM colaboradores 
WHERE id = 3;

-- Updating data in the 'pedidos' table
-- Updates the status of all orders with status 'Em Andamento' to 'Concluído'.
-- Ensures that orders in progress are marked as completed.
UPDATE pedidos 
SET status = 'Concluído' 
WHERE status = 'Em Andamento';
