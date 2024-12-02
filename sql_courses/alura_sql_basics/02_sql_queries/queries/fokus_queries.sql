-- ====================================================
-- Course: Executing SQL Queries - Alura
-- Database: Fokus
-- Description: SQL queries made in the course for the company Fokus.
-- Objective: Solve HR company demands for Fokus using SQL.
-- ====================================================

-- ===============================================
-- 1. List the top 5 employees with the highest salary
-- ===============================================
SELECT * 
FROM HistoricoEmprego
ORDER BY Salario DESC
LIMIT 5;

-- ===============================================
-- 2. List the top 5 employees with the highest salary
--    considering active contracts
-- ===============================================
SELECT * 
FROM HistoricoEmprego
WHERE datatermino IS NULL
ORDER BY Salario DESC
LIMIT 5;

-- ===============================================
-- 3. Display all data from the Treinamento table
-- ===============================================
SELECT * 
FROM Treinamento;

-- ===============================================
-- 4. Search for courses with names starting with 'O poder'
-- ===============================================
SELECT * 
FROM Treinamento
WHERE Curso LIKE 'O poder%';

-- ===============================================
-- 5. Search for professors without an active contract
-- ===============================================
SELECT * 
FROM HistoricoEmprego
WHERE Cargo = 'Professor' 
  AND datatermino IS NOT NULL;

-- ===============================================
-- 6. Search for Ophthalmologists or Dermatologists
-- ===============================================
SELECT * 
FROM HistoricoEmprego
WHERE Cargo = 'Oftalmologista' 
   OR Cargo = 'Dermatologista';

-- ===============================================
-- 7. Retrieve all employees with the positions of
--    Ophthalmologists, Dermatologists, and Professors
-- ===============================================
SELECT * 
FROM HistoricoEmprego
WHERE Cargo IN ('Oftalmologista', 'Dermatologista', 'Professor');

-- ===============================================
-- 8. Search for courses with partial name and institution
--    using partial name and institution as criteria
-- ===============================================
SELECT * 
FROM Treinamento
WHERE (Curso LIKE 'O direito%' AND Instituicao = 'da Rocha')
   OR (Curso LIKE 'O conforto%' AND Instituicao = 'das Neves');

-- ===============================================
-- 9. Display all data from the Faturamento table
-- ===============================================
SELECT * 
FROM Faturamento;

-- ===============================================
-- 10. Check the highest monthly gross revenue
-- ===============================================
SELECT mes, MAX(faturamento_bruto) 
FROM Faturamento;

-- ===============================================
-- 11. Total new clients in 2023
-- ===============================================
SELECT SUM(numero_novos_clientes) AS 'Novos clientes 2023' 
FROM Faturamento
WHERE mes LIKE '%2023';

-- ===============================================
-- 12. Average company expenses
-- ===============================================
SELECT AVG(despesas) AS 'Despesas médias' 
FROM Faturamento;

-- ===============================================
-- 13. Average company net profit
-- ===============================================
SELECT AVG(lucro_liquido) AS 'Lucro médio' 
FROM Faturamento;

-- ===============================================
-- 14. Count of terminated employment contracts
-- ===============================================
SELECT COUNT(datatermino) AS 'Contratos encerrados' 
FROM HistoricoEmprego
WHERE datatermino IS NOT NULL;

-- ===============================================
-- 15. Types of kinship for employee dependents
-- ===============================================
SELECT parentesco, COUNT(*) 
FROM Dependentes
GROUP BY parentesco;

-- ===============================================
-- 16. Number of courses offered by each institution
-- ===============================================
SELECT Instituicao, COUNT(*) 
FROM Treinamento
GROUP BY Instituicao
HAVING COUNT(*) > 2;

-- ===============================================
-- 17. Display the number of characters of each employee's CPF
-- ===============================================
SELECT nome, LENGTH(cpf) AS qtd 
FROM Colaboradores
WHERE LENGTH(cpf) = 11;

-- ===============================================
-- 18. Count of employees with an 11-character CPF
-- ===============================================
SELECT COUNT(*), LENGTH(cpf) AS qtd 
FROM Colaboradores
WHERE LENGTH(cpf) = 11;

-- ===============================================
-- 19. Create a personalized message with name, CPF, and address
-- ===============================================
SELECT ('A pessoa colaboradora ' || nome || ' de CPF ' || cpf || 
        ' possui o seguinte endereço: ' || endereco) AS Texto 
FROM Colaboradores;

-- ===============================================
-- 20. Display the formatted start date of the leave
-- ===============================================
SELECT id_colaborador, STRFTIME('%Y/%m', datainicio) 
FROM Licencas;

-- ===============================================
-- 21. Calculate the number of days between hiring and contract termination
-- ===============================================
SELECT id_colaborador, JULIANDAY(datatermino) - JULIANDAY(datacontratacao) AS dias 
FROM HistoricoEmprego
WHERE datatermino IS NOT NULL;

-- ===============================================
-- 22. Average gross revenue rounded
-- ===============================================
SELECT AVG(faturamento_bruto), ROUND(AVG(faturamento_bruto), 2) 
FROM Faturamento;

-- ===============================================
-- 23. Round down gross revenue and expenses values
-- ===============================================
SELECT FLOOR(faturamento_bruto), FLOOR(despesas) 
FROM Faturamento;

-- ===============================================
-- 24. Create a personalized message with average gross revenue and average net revenue
-- ===============================================
SELECT ('O faturamento bruto médio foi ' || CAST(ROUND(AVG(faturamento_bruto), 2) AS TEXT) || 
        ' e o faturamento líquido médio foi ' || CAST(ROUND(AVG(lucro_liquido), 2) AS TEXT)) AS Texto 
FROM Faturamento;

-- ===============================================
-- 25. Salary classification based on salary range
-- ===============================================
SELECT id_colaborador, cargo, salario,
       CASE
           WHEN salario < 3000 THEN 'Baixo'
           WHEN salario BETWEEN 3000 AND 6000 THEN 'Médio'
           ELSE 'Alto'
       END AS categoria_salario
FROM HistoricoEmprego;

-- ===============================================
-- 26. Rename the 'HistoricoEmprego' table to 'CargosColaboradores'
-- ===============================================
ALTER TABLE HistoricoEmprego RENAME TO CargosColaboradores;

-- ===============================================
-- 27. Verify the data from the table with the new name 'CargosColaboradores'
-- ===============================================
SELECT * 
FROM CargosColaboradores;
