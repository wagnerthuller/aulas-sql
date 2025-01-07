-- Criando views 
-- Algumas vantagens de usar views são:
-- Segurança: As views podem ser usadas para limitar o acesso a partes especificas dos dados
-- Por exemplo, você pode criar uma view que mostre apenas as colunas de uma tabela que um
-- usuário ou aplicativo especifico tem permição para ver;

-- Simlicidade:As views podem simplificar a forma como o usuário interage com os dados apresentando os dados de uma maneira
--que seja mais fácil de entender e usar;

-- Ocultação da Complexidade:As views podem ocultar a complexidade de consultas que envolvem junções,funções,subconsultas e
-- outras operações SQL.A view encapsula a complexidade da consulta, e o usuário pode interagir com ela como se fosse uma tabela reguar;

-- Para criar uma view simples, usamos:



--CREATE VIEW view_empregados AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID,
DEPARTMENT_ID FROM HR.EMPLOYEES;



select * from view_empregados;






-- Você também pode criar views que especificam várias tabelas ou views base na cláusula FROM
-- de uma instrução CREATE VIEW.Elas são chamadas de JOIN VIEWS

--CREATE VIEW division1_staff AS 
    SELECT ename, empno, job dname
    FROM emp, dept
    WHERE emp.deptno iN(10, 30)AND emp.deptno = dept.deptno;
     

-- para visualizar os dados da view

SELECT * FROM division1_staff;


-- Podemos criar views sem que a tabela base exista,utilizando a opção FORCE no comando de criação:

-- Este tipo de criação´pode ser útil, por exemplo, em um ambiente de desenvolvimento onde a
-- estruturado banco de dados está mudando frequentemente

-- Se tentarmos selecionar a view sem que a tabela seja criada é retornado um erro, porém após a tabela
-- ser criada podemos realizar a consulta normalmente;


--CREATE FORCE VIEW view_tech AS 
SELECT NomeItem, Categoria
FROM ItemTecnologia;

SELECT * FROM view_tech;


INSERT INTO ItemTecnologia (ItemID, NomeItem, Categoria) VALUES (1, 'iphone 13', 'Smartphone');
INSERT INTO ItemTecnologia (ItemID, NomeItem, Categoria) VALUES (2, 'Galaxy S21', 'Smartphone');
INSERT INTO ItemTecnologia (ItemID, NomeItem, Categoria) VALUES (3, 'Dell XPS 15', 'Laptop');
INSERT INTO ItemTecnologia (ItemID, NomeItem, Categoria) VALUES (4, 'ipad Pro', 'Tablet');
INSERT INTO ItemTecnologia (ItemID, NomeItem, Categoria) VALUES (5, 'Amazon Echo', 'Smart Home');

COMMIT;


-- Para mudar a definição da view,podemos dropa-la novamente ou ultilizar a opção OR REPLACE:

--CREATE OR REPLACE VIEW view_tech AS
SELECT NomeItem
FROM ItemTecnologia;


SELECT * FROM view_tech


-- Podemos utilizar o comando DESCRIBE em views:
--DESC view_tech
--DESC view_empregados


-- Para criar uma view somente leitura, podemos utilizar a cláusula WITH READ ONLY:

--CREATE VIEW view_tech_read_only AS
SELECT ItemID, NomeItem
FROM ItemTecnologia
--WITH READ ONLY;

SELECT * FROM view_tech_read_only;

-- Nesta view não podemos atualizar a tabela base através da view;


select * from dept;

SELECT * FROM emp_dept;
DROP VIEW emp_dept;

--CREATE VIEW emp_dept AS
SELECT emp.empno, emp.ename, emp.deptno, emp.sal, dept.dname, dept.loc
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND dept.loc IN ('DALLAS', 'NEW YORK', 'BOSTON');

SELECT * FROM emp_dept


-- QUANDO ADCIONAMOS ESTA CLÁUSULA AO COMANDO create view, É PROIBIDA QUALQUER MODIFICAÇÃO DE DADOS(INSERÇÃO, ATUALIZAÇÃO)
-- QUE PRODUZAM LINHAS QUE NÃO ESTÃO INCLUÍDAS NAS CONDIÇÕES DA CONSULTA QUE DEFINA A VIE. POR EXEMPLO

--CREATE VIEW depts_emp AS 
SELECT empno, ename, job, deptno
FROM emp
WHERE deptno IN (10, 30)
--WITH CHECK OPTION;


SELECT * FROM depts_emp;


UPDATE depts_emp SET deptno = 20 WHERE empno = 6;


INSERT INTO depts_emp VALUES (20, 'TIAGO', 'SALESMAN', 20);

-- AGORA PARA CONSEGUIR INSERIR MUDAMOS A VIEW COM REPLACE COMO EXEMPLO A BAIXO CONSEGUIMOS FAZER UPDATE E INSERT

--CREATE or replace VIEW depts_emp AS 
SELECT empno, ename, job, deptno
FROM emp
WHERE deptno IN (10, 20, 30)
--WITH CHECK OPTION;

SELECT * FROM depts_emp

UPDATE depts_emp SET deptno = 20 WHERE empno = 6;


INSERT INTO depts_emp VALUES (20, 'TIAGO', 'SALESMAN', 20);

