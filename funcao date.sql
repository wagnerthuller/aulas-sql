-- Datepart Resultados Extraindo partes da data com estes exemplos em SQL SERVER SSMS

SELECT
DATEPART(YEAR,GETDATE()) AS 'ANO',
DATEPART(QUARTER,GETDATE() ) AS 'QUARTO DO ANO',
DATEPART(MONTH,GETDATE()) AS 'MES',
DATEPART(DAYOFYEAR,GETDATE()) AS 'DIA DO ANO(DE1 A 365)',
DATEPART(DAY,GETDATE()) AS 'DIA',
DATEPART(WEEK,GETDATE()) AS 'SEMANA',
DATEPART(WEEKDAY,GETDATE()) AS 'DIA DA SEMANA',
DATEPART(HOUR,GETDATE()) AS 'HORA',
DATEPART(MINUTE,GETDATE()) AS 'MINUTO',
DATEPART(SECOND,GETDATE()) AS 'SEGUNDO',
DATEPART(MILLISECOND,GETDATE()) AS 'MILESEGUNDO',
DATEPART(MICROSECOND,GETDATE()) AS 'MICROSEGUNDO',
DATEPART(NANOSECOND,GETDATE()) AS 'NANOSEGUNDO';


-- Proxima função DATEDIFF(): Retorna a diferença em um número inteiro de um intervalo de duas datas usando como argumento o fragmento de comparação

-- EXEMPLO:  DATEDIFF(fragment,data1,data2)


-- Recebendo 3 parâmentros: Primeiro parâmetro: fragmento da data(datepart) que desejamos
-- Segunndo parâmetro: data inicial que será feita a diferença
-- Terceiro praãmetro: data final que será feita a diferença

-- Na prática

SELECT
DATEDIFF(YEAR,'2018-01-01', GETDATE()) AS 'ANO',
DATEDIFF(MONTH,'2018-01-01', GETDATE()) AS 'MÊS',
DATEDIFF(DAY,'2018-01-01', GETDATE()) AS 'DIAS',
DATEDIFF(WEEK,'2018-01-01', GETDATE()) AS 'SEMANA',
DATEDIFF(HOUR,'2018-01-01', GETDATE()) AS 'HORA',
DATEDIFF(MINUTE,'2018-01-01', GETDATE()) AS 'MINUTO';


-- Função DATEADD() -Tem como propósito Sintaxe: incrementar ou subtrair absolutos de uma determinada data.

-- EXEMPLO: DATEADD(parametro1, parametro2,parametro3)

-- Receber 3 parâmetros:
-- Primeiro parâmetro: Fargmentonda data (datepart) que desejamos
-- Segundo parâmetro: Valor que será adicionado ou subtraido da parte da data ou fragmento
-- Terceiro parâmetro: Data que será utilizado


SELECT
DATEADD(YEAR,5, getdate()) AS 'ANO ADICIONADO',
DATEADD(YEAR,-5, getdate()) AS 'ANO SUBTRAIDO',
DATEADD(MONTH,5, getdate()) AS 'MÊS',
DATEADD(DAY,5, getdate()) AS 'DIA',
DATEADD(WEEK,5, getdate()) AS 'SEMANA',
DATEADD(HOUR,5, getdate()) AS 'HORA';


-- Função DATENAME() - Tem como propósito retornar o nome de uma determinada parte da data passad.

-- Recebe 2 parâmetros:
-- Primeiro parâmetro: fragmento da data (datepart) que desejamos.
-- Segundo parâmetro:data a ser utilizada.

-- Sintaxe: DATENAME(fragmento, data)

-- EXEMPLO:

SELECT
DATENAME(YEAR,GETDATE()) AS 'ANO',
DATENAME(MONTH,GETDATE()) AS 'MÊS',
DATENAME(WEEKDAY,GETDATE()) AS 'DIA DA SEMANA';


-- Função YEAR(),MONTH(),DAY(): São extenções da função DATEPART, porém com os argumentos de DATEPART suprimidos(implicitos).

-- Em vez de usar a função DATEPART (MONTH,GETDATE())para retornar o mês, apenas utilizamos a função MONTH (GETDATE()) que produzirá o mesmo resutado

-- A função EOMIONTH retorna o utimo dia do mês da data passada.A partir da versão 2012 do SQL SERVER.
-- Função DAY retorna o dia da data passada
-- Função MONTH retorna o mês da data passada
-- Função YEAR retorna o ano da data passad
-- Função EOMONTH retorna o utimo dia da data passada
-- As funções DAY, MONTH, e YEAR tem somente um parãmetro que é a data informada
-- Para a função EOMONTH eu posso passar um segundo parâmetro opcional para incrementar ou decrementar a data.

-- SINTAXE: DAY, MONTH, YEAR(data) EOMONTH(data,parâmetro opcional)

--EXEMPLO: 

SELECT 
GETDATE()DATA_SISTEMA,
YEAR(GETDATE()) AS 'ANO',
MONTH(GETDATE()) AS 'MÊS',
DAY (GETDATE()) AS 'DIA',
EOMONTH(GETDATE()) AS 'ULTIMO DIA DO MÊS';


-- Para finalizar iremos ver a função:

--ISDATE função que verifica se uma determinada data é válida ou não.
-- Recebe somente 1 parâmetro que é a data a ser validada.
-- Essa função retorna um tipo interno, aonde:
-- 0: data inválida
-- 1: data válida

-- SINTAXE: ISDATE(data)

SELECT ISDATE(GETDATE()) AS TEST_DATE_VALID

SELECT ISDATE('2021-12-13') AS TEST_DATE_INVALID


