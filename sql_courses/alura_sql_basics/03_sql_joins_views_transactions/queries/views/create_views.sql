-- CRIAÇÃO DE VIEWS

/*
* Esta consulta SQL cria uma view chamada 'ViewValorTotalPedido' que exibe o ID do pedido,
* o nome do cliente, a data e hora do pedido e o valor total de cada pedido.
*
* Operação utilizada:
* - CREATE VIEW: Cria uma view com os resultados da consulta.
*
* Tabelas envolvidas:
* - clientes: Contém os dados dos clientes.
* - pedidos: Contém informações sobre os pedidos realizados.
* - itenspedidos: Contém detalhes dos itens pedidos.
*
* Colunas selecionadas:
* - p.id: O identificador único do pedido.
* - c.nome: O nome do cliente.
* - p.DataHoraPedido: A data e hora em que o pedido foi realizado.
* - SUM(ip.precounitario): O valor total do pedido.
*/
CREATE VIEW ViewValorTotalPedido AS
SELECT p.id, c.nome, p.DataHoraPedido, SUM(ip.precounitario) AS ValorTotalPedido
FROM pedidos p
JOIN clientes c 
ON p.idcliente = c.id
JOIN itenspedidos ip
ON p.id = ip.idpedido
GROUP BY p.id, c.nome;

