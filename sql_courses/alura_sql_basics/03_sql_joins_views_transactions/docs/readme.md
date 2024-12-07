# Projeto de Banco de Dados - Alura: Conhecendo SQL com SQLite

Este é um projeto educacional do curso **"Conhecendo SQL com SQLite"** da Alura. O objetivo do curso é proporcionar uma compreensão sólida dos fundamentos de SQL, utilizando o SQLite como banco de dados. Neste repositório, você encontrará uma estrutura simples para a criação de um banco de dados e realização de consultas SQL, incluindo a criação de tabelas, inserção de dados e execução de consultas básicas.

## Estrutura do Projeto

O projeto segue a seguinte estrutura de diretórios:

```text
├── data
│   └── inserir_dados.sql       # Script para inserir dados nas tabelas do banco de dados
├── db
│   └── Serenatto.db            # Banco de dados SQLite contendo as tabelas e dados
├── docs
│   └── readme.md               # Este arquivo com informações sobre o projeto
├── queries
│   └── consultas.sql           # Consultas SQL realizadas no banco de dados
└── schemas
    └── criar_tabelas.sql       # Script de criação das tabelas no banco de dados
```

## Descrição dos Arquivos

- **data/inserir_dados.sql**: Contém os scripts para inserir dados nas tabelas do banco de dados. Este script popula as tabelas com dados fictícios de clientes, produtos, colaboradores, fornecedores e pedidos.

- **db/Serenatto.db**: O banco de dados SQLite gerado após a execução dos scripts de criação e inserção de dados. Ele contém as tabelas que são usadas nas consultas.

- **queries/consultas.sql**: Arquivo com consultas SQL que são executadas para realizar buscas, junções e filtragens no banco de dados. Este arquivo pode ser expandido com novas consultas à medida que o aprendizado avança.

- **schemas/criar_tabelas.sql**: Este script cria as tabelas necessárias no banco de dados, com base nos requisitos do curso. As tabelas criadas incluem informações sobre colaboradores, fornecedores, clientes, produtos e pedidos.

## Como Usar

### Pré-requisitos

Para utilizar este projeto, você precisará do SQLite instalado em seu computador. Caso não tenha, você pode baixá-lo através do [site oficial do SQLite](https://www.sqlite.org/download.html).

### Passos

1. Clone este repositório para sua máquina local.
2. Abra o terminal e navegue até o diretório do projeto.
3. Abra o arquivo **schemas/criar_tabelas.sql** em seu editor SQL e execute-o para criar as tabelas no banco de dados.
4. Execute o script **data/inserir_dados.sql** para inserir dados nas tabelas.
5. O banco de dados será gerado e você poderá utilizar as consultas SQL do arquivo **queries/consultas.sql** para interagir com os dados.

### Exemplos de Consultas

Algumas das consultas SQL podem incluir:

- Selecionar todos os colaboradores do banco de dados.
- Consultar todos os produtos e seus preços.
- Realizar uma junção entre fornecedores e colaboradores para obter informações combinadas.
  
Exemplo:

```sql
-- Selecionar todos os colaboradores
SELECT * FROM colaboradores;

-- Consultar produtos com preço superior a 50
SELECT * FROM produtos WHERE preco > 50;
```
## Contribuindo

Este projeto é apenas para fins educacionais no contexto do curso da Alura. Se você deseja contribuir ou melhorar este repositório, fique à vontade para abrir uma **issue** ou **pull request** com sugestões.

## Licença

Este repositório foi criado para fins educacionais. Os conteúdos são de propriedade da **Alura** e podem ser utilizados exclusivamente para aprendizado e prática pessoal.
