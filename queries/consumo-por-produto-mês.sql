SELECT
pf.descricao_produto,
SUM(v.qtde_vendida)::int AS total_quantidade_vendida,
SUM(v.qtde_vendida * v.valor_unitario) AS total_valor_vendido
FROM venda v
JOIN produtos_filial pf
ON v.produto_id = pf.produto_id
WHERE v.data_emissao >= DATE '2025-02-01'
AND v.data_emissao < DATE '2025-03-01'
GROUP BY pf.descricao_produto
ORDER BY pf.descricao_produto;