CREATE TABLE public.pedido_compra (
    pedido_id int8 NOT NULL,
    data_pedido date NULL,
    item int4 NOT NULL,
    produto_id varchar(25) NOT NULL,
    descricao_produto varchar(255),
    ordem_compra int8 NOT NULL,
    qtde_pedida float8 NULL,
    filial_id int4 NOT NULL,
    data_entrega date,
    qtde_entregue float8 DEFAULT 0 NOT NULL,
    qtde_pendente float8 DEFAULT 0 NOT NULL,
    preco_compra numeric(12,4) NULL,
    idfornecedor varchar(25) NOT NULL,
    CONSTRAINT pedido_compra_pkey PRIMARY KEY (pedido_id, produto_id,  item)
);