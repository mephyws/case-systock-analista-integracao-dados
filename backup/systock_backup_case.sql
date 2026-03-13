--
-- PostgreSQL database dump
--

\restrict HdbHS2nuypEZI0QtDooRRpPe5VDfe7WzyA5ccWY1e7txX33j0lrBrQlDfRCY8Bj

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-03-13 11:17:08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 225 (class 1255 OID 16529)
-- Name: gerar_idfornecedor(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.gerar_idfornecedor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    proximo_id INTEGER;
BEGIN
    IF NEW.idfornecedor IS NULL THEN
        SELECT COALESCE(MAX(numero),0) + 1
        INTO proximo_id
        FROM (
            SELECT REPLACE(idfornecedor,'F','')::INTEGER AS numero FROM fornecedor
            UNION ALL
            SELECT REPLACE(idfornecedor,'F','')::INTEGER AS numero FROM produtos_filial
        ) t;
        NEW.idfornecedor := 'F' || proximo_id;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.gerar_idfornecedor() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16432)
-- Name: entradas_mercadoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entradas_mercadoria (
    data_entrada date,
    nro_nfe character varying(255) NOT NULL,
    ordem_compra bigint NOT NULL,
    item integer NOT NULL,
    produto_id character varying(25) NOT NULL,
    descricao_produto character varying(255),
    qtde_recebida double precision,
    filial_id integer NOT NULL,
    custo_unitario numeric(12,4) DEFAULT 0 NOT NULL
);


ALTER TABLE public.entradas_mercadoria OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16445)
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedor (
    idfornecedor character varying(25) CONSTRAINT fornecedor_fornecedor_id_not_null NOT NULL,
    razao_social character varying(255) NOT NULL
);


ALTER TABLE public.fornecedor OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16504)
-- Name: pedido_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido_compra (
    pedido_id bigint NOT NULL,
    data_pedido date,
    item integer NOT NULL,
    produto_id character varying(25) NOT NULL,
    descricao_produto character varying(255),
    ordem_compra bigint NOT NULL,
    qtde_pedida double precision,
    filial_id integer NOT NULL,
    data_entrega date,
    qtde_entregue double precision DEFAULT 0 NOT NULL,
    qtde_pendente double precision DEFAULT 0 NOT NULL,
    preco_compra numeric(12,4),
    idfornecedor character varying(25) NOT NULL
);


ALTER TABLE public.pedido_compra OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16417)
-- Name: produtos_filial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos_filial (
    filial_id integer NOT NULL,
    produto_id character varying(25) NOT NULL,
    descricao_produto character varying(255),
    estoque numeric(12,3) DEFAULT 0 NOT NULL,
    preco_unitario numeric(12,4) DEFAULT 0 NOT NULL,
    preco_compra numeric(12,4) DEFAULT 0 NOT NULL,
    preco_venda numeric(12,4) DEFAULT 0 NOT NULL,
    idfornecedor character varying(25) NOT NULL
);


ALTER TABLE public.produtos_filial OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16528)
-- Name: seq_fornecedor_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_fornecedor_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_fornecedor_id OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda (
    venda_id bigint NOT NULL,
    data_emissao date NOT NULL,
    horariomov time without time zone DEFAULT '00:00:00'::time without time zone NOT NULL,
    produto_id character varying(25) NOT NULL,
    qtde_vendida double precision,
    valor_unitario numeric(12,4) DEFAULT 0 NOT NULL,
    filial_id integer NOT NULL,
    item integer NOT NULL,
    unidade_medida character varying(3)
);


ALTER TABLE public.venda OWNER TO postgres;

--
-- TOC entry 5045 (class 0 OID 16432)
-- Dependencies: 221
-- Data for Name: entradas_mercadoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entradas_mercadoria (data_entrada, nro_nfe, ordem_compra, item, produto_id, descricao_produto, qtde_recebida, filial_id, custo_unitario) FROM stdin;
2025-02-27	NFE1	1	1	P1	Produto 1	77	1	84.3500
2025-01-20	NFE2	2	1	P2	Produto 2	64	1	16.6600
2025-02-18	NFE3	3	1	P3	Produto 3	88	1	90.3600
2025-02-12	NFE4	4	1	P4	Produto 4	4	1	84.6800
2025-02-19	NFE5	5	1	P5	Produto 5	95	1	98.9900
2025-02-08	NFE6	6	1	P6	Produto 6	41	1	90.2900
2025-01-03	NFE7	7	1	P7	Produto 7	75	1	27.2200
2025-02-21	NFE8	8	1	P8	Produto 8	25	1	71.1000
2025-02-13	NFE9	9	1	P9	Produto 9	57	1	19.5500
2025-03-01	NFE10	10	1	P10	Produto 10	7	1	54.3900
2025-01-23	NFE11	11	1	P11	Produto 11	85	1	91.8900
2025-01-02	NFE12	12	1	P12	Produto 12	12	1	38.5300
2025-02-20	NFE13	13	1	P13	Produto 13	7	1	60.8600
2025-01-10	NFE14	14	1	P14	Produto 14	92	1	38.4800
2025-01-13	NFE15	15	1	P15	Produto 15	68	1	95.5800
2025-01-22	NFE16	16	1	P16	Produto 16	89	1	39.4600
2025-02-24	NFE17	17	1	P17	Produto 17	10	1	10.3200
2025-01-31	NFE18	18	1	P18	Produto 18	48	1	62.5600
2025-02-13	NFE19	19	1	P19	Produto 19	64	1	84.5400
2025-01-01	NFE20	20	1	P20	Produto 20	6	1	65.7000
\.


--
-- TOC entry 5046 (class 0 OID 16445)
-- Dependencies: 222
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fornecedor (idfornecedor, razao_social) FROM stdin;
F1	Fornecedor 1 LTDA
F2	Fornecedor 2 LTDA
F3	Fornecedor 3 LTDA
F4	Fornecedor 4 LTDA
F5	Fornecedor 5 LTDA
F6	Fornecedor 6 LTDA
F7	Fornecedor 7 LTDA
F8	Fornecedor 8 LTDA
F9	Fornecedor 9 LTDA
F10	Fornecedor 10 LTDA
F11	Fornecedor 11 LTDA
F12	Fornecedor 12 LTDA
F13	Fornecedor 13 LTDA
F14	Fornecedor 14 LTDA
F15	Fornecedor 15 LTDA
F16	Fornecedor 16 LTDA
F17	Fornecedor 17 LTDA
F18	Fornecedor 18 LTDA
F19	Fornecedor 19 LTDA
F20	Fornecedor 20 LTDA
\.


--
-- TOC entry 5047 (class 0 OID 16504)
-- Dependencies: 223
-- Data for Name: pedido_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido_compra (pedido_id, data_pedido, item, produto_id, descricao_produto, ordem_compra, qtde_pedida, filial_id, data_entrega, qtde_entregue, qtde_pendente, preco_compra, idfornecedor) FROM stdin;
1	2025-01-02	1	P1	Produto 1	1	96	1	2025-02-27	10	0	46.6700	F1
2	2025-01-07	1	P2	Produto 2	2	14	1	2025-01-07	7	0	77.3200	F2
3	2025-01-05	1	P3	Produto 3	3	12	1	2025-01-03	2	0	47.8200	F3
4	2025-01-22	1	P4	Produto 4	4	27	1	2025-01-28	3	0	49.5700	F4
5	2025-01-28	1	P5	Produto 5	5	35	1	2025-02-28	12	0	57.1800	F5
6	2025-02-22	1	P6	Produto 6	6	98	1	2025-01-05	55	0	59.9600	F6
7	2025-03-01	1	P7	Produto 7	7	34	1	2025-02-01	29	0	49.2200	F7
8	2025-02-02	1	P8	Produto 8	8	29	1	2025-02-14	24	0	35.8800	F8
9	2025-01-15	1	P9	Produto 9	9	57	1	2025-01-28	34	0	28.4800	F9
10	2025-01-09	1	P10	Produto 10	10	49	1	2025-02-09	4	0	42.8600	F10
11	2025-02-22	1	P11	Produto 11	11	24	1	2025-01-08	12	0	14.8200	F11
12	2025-02-25	1	P12	Produto 12	12	91	1	2025-02-20	48	0	6.9200	F12
13	2025-02-23	1	P13	Produto 13	13	99	1	2025-02-02	91	0	65.4400	F13
14	2025-01-21	1	P14	Produto 14	14	96	1	2025-01-01	27	0	21.9100	F14
15	2025-02-04	1	P15	Produto 15	15	45	1	2025-01-04	1	0	85.0400	F15
16	2025-02-27	1	P16	Produto 16	16	84	1	2025-01-14	51	0	64.1700	F16
17	2025-01-08	1	P17	Produto 17	17	22	1	2025-01-19	7	0	74.5500	F17
18	2025-02-17	1	P18	Produto 18	18	63	1	2025-01-02	17	0	24.9400	F18
19	2025-02-19	1	P19	Produto 19	19	20	1	2025-01-08	0	0	22.2100	F19
20	2025-02-10	1	P20	Produto 20	20	25	1	2025-01-15	0	0	38.5100	F20
\.


--
-- TOC entry 5044 (class 0 OID 16417)
-- Dependencies: 220
-- Data for Name: produtos_filial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos_filial (filial_id, produto_id, descricao_produto, estoque, preco_unitario, preco_compra, preco_venda, idfornecedor) FROM stdin;
1	P1	Produto 1	88.000	42.6500	144.1300	40.7900	F8
1	P2	Produto 2	28.000	79.5200	103.5600	174.1800	F9
1	P3	Produto 3	40.000	119.5000	24.1400	60.6900	F10
1	P4	Produto 4	73.000	89.6700	7.7500	226.5000	F11
1	P5	Produto 5	97.000	135.9900	36.1800	89.9200	F12
1	P6	Produto 6	38.000	161.3100	55.3700	95.6000	F13
1	P7	Produto 7	131.000	153.8200	14.0400	46.6400	F7
1	P8	Produto 8	71.000	140.5700	149.5000	95.2800	F17
1	P9	Produto 9	2.000	30.8800	137.0000	164.3200	F18
1	P10	Produto 10	38.000	115.7100	27.7700	87.7000	F19
1	P11	Produto 11	154.000	147.9900	29.3900	44.9500	F1
1	P12	Produto 12	78.000	32.4700	64.6300	276.5800	F2
1	P13	Produto 13	79.000	194.0400	58.3000	99.0500	F3
1	P14	Produto 14	9.000	199.5600	56.8000	80.7400	F4
1	P15	Produto 15	131.000	101.1500	107.6000	29.2400	F5
1	P16	Produto 16	177.000	24.6400	75.9400	278.8800	F6
1	P17	Produto 17	105.000	195.6300	126.2500	183.9200	F7
1	P18	Produto 18	198.000	162.2000	134.1200	105.6100	F18
1	P19	Produto 19	148.000	184.3600	121.6900	234.5800	F19
1	P20	Produto 20	196.000	52.0400	124.8700	157.9300	F20
1	P21	Produto Teste	100.000	10.0000	50.0000	80.0000	F21
\.


--
-- TOC entry 5043 (class 0 OID 16389)
-- Dependencies: 219
-- Data for Name: venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venda (venda_id, data_emissao, horariomov, produto_id, qtde_vendida, valor_unitario, filial_id, item, unidade_medida) FROM stdin;
1	2025-01-11	08:00:00	P1	5	78.9300	1	1	UN
2	2025-03-02	08:00:00	P2	7	92.9600	1	1	UN
3	2025-01-28	08:00:00	P3	9	197.6100	1	1	UN
4	2025-01-10	08:00:00	P4	38.6	139.7100	1	1	UN
5	2025-01-11	08:00:00	P5	3	126.7900	1	1	UN
6	2025-01-24	08:00:00	P6	2	36.8300	1	1	UN
7	2025-02-22	08:00:00	P7	5	40.7500	1	1	UN
8	2025-01-26	08:00:00	P8	20.04	51.3700	1	1	UN
9	2025-01-17	08:00:00	P9	6	172.5500	1	1	UN
10	2025-01-03	08:00:00	P10	90	44.2200	1	1	UN
11	2025-01-08	08:00:00	P11	6	190.3700	1	1	UN
12	2025-01-21	08:00:00	P12	2.86	136.4000	1	1	UN
13	2025-01-24	08:00:00	P13	13	61.8500	1	1	UN
14	2025-02-07	08:00:00	P14	53	106.3000	1	1	UN
15	2025-02-20	08:00:00	P15	27	43.4000	1	1	UN
16	2025-02-17	08:00:00	P16	37.11	14.4100	1	1	UN
17	2025-02-22	08:00:00	P17	3	139.8000	1	1	UN
18	2025-02-18	08:00:00	P18	5	185.2300	1	1	UN
19	2025-02-20	08:00:00	P19	10	182.5100	1	1	UN
20	2025-02-28	08:00:00	P20	2	68.5400	1	1	UN
21	2025-01-24	08:00:00	P21	25	61.8500	1	1	UN
22	2025-02-07	08:00:00	P22	6	106.3000	1	1	UN
23	2025-02-20	08:00:00	P23	7	43.4000	1	1	UN
24	2025-02-17	08:00:00	P24	4	14.4100	1	1	UN
25	2025-02-22	08:00:00	P25	8	139.8000	1	1	UN
26	2025-02-18	08:00:00	P26	3.11	185.2300	1	1	UN
27	2025-02-20	08:00:00	P27	3	182.5100	2	1	UN
28	2025-03-28	08:00:00	P28	6	68.5400	3	1	UN
29	2025-03-17	08:00:00	P24	5	14.4100	1	1	UN
30	2025-03-22	08:00:00	P25	3	139.8000	1	1	UN
31	2025-03-18	08:00:00	P26	4	185.2300	1	1	UN
32	2025-03-20	08:00:00	P27	2	182.5100	2	1	UN
33	2025-03-28	08:00:00	P28	1	68.5400	3	1	UN
\.


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 224
-- Name: seq_fornecedor_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_fornecedor_id', 2, true);


--
-- TOC entry 4887 (class 2606 OID 16444)
-- Name: entradas_mercadoria entradas_mercadoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entradas_mercadoria
    ADD CONSTRAINT entradas_mercadoria_pkey PRIMARY KEY (ordem_compra, item, produto_id, nro_nfe);


--
-- TOC entry 4889 (class 2606 OID 16482)
-- Name: fornecedor fornecedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (idfornecedor);


--
-- TOC entry 4891 (class 2606 OID 16518)
-- Name: pedido_compra pedido_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_compra
    ADD CONSTRAINT pedido_compra_pkey PRIMARY KEY (pedido_id, produto_id, item);


--
-- TOC entry 4885 (class 2606 OID 16431)
-- Name: produtos_filial produtos_filial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_filial
    ADD CONSTRAINT produtos_filial_pkey PRIMARY KEY (filial_id, produto_id);


--
-- TOC entry 4893 (class 2606 OID 16522)
-- Name: pedido_compra uk_pedido_compra_ordem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_compra
    ADD CONSTRAINT uk_pedido_compra_ordem UNIQUE (ordem_compra);


--
-- TOC entry 4883 (class 2606 OID 16453)
-- Name: venda venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (filial_id, venda_id, item);


--
-- TOC entry 4895 (class 2620 OID 16530)
-- Name: produtos_filial trg_gerar_idfornecedor; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_gerar_idfornecedor BEFORE INSERT ON public.produtos_filial FOR EACH ROW EXECUTE FUNCTION public.gerar_idfornecedor();


--
-- TOC entry 4894 (class 2606 OID 16523)
-- Name: entradas_mercadoria fk_entradas_pedido_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entradas_mercadoria
    ADD CONSTRAINT fk_entradas_pedido_compra FOREIGN KEY (ordem_compra) REFERENCES public.pedido_compra(ordem_compra);


-- Completed on 2026-03-13 11:17:09

--
-- PostgreSQL database dump complete
--

\unrestrict HdbHS2nuypEZI0QtDooRRpPe5VDfe7WzyA5ccWY1e7txX33j0lrBrQlDfRCY8Bj

