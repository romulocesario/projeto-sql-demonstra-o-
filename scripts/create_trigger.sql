CREATE TRIGGER CalculaFaturamentoDiario
AFTER INSERT ON itenspedidos
FOR EACH ROW 
BEGIN
DELETE FROM Faturamentodiario;
INSERT INTO Faturamentodiario (Dia, faturamentototal)
SELECT DATE(datahorapedido) AS Dia, SUM(ip.precounitario) as FaturamentoDiario 
from pedidos p
join itenspedidos ip
on p.id = ip.idpedido
GROUP BY Dia
ORDER BY Dia;
END;

--PARA VERIFICAR FUNCIONAMENTO
SELECT * from Faturamentodiario;


-- INSERINDO PARA ACIONAR TRIGGER
SELECT * from Faturamentodiario;


INSERT INTO Pedidos (ID, IDCliente, DataHoraPedido, Status)
VALUES (451, 27, '2023-10-07 14:30:00', 'Em Andamento');


INSERT INTO ItensPedidoS
(IDPedido, IDProduto, Quantidade, PrecoUnitario)
VALUES(451, 14, 1, 6.0),
      (451, 13, 1, 7.0);



INSERT INTO Pedidos (ID, IDCliente, DataHoraPedido, Status)
VALUES (452, 28, '2023-10-07 14:35:00', 'Em Andamento');


INSERT INTO ItensPedidos
(IDPedido, IDProduto, Quantidade, PrecoUnitario)
VALUES(452, 10, 1, 5.0),
      (452, 31, 1, 12.50);
