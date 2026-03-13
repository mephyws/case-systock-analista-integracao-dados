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

- database - Scripts de criação das tabelas

- queries - Consultas SQL desenvolvidas para análise e validação

- documentacao - Documentação das etapas do processo

- trigger - Script que gera uma automação

- backup - Backup do banco utilizado na análise


---

Ambiente utilizado

PostgreSQL

DBeaver

---

Criação das tabelas

A criação de tabelas se deu pelos scripts que o case forneceu, porém, foi identificado inconsistências, o que levou à alguns ajustes.

A documentação desses ajustes encontra-se em:

documentacao/documentacao_ajustes_tabelas.pdf

---

Processo de importação

A importação da planilha base_teste_systock.xlsx foi realizada utilizando o assistente de importação de dados do DBeaver, que permite mapear colunas da planilha diretamente para tabelas do banco de dados.

Durante esse processo foram realizados os seguintes tratamentos:

- Validação de campos obrigatórios

- Normalização de datas

- Conferência de consistência entre tabelas.

A documentação detalhada desse processo encontra-se no arquivo:

documentacao/documentacao_importacao.pdf

---

Consultas SQL desenvolvidas

Foram implementadas consultas para:

- Consumo de produtos no mês de fevereiro de 2025

- Identificação de produtos com requisição pendente

- Transformações de dados (concatenação de produto, formatação de datas e filtros)

Os scripts podem ser encontrados na pasta:

queries/

A documentação detalhada desse processo encontra-se nos arquivos:

documentacao/consultas_sql.pdf
documentacao/transformacao_dados.pdf

---

Trigger para geração automática de fornecedor

Foi criada uma trigger responsável por gerar automaticamente o campo idfornecedor na tabela produtos_filial.

O identificador segue o padrão:

F1, F2, F3...

A lógica implementada identifica o maior identificador existente e gera o próximo valor disponível.

O script está disponível em:

triggers/trigger-idfornecedor.sql

A documentação detalhada desse processo encontra-se no arquivo:

documentacao/transformacao_dados.pdf

A descrição dessa etapa está em Criação da Trigger.

---

Validação de dados com o cliente

Também foi elaborado um roteiro de validação dos dados do mês de fevereiro de 2025, com foco em:

- Consistência de vendas

- Pedidos de compra

- Entradas de mercadoria

- Produtos pendentes.

Essa documentação encontra-se em:

documentacao/validação_cliente.pdf

---

Backup do banco

Um backup do banco utilizado na análise está disponível na pasta:

backup/systock_backup_case.sql

Esse arquivo permite restaurar o ambiente completo para reprodução dos testes.

---

Autor

Matheus Guimarães
Analista de Dados
