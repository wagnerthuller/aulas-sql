CREATE DATABASE mta_backup


CREATE TABLE tb_mta_backup
(
COD TINYINT IDENTITY,
DESCRICAO VARCHAR(20)
)

INSERT INTO tb_mta_backup (DESCRICAO)
VALUES ('Linha A '), ('Linha B '), ('Linha C ')