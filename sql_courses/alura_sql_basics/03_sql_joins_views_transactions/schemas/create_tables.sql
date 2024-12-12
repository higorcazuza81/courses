/*
* File: create_tables.sql
* Purpose: Define the table structures for the Serenatto Café database.
* Author: System team
* Created: 2024
*/


-- Table 'produtos'
-- This table stores information about the products available for sale in the system.
-- - id: Unique identifier for the product (primary key).
-- - nome: Name of the product (e.g., Espresso Coffee, Cappuccino).
-- - descricao: Brief description of the product.
-- - preco: Unit price of the product, with two decimal places.
-- - categoria: Type of product (e.g., Drink, Snack).
CREATE TABLE produtos (
  id TEXT PRIMARY KEY,
  nome VARCHAR(255),
  descricao VARCHAR(255),
  preco DECIMAL(10,2),
  categoria VARCHAR(50)
);

-- Table 'colaboradores'
-- Stores information about the company's employees.
-- - ID: Unique identifier for the employee (primary key).
-- - Nome: Full name of the employee.
-- - Cargo: Position or role of the employee.
-- - DataContratacao: Employee's hire date.
-- - Telefone: Employee's contact phone number.
-- - Email: Employee's email address.
-- - Rua, Bairro, Cidade, Estado, cep: Complete address of the employee.
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

-- Table 'fornecedores'
-- Stores information about the suppliers providing goods to Serenatto Café.
-- - ID: Unique identifier for the supplier (primary key).
-- - Nome: Name of the supplying company.
-- - Contato: Name of the responsible person or contact point in the supplier company.
-- - Telefone and Email: Contact information for the supplier.
-- - Rua, Bairro, Cidade, Estado, cep: Complete address of the supplier.
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

-- Table 'clientes'
-- Stores data about customers registered in the system.
-- - id: Unique identifier for the customer (primary key).
-- - nome: Full name of the customer.
-- - telefone: Customer's phone number.
-- - email: Customer's email address (default value: 'No email').
-- - endereco: Field for storing the full address of the customer.
CREATE TABLE clientes (
  id TEXT NOT NULL,
  nome VARCHAR(255),
  telefone VARCHAR(20),
  email VARCHAR(100) DEFAULT 'Sem email',
  endereco VARCHAR(255),
  PRIMARY KEY (id)
);

-- Table 'pedidos'
-- Stores information about orders made by customers.
-- - id: Unique identifier for the order (primary key).
-- - idcliente: Foreign key referencing the customer (table 'clientes').
-- - datahorapedido: Date and time when the order was placed.
-- - status: Current status of the order (e.g., pending, completed, canceled).
-- Referential integrity is maintained by the FOREIGN KEY constraint with the ON DELETE CASCADE option.
CREATE TABLE pedidos (
  id TEXT PRIMARY KEY,
  idcliente TEXT,
  datahorapedido DATETIME,
  status VARCHAR(50),
  FOREIGN KEY (idcliente) REFERENCES clientes(id) ON DELETE CASCADE
);

-- Table 'itenspedidos'
-- Stores the items that make up each order.
-- - idpedido: Foreign key to identify the order (table 'pedidos').
-- - idproduto: Foreign key to identify the product (table 'produtos').
-- - quantidade: Quantity of the product included in the order.
-- - precounitario: Unit price of the product at the time of the order.
-- FOREIGN KEY constraints ensure referential integrity, with ON DELETE CASCADE for automatic deletions.
CREATE TABLE itenspedidos (
  idpedido TEXT,
  idproduto TEXT,
  quantidade INTEGER,
  precounitario DECIMAL(10,2),
  PRIMARY KEY (idpedido, idproduto),
  FOREIGN KEY (idpedido) REFERENCES pedidos(id) ON DELETE CASCADE,
  FOREIGN KEY (idproduto) REFERENCES produtos(id) ON DELETE CASCADE
);
