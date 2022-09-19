# Populando mais ainda tabela ENDERECO
INSERT INTO endereco values
(1,'Rua Santo Antonio',23,'Proximo ao lago','Acaílandia',"Maranhão (MA)",6900000,"São Luís"),
(2,'Rua dois',89,'Lanchonete','Agricolândia',"Piauí (PI)",3200000,"Teresina"),
(3,'Rua Santo mateus',6,'Sorveteria','Bunitu',"Ceará (CE)",8400000,"Fortaleza"),
(4,'Rua Das gabirobas',562,NULL,'Parazinho',"Rio Grande do Norte (RN)",3400000,"Natal"),
(5,'Rua nove',69,NULL,'Aguiar',"Paraíba (PB)",3900000,"João Pessoa"),
(6,'Rua don Ruan',99,'Restaurante','Jataúba',"Pernambuco (PE)",9300000,"Recife"),
(7,'Rua vinte e cinco',36,'Livraria','Barra Grande',"Alagoas (AL)",3300000,"Maceió"),
(8,'Rua São gabriel',23,'Proximo a oficina do juca','Campo do Brito',"Sergipe (SE)",2300000,"Aracaju"),
(9,'Rua Governador chico',594,'Proximo a biqueira','Acupe',"Bahia (BA)",15200000,"Salvador"),
(10,'Rua Bernardino Ventura',22,'Proximo ao lago','Belo Horizonte','Minas Gerais(MG)',null,'Belo Horizonte'),
(11,'Rua Pequiá',96,'No morro','Belo Horizonte','Minas Gerais(MG)',89503,'Belo Horizonte'),
(12,'Rua Postal',98,'PErto do campo','Campinas','São Paulo(SP)',89503,'São Paulo'),
(13,'Rua Prefeito Coronel Antenor Mesquita',52,null,'FLorianopólis','Santa Catarina(SC)',89503,'FLorianopólis'),
(14,'Avenida Sertório',12,'Lanchonete','Porto Alegre','Rio Grande Do Sul(RS)',89503,'Porto Alegre'),
(15,'Rua Major Vítor Hugo',89,null,'Rio de Janeiro','Rio de Janeiro(RJ)',89503,'Rio de Janeiro'),
(16,'Travessa da Verdade',45,'Perto da academia','Rio de Janeiro','Rio de Janeiro(RJ)',89503,'Rio de Janeiro'),
(17,'Travessa Robson Pierre',62,'Perto do campinho','Salvador','BAhia(BA)',89503,'Salvador'),
(18,'Rua Capitão Rubens',23,null,'São Paulo','São Paulo(SP)',89503,'São Paulo'),
(19,'Rua Gonçalves Dias',20,'Nos eua','Tennessee','Tennessee(EUA)',89503,'Nashville'),
(20,'Rua Entre-Folhas',45,'Na biqueira','Belo Horizonte','Minas Gerais(MG)',89503,'Belo Horizonte'),
(21,'Rua Vicente Martin Solera',692,'Proximo ao barra','Belo Horizonte','Minas Gerais(MG)',null,'Belo Horizonte'),
(22,'Rua Gelcemina Maria Oro',23,null,'São Paulo','São Paulo(SP)',89503,'São Paulo'),
(23,'Rua Curitiba',98,'PErto do campo','Campinas','São Paulo(SP)',89503,'São Paulo'),
(24,'Rua Hilbert Raduenz',52,null,'FLorianopólis','Santa Catarina(SC)',89503,'FLorianopólis'),
(25,'Rua Francisco Winter',12,'Lanchonete','Porto Alegre','Rio Grande Do Sul(RS)',89503,'Porto Alegre'),
(26,'Rua Gregório Peron',89,null,'Rio de Janeiro','Rio de Janeiro(RJ)',89503,'Rio de Janeiro'),
(37,'Estrada Carlos Schroeder',20,'Nos eua','Tennessee','Tennessee(EUA)',89503,'Nashville'),
(28,'Rua Corupás',23,null,'São Paulo','São Paulo(SP)',89503,'São Paulo'),
(29,'Travessa Robson Pierre',62,'Perto do campinho','Salvador','BAhia(BA)',89503,'Salvador'),
(30,'Rua Francisco Braga',45,'Perto da academia','Rio de Janeiro','Rio de Janeiro(RJ)',89503,'Rio de Janeiro'),
(31,'Rua Bernardino Ventura',22,'Proximo ao lago','Belo Horizonte','Minas Gerais(MG)',null,'Belo Horizonte'),
(32,'Rua Postal',98,'PErto do campo','Campinas','São Paulo(SP)',89503,'São Paulo'),
(33,'Rua Curitiba',98,'PErto do campo','Campinas','São Paulo(SP)',89503,'São Paulo'),
(34,'Rua Hilbert Raduenz',52,null,'FLorianopólis','Santa Catarina(SC)',89503,'FLorianopólis'),
(35,'Avenida Sertório',12,'Lanchonete','Porto Alegre','Rio Grande Do Sul(RS)',89503,'Porto Alegre'),
(36,'Travessa da Verdade',45,'Perto da academia','Rio de Janeiro','Rio de Janeiro(RJ)',89503,'Rio de Janeiro'),
(37,'Estrada Carlos Schroeder',20,'Nos eua','Tennessee','Tennessee(EUA)',89503,'Nashville'),
(38,'Rua Postal',98,'PErto do campo','Campinas','São Paulo(SP)',89503,'São Paulo'),
(39,'Travessa Robson Pierre',62,'Perto do campinho','Salvador','BAhia(BA)',89503,'Salvador'),
(40,'Rua Francisco Braga',45,'Perto da academia','Rio de Janeiro','Rio de Janeiro(RJ)',89503,'Rio de Janeiro');


#-------------------------------------------------------------------------------------------------------------------------
# Selecione todos os Códigos e Nome de um Local
SELECT uni_nome as "Universidade", uni_local "Local"
FROM universidade;

#-------------------------------------------------------------------------------------------------------------------------
# Selecionando nome e idade de todas PESSOAS
ALTER TABLE funcionario ADD COLUMN func_nome VARCHAR(30) NOT NULL;

UPDATE `praticaalvarovitor`.`funcionario` SET `func_nome` = 'Breno Soares' WHERE (`func_cod` = '1');
UPDATE `praticaalvarovitor`.`funcionario` SET `func_nome` = 'Alex Fernandes' WHERE (`func_cod` = '2');
UPDATE `praticaalvarovitor`.`funcionario` SET `func_nome` = 'Larissa Fernada' WHERE (`func_cod` = '3');
UPDATE `praticaalvarovitor`.`funcionario` SET `func_nome` = 'Maria de Jesus' WHERE (`func_cod` = '4');
UPDATE `praticaalvarovitor`.`funcionario` SET `func_nome` = 'Bianca Clara' WHERE (`func_cod` = '5');
UPDATE `praticaalvarovitor`.`funcionario` SET `func_nome` = 'Pedro Henrique' WHERE (`func_cod` = '6');
UPDATE `praticaalvarovitor`.`funcionario` SET `func_nome` = 'Yago Oliveira' WHERE (`func_cod` = '8');
UPDATE `praticaalvarovitor`.`funcionario` SET `func_nome` = 'Vitor Henrique' WHERE (`func_cod` = '9');
UPDATE `praticaalvarovitor`.`funcionario` SET `func_nome` = 'Tonia Hernandes' WHERE (`func_cod` = '7');
UPDATE `praticaalvarovitor`.`funcionario` SET `func_nome` = 'Marcela Costa' WHERE (`func_cod` = '10');

SELECT autor_nome, TIMESTAMPDIFF(YEAR, autor_nasc, CURDATE()) as autor_idade
FROM autor
ORDER BY autor_nome ASC;

SELECT func_nome, TIMESTAMPDIFF(YEAR, func_datanasc, CURDATE()) as funcionario_idade
FROM funcionario
ORDER BY func_nome ASC;

#-------------------------------------------------------------------------------------------------------------------------
# Todas PESSOAS maiores de 18 anos
SELECT autor_nome, TIMESTAMPDIFF(YEAR, autor_nasc, CURDATE()) as autor_idade
FROM autor
HAVING autor_idade >=18
ORDER BY autor_nome ASC;

SELECT func_nome, TIMESTAMPDIFF(YEAR, func_datanasc, CURDATE()) as funcionario_idade
FROM funcionario
HAVING funcionario_idade >=18
ORDER BY func_nome ASC;

#-------------------------------------------------------------------------------------------------------------------------
# Todas tuplas de Endereço aonde estado seja MG
SELECT *
FROM endereco
WHERE end_estado LIKE "%MG%" OR "%Minas Gerais%";

#-------------------------------------------------------------------------------------------------------------------------
# Todas as idades de todas as pessoas
SELECT autor_nome, TIMESTAMPDIFF(YEAR, autor_nasc, CURDATE()) as autor_idade
FROM autor
ORDER BY autor_nome ASC;

SELECT func_nome, TIMESTAMPDIFF(YEAR, func_datanasc, CURDATE()) as funcionario_idade
FROM funcionario
ORDER BY func_nome ASC;

#-------------------------------------------------------------------------------------------------------------------------
# Todos os sexos diferentes da entidade do tipo Pessoa
SELECT DISTINCT autor_sexo
FROM autor
ORDER BY autor_sexo ASC;

SELECT DISTINCT func_sexo
FROM funcionario
ORDER BY func_sexo ASC;

#-------------------------------------------------------------------------------------------------------------------------
# Todos os dados de Endereço cujo Estado seja "SP" e ordene de maneira Crescente por Rua, Cidade e Estado.
SELECT end_rua, end_cidade, end_estado, end_num, end_cod
FROM endereco
WHERE end_estado LIKE "%SP%" OR "%São Paulo%"
ORDER BY end_rua, end_cidade, end_estado ASC;

#-------------------------------------------------------------------------------------------------------------------------
# - Selecione todos os Nomes de Pessoa e ordene de maneira Decrescente por Nome, ID/COD
SELECT autor_nome, autor_cod
FROM autor
ORDER BY autor_nome DESC;

SELECT func_nome, func_cod
FROM funcionario
ORDER BY func_nome DESC;

#-------------------------------------------------------------------------------------------------------------------------
# Exiba todos os todos os custos ou valores da entidade do tipo Ação e dê reajuste de 13%.
SELECT curso_cod, curso_nome, curso_preco*1.13
FROM curso
ORDER BY curso_cod ASC;


#-------------------------------------------------------------------------------------------------------------------------
# - Selecione os dados de Endereço cujo Estado começa "Par" e "Rio"
select *
from endereco
where end_estado like 'par%';

select *
from endereco
where end_estado like 'rio%' ;


#-------------------------------------------------------------------------------------------------------------------------
