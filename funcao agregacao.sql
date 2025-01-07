-- Funções de agregação 
-- Objetvo é obter resultados sumarizados sobre os registros de um banco de dados em uso.

-- CONT  : Número de valores em uma expressão
-- COUNT(*) : Número de registros selecionados
-- SUM : Valores totais em uma expressão numérica
-- MAX : Maior valor da expressão
-- MIN : Menor valor da expressão
-- AVG : Média de valores em uma expressão númerica


-- COUNT: CONTA A QUANTIDADE DE REGISTROS QUE UM CAMPO ESPECIFICO POSSUI.
-- A Função COUNT(CAMPO) ignora valores nulos
-- A função COUNT(*) conta todos os registros com valores nulos

-- EXEMLOS:

SELECT COUNT(*) AS 'CONTA_TUDO', COUNT(CATEGORIA) AS 'IGNORA_NULOS' 
FROM PRODUTO


-- SUM : Retorna  resultado da soma efetuda dos valores de um campo numérico da tabela.
-- Essa função desconsidera na soma os valores do tipo NULL.

-- EXEMPLO:

SELECT SUM(PRECO) AS 'SOMANDO_PRECOS'
FROM PRODUTO
WHERE CATEGORIA = 'AUTOMOTIVO'


-- MAX : Retorna o maior valor de uma lista de valores numéricos ou de tipo data.
-- EXEMPLO:

SELECT MAX(QTD_ESTOQUE) AS ' MAIOR_ESTOQUE'
FROM PRODUTO



-- MIN : Retorna o menor valor de uma lista de valores numéricos ou de tipo data.
-- EXEMPLO :

SELECT MIN(QTD_ESTOQUE) AS 'MENOR_VALOR'
FROM PRODUTO


-- AVG : Retorna a média de valores numéricos de um determinado campo, ou seja, ele soma os valores e divide pela quantidade de linhas dele.
-- Na existência de valores do tipó NULL, eles são ignorados pela função.

-- EXEMPLO:
-- SOMA DOS VALORES:10 +20 +30 = 60
-- QUANTIDADE DE INTENS : 3
-- MÉDIA : 60/3 = 20

SELECT AVG(QTD_ESTOQUE) AS 'MEDIA_AUTOMOTIVO'
FROM PRODUTO
WHERE CATEGORIA = 'AUTOMOTIVO'


-- GROUP BY é responsável por determinar em quais colunas devem ser colocadas ás linhas de saída.
-- Caso a cláusula SELECT contenha função agregadas, a cláusula GROUP BY realiza um cáculo a fim de chegar ao valor,
-- sumárizado para cada uma das colunas, ou seja,agrupar os valores de acordo com os dados específicados.

-- EXEMPLO:

SELECT CATEGORIA, SUM(PRECO) AS 'SOMA_PRECO'
FROM PRODUTO
GROUP BY CATEGORIA

-- Agora fazendo os preços por categoria e por tipo, também ordenando por categoria e por tipo

SELECT CATEGORIA, TIPO, SUM(PRECO) AS 'SOMA_PRECO'
FROM PRODUTO
GROUP BY CATEGORIA, TIPO
ORDER BY CATEGORIA, TIPO


-- HAVING utilizado para filtar os valores agrupados das funções de agregação.
-- É muito importante lembrar que essa cláusula só pode ser usada em parceria com GROUP BY.

--OBS: O HAVING é diferente do WHERE.
-- O WHERE restringe os resultados obtidos sempre após o uso da cléusula FROM.
-- A cláusula HAVING filtra o retorno do agrupaento, sendo necessário a utilização do GROUP BY.

-- EXEMPLO:

SELECT CATEGORIA, SUM(PRECO) AS ' SOMA_PRECO'
FROM PRODUTO
GROUP BY CATEGORIA
HAVING SUM(PRECO) > 3500