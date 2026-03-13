CREATE TABLE public.fornecedor(
	idfornecedor varchar(25) NOT NULL,
	razao_social varchar(255) NOT NULL,
	CONSTRAINT fornecedor_pkey PRIMARY KEY (idfornecedor)
);