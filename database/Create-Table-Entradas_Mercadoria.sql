CREATE TABLE public.entradas_mercadoria (    
    data_entrada date NULL,    
    nro_nfe varchar(255) NOT NULL,    
    ordem_compra int8 NULL,    
    item int4 NOT NULL,    
    produto_id varchar(25) NOT NULL,    
    descricao_produto varchar(255) NULL,    
    qtde_recebida float8 NULL,    
    filial_id int4 NOT NULL,    
    custo_unitario numeric(12,4) DEFAULT 0 NOT NULL,    
    CONSTRAINT entradas_mercadoria_pkey 
    PRIMARY KEY (ordem_compra, item, produto_id, nro_nfe)
);