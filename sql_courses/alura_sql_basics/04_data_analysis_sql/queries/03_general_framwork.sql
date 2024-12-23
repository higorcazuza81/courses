-- GENERAL FRAMEWORK
SELECT Mes,
    SUM(CASE WHEN Ano='2020' THEN Qtd_Vendas ELSE 0 END) AS "2020",
    SUM(CASE WHEN Ano='2021' THEN Qtd_Vendas ELSE 0 END) AS "2021",
    SUM(CASE WHEN Ano='2022' THEN Qtd_Vendas ELSE 0 END) AS "2022",
    SUM(CASE WHEN Ano='2023' THEN Qtd_Vendas ELSE 0 END) AS "2023"
FROM (
    SELECT strftime('%m', data_venda) AS Mes,
        strftime('%Y', data_venda) AS Ano,
        COUNT(*) AS Qtd_Vendas
    FROM Vendas
    GROUP BY Mes, Ano
    ORDER BY Mes
)
GROUP BY Mes;

-- Metric of the current Black Friday overcoming in comparison to past ones
WITH Media_Vendas_Anteriores AS (SELECT AVG(Qtd_Vendas) AS Media_Qtd_Vendas
FROM (
    SELECT COUNT(*) AS Qtd_Vendas, strftime("%Y", v.data_venda) AS Ano
    FROM vendas v
    WHERE strftime("%m", v.data_venda) = "11" AND Ano != "2022"
    GROUP BY Ano
)), Vendas_Atual AS (SELECT Qtd_Vendas AS Qtd_Vendas_Atual
FROM(
    SELECT COUNT(*) AS Qtd_Vendas, strftime("%Y", v.data_venda) AS Ano
    FROM vendas v
    WHERE strftime("%m", v.data_venda) = "11" AND Ano = "2022"
    GROUP BY Ano
    ))
    SELECT
    mva.Media_Qtd_Vendas,
    va.Qtd_Vendas_Atual,
    ROUND((va.Qtd_Vendas_Atual - mva.Media_Qtd_Vendas)/mva.Media_Qtd_Vendas *100.0, 2) || "%" AS Porcentagem
    FROM Vendas_Atual va, Media_Vendas_Anteriores mva;