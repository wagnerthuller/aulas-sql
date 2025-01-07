SELECT * FROM CAIXA


UPDATE CAIXA 
SET SALDO_INICIAL = 150
WHERE NUMERO = 1

DELETE CAIXA 
WHERE NUMERO = 1
GO



-- Criando trigger para creditar o valor da tabela caixa


SELECT @DATA = i.DATA, @VALOR = i.VALOR, @CODIGO = i.CODIGO FROM inserted AS i

UPDATE CAIXA 
SET SALDO_FINAL = SALDO_FINAL + @VALOR
WHERE DATA = @DATA

GO

-- CRIANDO TRIGGER PARA DEBITAR O VALOR DA TABELA CAIXA


SELECT @DATA = i.DATA, @VALOR = i.VALOR, @CODIGO = i.CODIGO FROM inserted AS i

UPDATE CAIXA 
SET SALDO_FINAL = SALDO_FINAL - @VALOR
WHERE DATA = @DATA

go


-- INSERINDO TABELA CAIXA
INSERT INTO CAIXA
VALUES (1,GETDATE(),100,100)
GO

-- VERIFICANDO TABELA CAIXA
SELECT * FROM CAIXA

-- TESTANDO TRIGGER DE INSERT 
INSERT INTO VENDAS
VALUES (2, GETDATE(),50)


-- TESTANDO TRIGGER DE DELETE 
DELETE FROM VENDAS
WHERE CODIGO = 2