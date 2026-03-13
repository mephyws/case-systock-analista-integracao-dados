SELECT
   pc.descricao_produto,
   SUM(pc.qtde_pedida) AS qtde_pedida,
   COALESCE(SUM(em.qtde_recebida),0) AS qtde_recebida,
   SUM(pc.qtde_pedida) - COALESCE(SUM(em.qtde_recebida),0) AS qtde_pendente
FROM pedido_compra pc
LEFT JOIN (
   SELECT
       ordem_compra,
       produto_id,
       item,
       SUM(qtde_recebida) AS qtde_recebida
   FROM entradas_mercadoria
   GROUP BY ordem_compra, produto_id, item
) em
ON pc.ordem_compra = em.ordem_compra
AND pc.produto_id = em.produto_id
AND pc.item = em.item
GROUP BY pc.descricao_produto
HAVING SUM(pc.qtde_pedida) > COALESCE(SUM(em.qtde_recebida),0)
ORDER BY pc.descricao_produto;