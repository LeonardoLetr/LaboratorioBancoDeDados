USE LojaDB
GO

CREATE OR ALTER PROCEDURE sp_verifica_estoque_baixo
	@QtdEstoqueBaixo INT
AS
BEGIN

	IF EXISTS (SELECT TOP 1 1 FROM produto WHERE qtd_estoque <= @QtdEstoqueBaixo)
	BEGIN
		SELECT 
			p.id_produto, 
			p.nome_produto,
			p.qtd_estoque,
			f.nome_fornecedor
		FROM produto p
		INNER JOIN fornecedor_produto fp ON fp.id_produto = p.id_produto
		INNER JOIN fornecedor f ON fp.id_fornecedor = f.id_fornecedor
		WHERE p.qtd_estoque <= @QtdEstoqueBaixo
	END
	ELSE
	BEGIN
		PRINT('Não existe produtos com estoque a baixo de ' + CAST(@QtdEstoqueBaixo AS VARCHAR(100)))
	END

END

EXEC sp_verifica_estoque_baixo 150
