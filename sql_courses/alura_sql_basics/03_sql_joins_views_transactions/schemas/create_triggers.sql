/*
* File: create_triggers.sql
* Purpose: Define triggers for automated calculations in the order management system
* Author: System team
* Created: 2024
*/

-- Trigger: CalculaFaturamentoDiario
-- Description: Calculates the total daily revenue whenever a new order item is inserted
-- Trigger timing: After each insert operation on itenspedidos table
-- Scope: For each row
DELIMITER //

CREATE TRIGGER CalculaFaturamentoDiario
AFTER INSERT ON itenspedidos
FOR EACH ROW
BEGIN
    -- Update existing daily revenue records or insert new ones
    INSERT INTO FaturamentoDiario (Dia, FaturamentoTotal)
    SELECT 
        DATE(p.datahorapedido) AS Dia,          -- Convert timestamp to date
        SUM(ip.precounitario) AS FaturamentoTotal  -- Calculate daily total
    FROM pedidos p
    JOIN itenspedidos ip ON p.idpedido = ip.idpedido
    GROUP BY Dia
    ON DUPLICATE KEY UPDATE
        FaturamentoTotal = VALUES(FaturamentoTotal);
END;
//
DELIMITER ;
