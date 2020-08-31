--Leonardo Rodrigues Batista Geraldo RA:00101457
--Ciencia da Computação 4 Semestre

USE LojaDB
GO


CREATE OR ALTER VIEW cliente_primeira_compra
AS
	SELECT 
		p.nome_pessoa, 
		dt_primeira_compra 
	FROM pessoa p
	INNER JOIN cliente c ON p.id_pessoa = c.id_pessoa


CREATE OR ALTER VIEW funcionario_data_admissao
AS
	SELECT 
		p.nome_pessoa, 
		f.dt_admissao 
FROM pessoa p
INNER JOIN funcionario f ON p.id_pessoa = f.id_pessoa


CREATE OR ALTER VIEW pedido_data_venda
AS
	SELECT 
		p.*, 
		v.dt_venda 
FROM pedido p
LEFT JOIN venda v ON p.id_pedido = v.id_pedido


SELECT * FROM cliente_primeira_compra

SELECT* FROM funcionario_data_admissao

SELECT * FROM pedido_data_venda