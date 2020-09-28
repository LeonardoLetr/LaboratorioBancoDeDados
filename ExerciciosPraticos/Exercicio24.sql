USE LojaDB
GO

CREATE OR ALTER FUNCTION ValorTotalCliente
(
	@IdCliente INT
)
RETURNS FLOAT
BEGIN

	DECLARE @Total FLOAT

	SELECT @Total = SUM(v.total_liquido)
	FROM venda v 
	INNER JOIN pedido p ON v.id_pedido = p.id_pedido
	WHERE p.id_cliente = @IdCliente

	RETURN @Total
	
END

SELECT dbo.ValorTotalCliente(4)