USE LojaDB
GO

CREATE OR ALTER PROCEDURE sp_cria_nota_fiscal
	@IdVenda INT 
AS
BEGIN

	DECLARE 
		@novoNumero VARCHAR(4)

	SELECT @novoNumero = CAST(ABS(CHECKSUM(NEWID())) % 9999 AS VARCHAR(4)) 

	INSERT INTO nota_fiscal VALUES (@IdVenda, CAST(@novoNumero AS INT), GETDATE())

	PRINT('Nova nota_fiscal criada com o número ' + @novoNumero)
END

INSERT INTO pedido VALUES (2, 4, GETDATE())
INSERT INTO venda VALUES (16, GETDATE(), 2000, 0, 2000)

EXEC sp_cria_nota_fiscal 11

