USE LojaDB
GO

SELECT v.*, nf.numero_nota
FROM venda v
INNER JOIN nota_fiscal nf ON v.id_venda = nf.id_venda

SELECT * FROM produto
WHERE qtd_estoque <= 20