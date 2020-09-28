USE LojaDB
GO

DECLARE 
	@ValorCompra FLOAT = 5


	UPDATE produto SET 
		valor_compra = @ValorCompra * p.id_produto
	FROM produto p

CREATE OR ALTER PROCEDURE sp_calcular_lucro
	@Data DATE
AS
BEGIN
	
	SELECT 
		p.id_produto,
		iv.qtd_produto,
		iv.valor_vendido,
		p.valor_compra,
		iv.valor_vendido - (p.valor_compra * iv.qtd_produto ) as lucro
	FROM venda v
	INNER JOIN item_venda iv ON v.id_venda = iv.id_venda
	INNER JOIN produto p ON p.id_produto = iv.id_venda
	WHERE dt_venda = @Data

END

EXEC sp_calcular_lucro '2020-08-24'
SELECT * FROM venda
SELECT * FROM item_venda
SELECT * FROM produto




ALTER TABLE produto ADD valor_compra FLOAT NULL


