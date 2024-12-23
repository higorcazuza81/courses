/* MEETING AGENDA
1. Role of suppliers in Black Friday
2. Black Friday product categories
3. Performance of previous Black Fridays and expectations for this year
/*/

-- 1. Role of suppliers in Black Friday
SELECT strftime("%Y/%m", v.data_venda) AS 'Ano/Mes', f.nome AS Nome_fornecedor, COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
JOIN Vendas v ON v.id_venda = iv.venda_id
JOIN produtos p ON iv.produto_id = p.id_produto
JOIN fornecedores f ON p.fornecedor_id = f.id_fornecedor
WHERE strftime("%m", v.data_venda) = '11'
GROUP BY Nome_fornecedor, "Ano/Mes"
ORDER BY "Ano/Mes", Qtd_Vendas DESC;

-- 2. Black Friday product categories
SELECT strftime("%Y/%m", v.data_venda) AS "Ano/Mes", c.nome_categoria AS Categoria, COUNT(iv.produto_id) AS Qtd_Vendas
FROM categorias c
JOIN produtos p ON c.id_categoria = p.categoria_id
JOIN itens_venda iv ON p.id_produto = iv.produto_id
JOIN vendas v ON iv.venda_id = v.id_venda
WHERE strftime("%m", v.data_venda) = '11'
GROUP BY Categoria, "Ano/Mes"
ORDER BY "Ano/Mes", Qtd_Vendas DESC;



-- NebulaNetworks compared to the best providers
SELECT "Ano/Mes",
SUM(CASE WHEN Nome_fornecedor == "NebulaNetworks" THEN Qtd_Vendas ELSE 0 END) AS Qdt_Vendas_NebulaNetworks,
SUM(CASE WHEN Nome_fornecedor == "HorizonDistributors" THEN Qtd_Vendas ELSE 0 END) AS Qdt_Vendas_HorizonDistributors,
SUM(CASE WHEN Nome_fornecedor == "AstroSupply" THEN Qtd_Vendas ELSE 0 END) AS Qdt_Vendas_AstroSupply
FROM(
    SELECT strftime("%Y/%m", v.data_venda) AS 'Ano/Mes', f.nome AS Nome_fornecedor, COUNT(iv.produto_id) AS Qtd_Vendas
    FROM itens_venda iv
    JOIN Vendas v ON v.id_venda = iv.venda_id
    JOIN produtos p ON iv.produto_id = p.id_produto
    JOIN fornecedores f ON p.fornecedor_id = f.id_fornecedor
    WHERE Nome_fornecedor = "NebulaNetworks" OR Nome_fornecedor = "HorizonDistributors" OR Nome_fornecedor = "AstroSupply"
    GROUP BY Nome_fornecedor, "Ano/Mes"
    ORDER BY "Ano/Mes", Qtd_Vendas
)
GROUP BY "Ano/Mes";

--Frequency distribution of categories
WITH TotalItensVenda AS (
    SELECT COUNT(*) AS Total FROM itens_venda
)
SELECT Nome_Categoria, Qtd_Vendas, ROUND(100.0 * Qtd_Vendas / Total, 2) || "%" AS Porcentagem
FROM (
    SELECT c.nome_categoria AS Nome_Categoria, COUNT(iv.produto_id) AS Qtd_Vendas
    FROM itens_venda iv
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN produtos p ON p.id_produto = iv.produto_id
    JOIN categorias c ON c.id_categoria = p.categoria_id
    GROUP BY Nome_Categoria
    ORDER BY Qtd_Vendas DESC
) AS Subquery, TotalItensVenda;