/*
* File: create_triggers.sql
* Purpose: Define triggers for automated calculations in the order management system.
* Author: System team
* Created: 2024
*/

-- Trigger: CalculaFaturamentoDiario
-- Purpose: Automates the calculation of daily revenue whenever a new item is added to an order.
-- Trigger Timing: AFTER INSERT operation on the 'itenspedidos' table.
-- Scope: Executes for each row inserted into the 'itenspedidos' table.
-- Details:
-- - Updates the daily revenue for the date associated with the new order.
-- - If the date already exists in 'FaturamentoDiario', updates the existing record.
-- - If the date does not exist, inserts a new record with the calculated revenue.
-- - Uses an ON DUPLICATE KEY UPDATE strategy to handle conflicts.
DELIMITER //

CREATE TRIGGER CalculaFaturamentoDiario
AFTER INSERT ON itenspedidos
FOR EACH ROW
BEGIN
    -- Insert a new record or update an existing one in 'FaturamentoDiario'.
    INSERT INTO FaturamentoDiario (Dia, FaturamentoTotal)
    SELECT 
        DATE(p.datahorapedido) AS Dia,          -- Extract the date from the timestamp in 'pedidos'.
        SUM(ip.precounitario) AS FaturamentoTotal  -- Sum the unit prices of items for the day.
    FROM pedidos p
    JOIN itenspedidos ip ON p.idpedido = ip.idpedido
    GROUP BY Dia
    ON DUPLICATE KEY UPDATE
        FaturamentoTotal = VALUES(FaturamentoTotal);  -- Update the total if a record already exists.
END;
//
DELIMITER ;
