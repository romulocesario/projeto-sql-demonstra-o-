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
