insert into cliente VALUES (
null,
"Andrey",
"2005-05-10",
"M",
14981834795
);
update cliente set telefone = 981834795 WHERE cd=3;
show tables;
select * from categoria;
select * from filme;

-- exercício 1 - cadastro dos filmes
insert into filme values (
null,
"VELOZES E FURIOSOS 5",
"2021-05-19",
"2011-05-06",
10,
1
);
insert into filme values (
null,
"AQUAMAN",
"2021-05-19",
"2018-12-21",
2,
1
);
insert into filme values (
null,
"O SENHOR DOS ANÉIS - O RETORNO DO REI",
"2021-05-19",
"2003-12-18",
1,
2
);
insert into filme values (
null,
"DE VOLTA PARA O FUTURO",
"2021-05-19",
"1985-07-03",
2,
2
);

insert into filme values (
null,
"NEED FOR SPEED",
"2021-05-19",
"2014-03-14",
3,
3
);
insert into filme values (
null,
"A CAÇADA",
"2021-05-19",
"2020-05-28",
3,
3
);
insert into filme values (
null,
"COMO EU ERA ANTES DE VOCÊ",
"2021-05-19",
"2016-06-03",
3,
4
);
insert into filme values (
null,
"O MELHOR DE MIM",
"2021-05-19",
"2014-08-17",
3,
4
);
insert into filme values (
null,
"MIB - HOMENS DE PRETO",
"2021-05-19",
"1997-07-02",
5,
5
);
insert into filme values (
null,
"FILHOS DA ESPERANÇA",
"2021-05-19",
"2006-09-22",
5,
5
);
insert into filme values (
null,
"DOUTOR SONO",
"2021-05-19",
"2019-09-08",
1,
6
);
insert into filme values (
null,
"DRACULA 3D",
"2021-05-19",
"2012-09-22",
5,
6
);
insert into filme values (
null,
"UM PRINCÍPE EM NOVA YORK",
"2021-05-19",
"1998-06-29",
10,
7
);
insert into filme values (
null,
"AS BRANQUELAS",
"2021-05-19",
"2004-06-23",
4,
7
);
insert into filme values (
null,
"MUITO BEM ACOMPANHADA",
"2021-05-19",
"2005-02-04",
5,
8
);
insert into filme values (
null,
"COMO EU ERA ANTES DE VOCÊ",
"2021-05-19",
"2016-06-03",
1,
8
);
-- exercício 2 Cadastrar locações em seu nome para 2 filmes a sua escolha, sem definir a data de devolução.

select * from locacao;
select * from cliente;

insert into locacao values (
null,
"2021-05-19",
3,
null
);

update locacao set dt_devolucao = null WHERE id=3;

insert into itens values (
3,
1
);

insert into itens values (
3,
2
);

insert into locacao values (
null,
"2021-05-17",
3,
null
);

-- exercício 3 atualizar o cadastro de locação em seu nome colocando a data de devolução

update locacao set dt_devolucao = "2021-05-30" WHERE id=4;

-- exercício 4 consultar filmes alugados

SELECT nome FROM filme WHERE cd IN
(SELECT id FROM locacao);


-- exercício 5 consultar clientes que tenham feito locação e ainda não tenham devolvido
 
SELECT cd, nome FROM cliente
INNER JOIN locacao
ON id_cliente = cd
ORDER BY id_cliente ASC;

-- exercício 6 consultar filmes que tenham mais de 2 exemplares

SELECT nome, qt_exemplares FROM filme
WHERE qt_exemplares >= 2;

-- exercício 7 consultar se está disponível para locacao = LAGOA AZUL
/*SELECT cd, nome FROM filme WHERE cd NOT IN
(SELECT id_filme FROM itens);*/

SELECT cd, nome FROM filme WHERE nome = "LAGOA AZUL" NOT IN
(SELECT id_filme FROM itens);

-- exercício 8 consultar o telefone do contato do cliente PAULO COPPE - cliente não cadastrado, vou consultar do cliente rodolfo.

SELECT nome, telefone FROM cliente WHERE nome = "Paulo";

-- exercício 9 consultar as locações da cliente Beatriz, mostrando os filmes

SELECT cd, nome FROM cliente 
INNER JOIN locacao
ON id_cliente = cd
WHERE nome = "Beatriz";

-- exercício 10 atualizar o telefone de contato do cliente "Ayan" - cliente não existe.

SELECT * FROM cliente;
UPDATE cliente SET telefone = 141414141 WHERE cd=17;

-- exercício 11 realizar a locação dos filmes "PIRATAS DO VALE DO SILÍCIO" E "PIRATAS DO CARIBE" para o cliente ABNER -- filme não cadastrados.

SELECT * FROM filme;
SELECT * FROM cliente;
SELECT * FROM locacao;

insert into locacao values(
null, 
"2021-05-26",
5,
null
);

insert into itens values(
5,
86
);
insert into locacao values(
null, 
"2021-05-27",
5,
null
);
insert into itens values(
5,
87
);

-- exercício 12 atualizar a locação do cliente abner informando a data de devolução

SELECT * FROM locacao;
update locacao set dt_devolucao = "2021-05-31" WHERE id=18;
update locacao set dt_devolucao = "2021-06-01" WHERE id=19;

-- exercício 13 consulte todos os filmes em ordem alfabética que pertencem a categoria "ação"

SELECT nome FROM filme WHERE id_categoria IN
(SELECT cd FROM categoria WHERE cd = 1) ORDER BY nome ASC;

-- exercício 14 consultar todos os clientes chamados JOÃO

SELECT * FROM cliente WHERE nome = "João";

-- exercício 15 consultar todos os filmes lançados em 2000

SELECT cd, nome, dt_lancamento FROM filme  WHERE YEAR(dt_lancamento) = 2000;

SELECT  year(dt_lancamento)  AS ano FROM filme;
SELECT * FROM filme;

-- exercício 16 consultar o primeiro filme que foi cadastrado na locadora

SELECT * FROM filme WHERE cd = 1;

-- exercício 17 consulte todos os filmes devolvidos hoje

SELECT * FROM locacao WHERE dt_devolucao = "2021-05-20";

-- exercício 18 consulte a quantidade de locações feitas hoje

SELECT * FROM locacao WHERE dt_locacao = "2021-05-20";

-- exercício 19 mostre a quantidade total de exemplares cadastrados na locadora

SELECT COUNT(id) as Total FROM locacao;

-- exercício 20 mostre a quantidade total de filmes alugados hoje

SELECT COUNT(dt_locacao) AS Total FROM locacao WHERE dt_locacao = "2021-05-20";

-- exercício 21 mostre a média de exemplares de filmes cadastrados

SELECT ROUND(AVG(cd),2) AS media FROM filme;

-- exercício 22  consulte o nome de todos os clientes aniversariantes do Mês 2(fevereiro)

SELECT nome, dt_nasc FROM cliente WHERE Month(dt_nasc) = 02;

-- exercício 23 mostre o ultimo filme cadastrado na locadora

SELECT cd, nome FROM filme ORDER BY cd DESC;

-- exercício 24 mostre a quantidade de vezes que o filme 9 foi alugado

SELECT * FROM itens
INNER JOIN filme
ON id_filme  = cd
WHERE cd = 9;

