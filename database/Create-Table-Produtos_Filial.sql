CREATE TABLE public.produtos_filial(    
    filial_id int4 NOT NULL,    
    produto_id varchar(25) NOT NULL,    
    descricao_produto varchar(255) NULL,    
    estoque numeric(12,3) DEFAULT 0 NOT NULL,    
    preco_unitario numeric(12,4) DEFAULT 0 NOT NULL,    
    preco_compra numeric(12,4) DEFAULT 0 NOT NULL,    
    preco_venda numeric(12,4) DEFAULT 0 NOT NULL,    
    idfornecedor varchar(25) NOT NULL,    
    CONSTRAINT produtos_filial_pkey 
    PRIMARY KEY (filial_id, produto_id)
);