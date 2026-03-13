/* CREATE SEQUENCE seq_fornecedor_id
START 1
INCREMENT 1; */

CREATE OR REPLACE FUNCTION gerar_idfornecedor()
RETURNS TRIGGER AS $$
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
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_gerar_idfornecedor
BEFORE INSERT ON produtos_filial
FOR EACH ROW
EXECUTE FUNCTION gerar_idfornecedor();


INSERT INTO produtos_filial (
    filial_id,
    produto_id,
    descricao_produto,
    estoque,
    preco_unitario,
    preco_compra,
    preco_venda
)
VALUES (
    1,
    'P21',
    'Produto Teste',
    100,
    10,
    50,
    80
);