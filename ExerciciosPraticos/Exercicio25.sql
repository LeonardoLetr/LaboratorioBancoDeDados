USE LojaDB
GO

CREATE OR ALTER FUNCTION ImpostoSobreProduto
(
	@ValorProduto FLOAT,
	@Imposto INT
)
RETURNS FLOAT
BEGIN

	DECLARE @Valor FLOAT

	SELECT @Valor = @ValorProduto * (@Imposto / 100.0)

	RETURN @Valor
	
END

SELECT * FROM dbo.ImpostoSobreProduto(1000, 5)

