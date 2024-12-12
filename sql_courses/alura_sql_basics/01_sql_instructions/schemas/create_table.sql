-- Creation of the database for the company Hermex Import
-- This script follows best practices for creating tables, consistent naming, and data integrity.

-- TABLE: clientes
-- Stores the customer data for the company.
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY, -- Unique identifier for the customer
    nome_cliente VARCHAR(250) NOT NULL, -- Customer's full name
    informacoes_contato_cliente VARCHAR(250), -- Additional contact information
    endereco_cliente VARCHAR(250) -- Customer's full address
);

-- TABLE: categorias
-- Stores the product categories offered by the company.
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY, -- Unique identifier for the category
    nome_categoria VARCHAR(250) NOT NULL, -- Category name
    descricao_categoria TEXT -- Detailed description of the category
);

-- TABLE: produtos
-- Stores information about the products sold.
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY, -- Unique identifier for the product
    nome_produto VARCHAR(250) NOT NULL, -- Product name
    descricao_produto TEXT, -- Product description
    id_categoria INT, -- Reference to the product category
    preco DECIMAL(10, 2) NOT NULL, -- Product price
    unidade_produto VARCHAR(50), -- Sales unit (e.g., kg, unit)
    id_fornecedor INT, -- Reference to the product supplier
    data_criacao DATE NOT NULL DEFAULT CURRENT_DATE, -- Product registration date
    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    CONSTRAINT fk_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

-- TABLE: fornecedores
-- Stores supplier data.
CREATE TABLE fornecedores (
    id_fornecedor INT PRIMARY KEY, -- Unique identifier for the supplier
    nome_fornecedor VARCHAR(250) NOT NULL, -- Supplier name
    telefone_fornecedor VARCHAR(50), -- Supplier contact phone
    email_fornecedor VARCHAR(100), -- Supplier email
    endereco_fornecedor VARCHAR(250) -- Supplier's full address
);

-- TABLE: pedidos
-- Stores customer orders.
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY, -- Unique identifier for the order
    data_pedido DATE NOT NULL, -- Order date
    status_pedido VARCHAR(250) NOT NULL, -- Order status (e.g., "Delivered", "Pending")
    total_pedido DECIMAL(10, 2) NOT NULL, -- Order total
    id_cliente INT NOT NULL, -- Reference to the customer who placed the order
    data_entrega_estimada DATE, -- Estimated delivery date
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- VIEW: vw_pedidosgold
-- Selects only orders with a total of 400 or more.
CREATE OR REPLACE VIEW vw_pedidosgold AS
SELECT 
    id_pedido,
    data_pedido,
    status_pedido,
    total_pedido,
    id_cliente,
    data_entrega_estimada
FROM 
    pedidos
WHERE 
    total_pedido >= 400;

-- COMMENTS ON CONVENTIONS:
-- Prefixes:
-- - "vw_" for views.
-- - "fk_" for foreign key constraints.
-- - "idx_" would be used for indexes (not applied in this script).
-- - Names standardized in snake_case for consistency and better readability.
