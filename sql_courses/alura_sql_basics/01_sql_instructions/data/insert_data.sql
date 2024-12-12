-- Inserting data into the created tables
-- Aligned with the schema from the create_tables.sql file

BEGIN TRANSACTION;

-- Inserting data into the 'clientes' table
INSERT INTO clientes (id_cliente, nome, informacoes_contato, endereco) 
VALUES
    (1, 'Ana Silva', 'ana.silva@gmail.com', 'Rua Flores, 123'),
    (2, 'João Santos', 'joao.santos@provedor.com', 'Rua dos Pinheiros, 25'),
    (3, 'Maria Fernandes', 'maria.fernandes@email.com', 'Rua Santo Antônio, 10'),
    (4, 'Carlos Pereira', 'carlos.pereira@email.com', 'Avenida Rio, 67'),
    (5, 'Patrícia Lima', 'patricia.lima@email.com', 'Rua das Flores, 123'),
    (6, 'Rodrigo Almeida', 'rodrigo.almeida@email.com', 'Avenida Central, 456');

-- Viewing the inserted data
SELECT * FROM clientes;

-- Inserting data into the 'produtos' table
INSERT INTO produtos (id_produto, nome, descricao, id_categoria, preco, unidade, id_fornecedor, data_criacao)
VALUES
    (1, 'Smartphone X', 'Smartphone de última geração', 1, 699.99, 'Unidade', 1, '2023-08-01'),
    (2, 'Notebook Pro', 'Notebook poderoso com tela HD', 2, 1199.99, 'Unidade', 2, '2023-08-02'),
    (3, 'Tablet Lite', 'Tablet compacto e leve', 3, 299.99, 'Unidade', 3, '2023-08-03'),
    (4, 'TV LED 55"', 'TV LED Full HD de 55 polegadas', 4, 599.99, 'Unidade', 4, '2023-08-04'),
    (5, 'Câmera DSLR', 'Câmera digital DSLR com lente intercambiável', 5, 699.99, 'Unidade', 5, '2023-08-05'),
    (6, 'Impressora Laser', 'Impressora laser de alta qualidade', 6, 349.99, 'Unidade', 6, '2023-08-06');

-- Viewing the inserted data
SELECT * FROM produtos;

-- Inserting data into the 'categorias' table
INSERT INTO categorias (id_categoria, nome, descricao)
VALUES
    (1, 'Eletrônicos', 'Produtos eletrônicos diversos'),
    (2, 'Informática', 'Equipamentos de informática'),
    (3, 'Tablets', 'Dispositivos portáteis e tablets'),
    (4, 'Televisores', 'Aparelhos de televisão e acessórios');

-- Viewing the inserted data
SELECT * FROM categorias;

-- Inserting data into the 'fornecedores' table
INSERT INTO fornecedores (id_fornecedor, nome, informacoes_contato)
VALUES
    (1, 'Fornecedor A', 'contato@fornecedora.com'),
    (2, 'Fornecedor B', 'suporte@fornecedorb.com'),
    (3, 'Fornecedor C', 'atendimento@fornecedorc.com');

-- Viewing the inserted data
SELECT * FROM fornecedores;

COMMIT;
