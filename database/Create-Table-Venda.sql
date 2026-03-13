CREATE TABLE public.venda (
    venda_id int8 NOT NULL,
    data_emissao DATE NOT NULL,
    horariomov TIME DEFAULT '00:00:00' NOT NULL,
    produto_id VARCHAR(25) NOT NULL,
    qtde_vendida float8 NULL,
    valor_unitario NUMERIC(12,4) DEFAULT 0 NOT NULL,
    filial_id int4 NOT NULL,
    item int4 NOT NULL,
    unidade_medida VARCHAR(3),
    CONSTRAINT venda_pkey 
        PRIMARY KEY (filial_id, venda_id, item)
);