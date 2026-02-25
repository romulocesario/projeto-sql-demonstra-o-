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

