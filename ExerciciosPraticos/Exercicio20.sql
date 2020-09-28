USE LojaDB
GO

CREATE OR ALTER PROCEDURE sp_info_itens_vendidos
	@IdProduto INT = NULL
AS
BEGIN

	IF (@IdProduto IS NOT NULL)
	BEGIN
		SELECT 
			p.id_produto, 
			p.nome_produto,
			SUM(qtd_produto) as QtdVendido, 
			CAST(SUM(valor_vendido) as NUMERIC(15,2)) as ValorVendido 
		FROM item_venda iv 
		INNER JOIN produto p ON iv.id_produto = p.id_produto
		WHERE p.id_produto = @IdProduto
		GROUP BY p.id_produto, p.nome_produto
	END
	ELSE
	BEGIN
		SELECT 
			p.id_produto, 
			p.nome_produto,
			SUM(qtd_produto) as QtdVendido, 
			CAST(SUM(valor_vendido) as NUMERIC(15,2)) as ValorVendido 
		FROM item_venda iv 
		INNER JOIN produto p ON iv.id_produto = p.id_produto
		GROUP BY p.id_produto, p.nome_produto
	END
	
END

EXEC sp_info_itens_vendidos