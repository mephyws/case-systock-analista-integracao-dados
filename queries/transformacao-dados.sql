SELECT
   pc.produto_id || ' - ' || pc.descricao_produto AS produto,
   pc.qtde_pedida,
   TO_CHAR(pc.data_pedido, 'DD/MM/YYYY') AS data_pedido
FROM pedido_compra pc
WHERE pc.qtde_pedida > 10
ORDER BY produto;

SELECT
   v.produto_id,
   TO_CHAR(v.data_emissao, 'DD/MM/YYYY') AS data_venda
FROM venda v
ORDER BY v.produto_id;

SELECT
   pf.produto_id || ' - ' || pf.descricao_produto AS produto,
   pf.estoque,
   pf.preco_venda
FROM produtos_filial pf
ORDER BY produto;

