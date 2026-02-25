-- SUBSCONSUTAS E CONSULTAS SIMPLES
SELECT * FROM clientes;


SELECT * FROM pedidos;


SELECT idcliente FROM pedidos WHERE datahorapedido = '2023-01-02 08:15:00';


SELECT nome
FROM clientes
WHERE id = (SELECT idcliente FROM pedidos WHERE datahorapedido = '2023-01-02 08:15:00');


-- SUBSCONSUTAS COM IN E HAVING
SELECT idcliente
FROM pedidos
WHERE strftime('%m', datahorapedido) = '01';


SELECT nome
FROM clientes
WHERE id IN (
    SELECT idcliente
    FROM pedidos
    WHERE strftime('%m', datahorapedido) = '01');


SELECT AVG(preco) FROM produtos;


SELECT nome, preco
FROM produtos
HAVING preco > (SELECT AVG(preco) FROM produtos);


SELECT nome, preco
FROM produtos
GROUP BY nome, preco
HAVING preco > (SELECT AVG(preco) FROM produtos);


-- SC DE UNION E UNION ALL
SELECT rua, bairro, cidade, estado, cep FROM colaboradores
UNION 
SELECT rua, bairro, cidade, estado, cep FROM fornecedores;


SELECT * FROM colaboradores WHERE rua = 'Rua das flores - 210';


SELECT rua, bairro, cidade, estado, cep FROM colaboradores
UNION ALL
SELECT rua, bairro, cidade, estado, cep FROM fornecedores;


SELECT nome, rua, bairro, cidade, estado, cep FROM colaboradores
UNION ALL
SELECT nome, rua, bairro, cidade, estado, cep FROM fornecedores;


-- LEFT JOIN, FULL JOIN, USO DE ALIAS
 SELECT c.nome, p.id
 FROM clientes c 
 LEFT JOIN Pedidos p 
 ON c.id = p.idcliente;
 

SELECT c.nome, P.idcliente 
 FROM clientes c 
 LEFT JOIN Pedidos p 
 ON c.id = p.idcliente
WHERE strftime('%m', p.datahorapedido) = '10' ;


SELECT c.nome, x.id 
FROM clientes c
LEFT JOIN
(
	SELECT p.id, p.idcliente 
	FROM pedidos p
	WHERE strftime('%m', p.datahorapedido) = '09')x
ON c.id = x.idcliente
WHERE x.idcliente is NULL;


SELECT c.nome, p.id 
FROM clientes c
FULL JOIN pedidos p
ON c.id = p.idcliente;


SELECT c.nome, p.id 
FROM clientes c
FULL JOIN pedidos p
ON c.id = p.idcliente
WHERE c.id is NULL;


SELECT c.nome, p.id 
FROM clientes c
FULL JOIN pedidos p
ON c.id = p.idcliente
WHERE p.id is NULL;
