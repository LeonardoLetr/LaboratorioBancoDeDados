USE LojaDB
GO

CREATE OR ALTER FUNCTION ClassificacaoCliente 
(
	@IdCliente INT
)
RETURNS VARCHAR(100)
BEGIN

	DECLARE 
		@QtdVendas INT 

	SELECT @QtdVendas = COUNT(id_venda)
	FROM venda v 
	INNER JOIN pedido p ON v.id_pedido = p.id_pedido
	WHERE p.id_cliente = @IdCliente

	IF (@QtdVendas IS NOT NULL)
	BEGIN

		IF (@QtdVendas < 2)
			RETURN 'Cliente esporádico'
		ELSE IF (@QtdVendas >= 2 AND @QtdVendas <= 10)
			RETURN 'Recorrente'
		ELSE
			RETURN 'Cliente fidelizado'
	END
		
	RETURN 'Dado Invalido'
END

SELECT dbo.ClassificacaoCliente(4)