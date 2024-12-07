-- CONSULTAS SQL

/*
 * Esta consulta SQL recupera todos os registros da tabela 'colaboradores',
 * incluindo informações como nome, cargo, telefone e endereço.
 *
 * Tabelas envolvidas:
 * - colaboradores: Contém os dados dos colaboradores da empresa.
 *
 * Colunas selecionadas:
 * - Todas as colunas da tabela 'colaboradores'.
 */
SELECT *
FROM colaboradores;

/*
 * Esta consulta SQL recupera todos os registros da tabela 'produtos',
 * exibindo detalhes como nome, descrição, preço e categoria.
 *
 * Tabelas envolvidas:
 * - produtos: Contém informações sobre os produtos disponíveis.
 *
 * Colunas selecionadas:
 * - Todas as colunas da tabela 'produtos'.
 */
SELECT *
FROM produtos;

/*
 * Esta consulta SQL retorna todos os registros da tabela 'fornecedores',
 * contendo dados sobre os fornecedores da empresa, incluindo contato e endereço.
 *
 * Tabelas envolvidas:
 * - fornecedores: Contém informações dos fornecedores cadastrados.
 *
 * Colunas selecionadas:
 * - Todas as colunas da tabela 'fornecedores'.
 */
SELECT *
FROM fornecedores;

/*
 * Esta consulta SQL recupera todas as informações da tabela 'clientes',
 * como nome, telefone, email e endereço.
 *
 * Tabelas envolvidas:
 * - clientes: Contém os dados dos clientes.
 *
 * Colunas selecionadas:
 * - Todas as colunas da tabela 'clientes'.
 */
SELECT *
FROM clientes;

/*
 * Esta consulta SQL combina os endereços (Rua, Bairro, Cidade, Estado e CEP)
 * de colaboradores e fornecedores em um único conjunto de resultados, sem duplicatas.
 *
 * Operação utilizada:
 * - UNION: Combina os resultados de duas consultas SELECT, removendo duplicatas.
 *
 * Tabelas envolvidas:
 * - colaboradores: Contém os endereços dos colaboradores.
 * - fornecedores: Contém os endereços dos fornecedores.
 *
 * Colunas selecionadas:
 * - Rua, Bairro, Cidade, Estado e CEP de ambas as tabelas.
 */
SELECT Rua,
    Bairro,
    Cidade,
    Estado,
    CEP
FROM colaboradores
UNION
SELECT Rua,
    Bairro,
    Cidade,
    Estado,
    CEP
FROM fornecedores;

/*
 * Esta consulta SQL combina os endereços (Rua, Bairro, Cidade, Estado e CEP)
 * de colaboradores e fornecedores em um único conjunto de resultados, incluindo duplicatas.
 *
 * Operação utilizada:
 * - UNION ALL: Combina os resultados de duas consultas SELECT sem remover duplicatas.
 *
 * Tabelas envolvidas:
 * - colaboradores: Contém os endereços dos colaboradores.
 * - fornecedores: Contém os endereços dos fornecedores.
 *
 * Colunas selecionadas:
 * - Rua, Bairro, Cidade, Estado e CEP de ambas as tabelas.
 */
SELECT Rua,
    Bairro,
    Cidade,
    Estado,
    CEP
FROM colaboradores
UNION ALL
SELECT Rua,
    Bairro,
    Cidade,
    Estado,
    CEP
FROM fornecedores;

/*
 * Esta consulta SQL recupera todos os registros da tabela 'clientes'.
 *
 * Tabelas envolvidas:
 * - clientes: Contém os dados dos clientes.
 *
 * Colunas selecionadas:
 * - Todas as colunas da tabela 'clientes'.
 */
SELECT *
FROM clientes;

/*
 * Esta consulta SQL pesquisa o ID do cliente que fez o primeiro pedido
 * com base na data e hora do pedido na tabela 'pedidos'.
 *
 * Tabelas envolvidas:
 * - pedidos: Contém informações sobre os pedidos realizados.
 *
 * Colunas selecionadas:
 * - idcliente: O identificador do cliente que realizou o pedido.
 *
 * Critério de filtragem:
 * - DataHoraPedido = '2023-01-02 08:15:00'.
 */
SELECT idcliente
FROM pedidos
WHERE DataHoraPedido = '2023-01-02 08:15:00';

/*
 * Esta consulta SQL recupera o nome e o telefone do cliente que fez
 * o primeiro pedido, utilizando uma subconsulta para identificar o ID do cliente.
 *
 * Operação utilizada:
 * - Subconsulta: Permite recuperar o ID do cliente em uma consulta aninhada.
 *
 * Tabelas envolvidas:
 * - clientes: Contém os dados dos clientes.
 * - pedidos: Contém informações sobre os pedidos realizados.
 *
 * Colunas selecionadas:
 * - clientes.Nome: O nome do cliente.
 * - clientes.Telefone: O telefone do cliente.
 *
 * Critério de filtragem:
 * - clientes.id = (subconsulta que recupera idcliente do primeiro pedido).
 */
SELECT Nome,
    Telefone
FROM clientes
WHERE id = (
        SELECT idcliente
        FROM pedidos
        WHERE DataHoraPedido = '2023-01-02 08:15:00'
    );

/*
 * Esta consulta SQL recupera os nomes dos clientes que realizaram pedidos
 * em janeiro de 2023, utilizando uma subconsulta para filtrar os IDs dos clientes.
 *
 * Operação utilizada:
 * - Subconsulta com IN: Verifica se o ID do cliente está presente na lista gerada pela subconsulta.
 *
 * Tabelas envolvidas:
 * - clientes: Contém os dados dos clientes.
 * - pedidos: Contém informações sobre os pedidos realizados.
 *
 * Colunas selecionadas:
 * - clientes.Nome: O nome do cliente.
 *
 * Critério de filtragem:
 * - clientes.id IN (subconsulta que recupera IDs de clientes com pedidos em janeiro de 2023).
 */
SELECT Nome
FROM clientes
WHERE id IN (
        SELECT idcliente
        FROM pedidos
        WHERE strftime('%m', DataHoraPedido) = '01'
    );

/*
 * Esta consulta SQL recupera todos os registros da tabela 'produtos'.
 *
 * Tabelas envolvidas:
 * - produtos: Contém informações sobre os produtos disponíveis.
 *
 * Colunas selecionadas:
 * - Todas as colunas da tabela 'produtos'.
 */
SELECT *
FROM produtos;

/*
 * Esta consulta SQL recupera os nomes e preços dos produtos
 * que têm um preço acima da média.
 *
 * Operação utilizada:
 * - HAVING: Filtra os grupos que atendem à condição de preço acima da média.
 * - Subconsulta: Calcula a média de preços dentro da tabela 'produtos'.
 *
 * Tabelas envolvidas:
 * - produtos: Contém informações dos produtos como nome e preço.
 *
 * Colunas selecionadas:
 * - produtos.nome: O nome do produto.
 * - produtos.preco: O preço do produto.
 *
 * Critério de filtragem:
 * - produtos.preco > média calculada (via subconsulta).
 */
SELECT nome, preco
FROM produtos
GROUP BY nome, preco
HAVING preco > (
        SELECT AVG(preco)
        FROM produtos
    );

/*
 * Esta consulta relaciona os clientes com os pedidos realizados,
 * exibindo o nome do cliente, o ID do pedido e a data e hora do pedido.
 *
 * Operação utilizada:
 * - INNER JOIN: Combina as tabelas 'clientes' e 'pedidos' com base no ID do cliente.
 *
 * Tabelas envolvidas:
 * - clientes: Contém os dados dos clientes.
 * - pedidos: Contém informações sobre os pedidos realizados.
 *
 * Colunas selecionadas:
 * - clientes.Nome: O nome do cliente.
 * - pedidos.id: O identificador único do pedido.
 * - pedidos.DataHoraPedido: A data e hora em que o pedido foi realizado.
 */
SELECT c.nome, p.id, p.DataHoraPedido
FROM clientes c
INNER JOIN pedidos p 
ON c.id = p.idcliente; 

/*
 * Esta consulta SQL verifica quais produtos já foram pedidos em outubro,
 * exibindo o nome do produto, o ID do produto e o ID do pedido.
 *
 * Operação utilizada:
 * - JOIN: Combina as tabelas 'produtos' e uma subconsulta que filtra os itens pedidos em outubro,
 *   com base no ID do produto.
 *
 * Tabelas envolvidas:
 * - produtos: Contém informações dos produtos disponíveis.
 * - itenspedidos: Contém detalhes dos itens pedidos.
 * - pedidos: Contém informações sobre os pedidos realizados.
 *
 * Colunas selecionadas:
 * - produtos.nome: O nome do produto.
 * - itenspedidos.idproduto: O identificador único do produto.
 * - itenspedidos.idpedido: O identificador único do pedido.
 */
SELECT pr.nome,  x.idproduto,  x.idpedido 
FROM(
    SELECT ip.idpedido, ip.idproduto
    FROM pedidos p
    JOIN itenspedidos ip 
    ON p.id = ip.idpedido
    WHERE strftime('%m', p.DataHoraPedido) = '10' ) x
RIGHT JOIN produtos pr
ON pr.id =  x.idproduto;

/*
 * Esta consulta SQL recupera os nomes dos clientes que não fizeram pedidos em outubro,
 * exibindo o nome do cliente e o ID do pedido.
 *
 * Operação utilizada:
 * - LEFT JOIN: Combina as tabelas 'clientes' e uma subconsulta que filtra os pedidos em outubro,
 *   com base no ID do cliente.
 *
 * Tabelas envolvidas:
 * - clientes: Contém os dados dos clientes.
 * - pedidos: Contém informações sobre os pedidos realizados.
 *
 * Colunas selecionadas:
 * - clientes.Nome: O nome do cliente.
 * - x.id: O identificador do pedido (NULL para clientes sem pedidos em outubro).
 */
SELECT c.nome, x.id
FROM clientes c 
LEFT JOIN (
    SELECT p.id, p.idcliente
    FROM pedidos p
    WHERE strftime('%m', p.DataHoraPedido) = '10')x
ON c.id = x.idcliente
WHERE x.idcliente IS NULL;

/*
* Esta consulta SQL recupera os pedidos que não possuem um cliente associado,
* exibindo o ID do pedido.
*
* Operação utilizada:
* - FULL JOIN: Combina as tabelas 'clientes' e 'pedidos' com base no ID do cliente,
*   exibindo todos os registros de ambas as tabelas.
*
* Tabelas envolvidas:
* - clientes: Contém os dados dos clientes.
* - pedidos: Contém informações sobre os pedidos realizados.
*
* Colunas selecionadas:
* - c.nome: O nome do cliente (NULL para pedidos sem cliente associado).
* - p.id: O identificador único do pedido.
*/
SELECT c.nome, p.id
FROM clientes c
FULL JOIN pedidos p
ON c.id = p.idcliente
WHERE c.id IS NULL;

/*
* Esta consulta SQL recupera o nome do cliente e o valor total de cada pedido,
* exibindo o nome do cliente, o ID do pedido, a data e hora do pedido e o valor total.
*
* Operação utilizada:
* - JOIN: Combina as tabelas 'clientes', 'pedidos' e 'itenspedidos' com base no ID do cliente e do pedido.
* - GROUP BY: Agrupa os resultados por ID do pedido e nome do cliente.
* - SUM: Calcula o valor total de cada pedido somando os preços unitários dos itens.
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
SELECT p.id, c.nome, p.DataHoraPedido, SUM(ip.precounitario) AS ValorTotalPedido
FROM pedidos p
JOIN clientes c 
ON p.idcliente = c.id
JOIN itenspedidos ip
ON p.id = ip.idpedido
GROUP BY p.id, c.nome;

-- Consulta para exibir os resultados da view criada
SELECT * FROM ViewValorTotalPedido;

SELECT * FROM pedidos;

-- Consulta para exibir o faturamento diário
SELECT * FROM FaturamentoDiario;




