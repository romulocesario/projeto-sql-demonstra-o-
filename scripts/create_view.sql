
-- CRIANDO UMA CONSULTA PARA A BASE
SELECT * FROM pedidos;
SELECT * FROM itenspedidos;

SELECT p.id, c.nome, p.datahorapedido, SUM(ip.precounitario) AS ValorTotalPedido
FROM clientes c
join pedidos p on c.id = p.idcliente
JOIN itenspedidos ip ON p.id = ip.idpedido
GROUP BY p.id, c.nome;


-- CRIANDO A VIEW CLIENTE
CREATE VIEW ViewCliente AS
SELECT nome, endereco from clientes;

--TESTE
SELECT * FROM ViewCliente;

-- CRIANDO A VIEW DE VALOR TOTAL
CREATE VIEW ViewValorTotalPedido AS
SELECT p.id, c.nome, p.datahorapedido, SUM(ip.precounitario) AS ValorTotalPedido
FROM clientes c
join pedidos p on c.id = p.idcliente
JOIN itenspedidos ip ON p.id = ip.idpedido
GROUP BY p.id, c.nome;

--TESTE
SELECT * FROM ViewValorTotalPedido;
