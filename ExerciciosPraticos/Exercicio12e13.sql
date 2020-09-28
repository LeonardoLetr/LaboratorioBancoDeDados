USE LojaDB
GO

CREATE OR ALTER VIEW produto_data_venda
AS
	SELECT 
		p.nome_produto,
		v.dt_venda
	FROM produto p
	INNER JOIN item_venda iv ON p.id_produto = iv.id_produto
	INNER JOIN venda v ON iv.id_venda = v.id_venda


	
CREATE OR ALTER VIEW produto_nota
AS
	SELECT 
		v.id_venda,
		v.dt_venda,
		v.total_liquido,
		nf.dt_emissao,
		nf.numero_nota
	FROM venda v
	LEFT JOIN nota_fiscal nf ON v.id_venda = nf.id_venda
