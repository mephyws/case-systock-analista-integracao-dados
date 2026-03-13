# case-systock-analista-integracao-dados
Este repositório contém a solução desenvolvida para o case técnico de Analista de Integração de Dados, com foco em:  Importação de dados, consultas SQL, transformações de dados, automação com triggers, estratégia de validação com cliente. Foi desenvolvido em PostgreSQL, com suporte da ferramenta DBeaver.

Este repositório contém a solução desenvolvida para o case técnico de Analista de Integração de Dados, com foco em:

- Importação de dados

- Análise e consultas SQL

- Transformações de dados

- Automação com triggers

- Estratégia de validação com cliente.

Foi utilizado PostgreSQL, com suporte da ferramenta DBeaver.

---

Estrutura do projeto

O repositório está organizado da seguinte forma:

- database - Scripts de criação das tabelas e importação da planilha

- queries - Consultas SQL desenvolvidas para análise e validação

- documentacao - Documentação das etapas do processo

- backup - Backup do banco utilizado na análise


---

Ambiente utilizado

PostgreSQL

DBeaver

---

Processo de importação

A importação da planilha base_teste_systock.xlsx foi realizada utilizando o assistente de importação de dados do DBeaver, que permite mapear colunas da planilha diretamente para tabelas do banco de dados.

Durante esse processo foram realizados os seguintes tratamentos:

- Validação de campos obrigatórios

- Normalização de datas

- Conferência de consistência entre tabelas.

A documentação detalhada desse processo encontra-se no arquivo:

documentacao/processo_importacao.md

---

Consultas SQL desenvolvidas

Foram implementadas consultas para:

- Consumo de produtos no mês de fevereiro de 2025

- Identificação de produtos com requisição pendente

- Transformações de dados (concatenação de produto, formatação de datas e filtros)

- Trigger para geração automática de fornecedor.

Os scripts podem ser encontrados na pasta:

queries/

---

Validação de dados com o cliente

Também foi elaborado um roteiro de validação dos dados do mês de fevereiro de 2025, com foco em:

- Consistência de vendas

- Pedidos de compra

- Entradas de mercadoria

- Produtos pendentes.

Essa documentação encontra-se em:

documentacao/validacao_dados_cliente.md

---

Backup do banco

Um backup do banco utilizado na análise está disponível na pasta:

backup/systock_case_backup.sql

Esse arquivo permite restaurar o ambiente completo para reprodução dos testes.

---

Autor

Matheus Guimarães
Analista de Dados
