-- CRIAÇÃO DE TABELAS PARA O BANCO DE DADOS DO SERENATTO CAFÉ
-- Este arquivo contém comandos SQL para criar as tabelas necessárias no banco de dados do Serenatto Café.

-- Tabela 'produtos'
-- Essa tabela armazena informações sobre os produtos disponíveis no sistema.
-- As colunas incluem:
-- - id: Identificador único do produto.
-- - nome: Nome do produto.
-- - descricao: Breve descrição do produto.
-- - preco: Preço unitário do produto, com precisão de duas casas decimais.
-- - categoria: Categoria ou tipo do produto (exemplo: alimentos, bebidas, etc.).
CREATE TABLE produtos (
  id TEXT PRIMARY KEY,
  nome VARCHAR(255),
  descricao VARCHAR(255),
  preco DECIMAL(10,2),
  categoria VARCHAR(50)
);

-- Tabela 'colaboradores'
-- Armazena dados relacionados aos colaboradores da empresa.
-- As colunas incluem:
-- - ID: Identificador único do colaborador.
-- - Nome: Nome completo do colaborador.
-- - Cargo: Cargo ou posição que o colaborador ocupa na empresa.
-- - DataContratacao: Data em que o colaborador foi contratado.
-- - Telefone e Email: Informações de contato.
-- - Rua, Bairro, Cidade, Estado, cep: Endereço completo do colaborador.
CREATE TABLE colaboradores (
  ID TEXT PRIMARY KEY,
  Nome VARCHAR(255) NOT NULL,
  Cargo VARCHAR(100),
  DataContratacao DATE,
  Telefone VARCHAR(20),
  Email VARCHAR(100),
  Rua VARCHAR(100) NOT NULL,
  Bairro VARCHAR(100) NOT NULL,
  Cidade VARCHAR(100) NOT NULL,
  Estado VARCHAR(2) NOT NULL,
  cep VARCHAR(8) NOT NULL
);

-- Tabela 'fornecedores'
-- Registra informações sobre os fornecedores que abastecem o sistema.
-- As colunas incluem:
-- - ID: Identificador único do fornecedor.
-- - Nome: Nome da empresa fornecedora.
-- - Contato: Nome da pessoa de contato do fornecedor.
-- - Telefone e Email: Informações de contato.
-- - Rua, Bairro, Cidade, Estado, cep: Endereço completo do fornecedor.
CREATE TABLE fornecedores (
  ID TEXT PRIMARY KEY,
  Nome VARCHAR(255) NOT NULL,
  Contato VARCHAR(100) NOT NULL,
  Telefone VARCHAR(20),
  Email VARCHAR(100),
  Rua VARCHAR(100) NOT NULL,
  Bairro VARCHAR(100) NOT NULL,
  Cidade VARCHAR(100) NOT NULL,
  Estado VARCHAR(2) NOT NULL,
  cep VARCHAR(8) NOT NULL
);

-- Tabela 'clientes'
-- Contém informações sobre os clientes do sistema.
-- As colunas incluem:
-- - id: Identificador único do cliente.
-- - nome: Nome do cliente.
-- - telefone: Número de telefone do cliente.
-- - email: Email do cliente, com um valor padrão 'Sem email' para clientes sem endereço eletrônico.
-- - endereco: Endereço completo do cliente.
CREATE TABLE clientes (
  id TEXT NOT NULL,
  nome VARCHAR(255),
  telefone VARCHAR(20),
  email VARCHAR(100) DEFAULT 'Sem email',
  endereco VARCHAR(255),
  PRIMARY KEY (id)
);

-- Tabela 'pedidos'
-- Armazena os pedidos realizados pelos clientes.
-- As colunas incluem:
-- - id: Identificador único do pedido.
-- - idcliente: Identificador do cliente que realizou o pedido.
-- - datahorapedido: Data e hora em que o pedido foi realizado.
-- - status: Status atual do pedido (exemplo: pendente, concluído, cancelado).
-- A coluna idcliente está relacionada à tabela 'clientes' e utiliza uma chave estrangeira.
CREATE TABLE pedidos (
  id TEXT PRIMARY KEY,
  idcliente TEXT,
  datahorapedido DATETIME,
  status VARCHAR(50),
  FOREIGN KEY (idcliente) REFERENCES clientes(id) ON DELETE CASCADE
);

-- Tabela 'itenspedidos'
-- Lista os itens incluídos em cada pedido.
-- As colunas incluem:
-- - idpedido: Identificador do pedido ao qual os itens pertencem.
-- - idproduto: Identificador do produto incluído no pedido.
-- - quantidade: Quantidade do produto no pedido.
-- - precounitario: Preço unitário do produto no momento do pedido.
-- As colunas idpedido e idproduto são chaves estrangeiras relacionadas às tabelas 'pedidos' e 'produtos', respectivamente.
CREATE TABLE itenspedidos (
  idpedido TEXT,
  idproduto TEXT,
  quantidade INTEGER,
  precounitario DECIMAL(10,2),
  PRIMARY KEY (idpedido, idproduto),
  FOREIGN KEY (idpedido) REFERENCES pedidos(id) ON DELETE CASCADE,
  FOREIGN KEY (idproduto) REFERENCES produtos(id) ON DELETE CASCADE
);
