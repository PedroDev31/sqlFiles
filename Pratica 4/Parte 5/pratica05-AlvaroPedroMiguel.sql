# Adicionando data de nascimento aos autores(PESSOA)
ALTER TABLE autor ADD COLUMN autor_nasc date not null;


# Populando a data de nascimento
UPDATE `praticaalvarovitor`.`autor` SET `autor_nasc` = '1954-12-12' WHERE (`autor_cod` = '1');
UPDATE `praticaalvarovitor`.`autor` SET `autor_nasc` = '1879-07-09' WHERE (`autor_cod` = '3');
UPDATE `praticaalvarovitor`.`autor` SET `autor_nasc` = '1963-11-27' WHERE (`autor_cod` = '5');
UPDATE `praticaalvarovitor`.`autor` SET `autor_nasc` = '1962-11-10' WHERE (`autor_cod` = '6');
UPDATE `praticaalvarovitor`.`autor` SET `autor_nasc` = '1960-10-28' WHERE (`autor_cod` = '7');
UPDATE `praticaalvarovitor`.`autor` SET `autor_nasc` = '1974-12-15' WHERE (`autor_cod` = '8');
UPDATE `praticaalvarovitor`.`autor` SET `autor_nasc` = '1872-08-05' WHERE (`autor_cod` = '2');
UPDATE `praticaalvarovitor`.`autor` SET `autor_nasc` = '1976-10-11' WHERE (`autor_cod` = '10');
UPDATE `praticaalvarovitor`.`autor` SET `autor_nasc` = '1972-02-01' WHERE (`autor_cod` = '4');
UPDATE `praticaalvarovitor`.`autor` SET `autor_nasc` = '1990-05-06' WHERE (`autor_cod` = '9');


# Selecionando nome e idade de cada autor(PESSOA)
SELECT autor_nome, TIMESTAMPDIFF(YEAR, autor_nasc, CURDATE()) as autor_idade
FROM autor
ORDER BY autor_nome ASC;


# Criando a tabela endereço
CREATE TABLE endereco(
	end_cod int not null unique,
    end_rua varchar(50),
    end_num int,
    end_compl varchar(60),
    end_cidade varchar(50),
    end_estado varchar(50) not null,
    end_populacao double,
    end_capital Varchar(50),
   
    primary key (end_cod)
);


# Populando a tabela endereço
INSERT INTO endereco values
(1,'Rua Santo Antonio',23,'Proximo ao lago','Acaílandia',"Maranhão (MA)",6900000,"São Luís"),
(2,'Rua dois',89,'Lanchonete','Agricolândia',"Piauí (PI)",3200000,"Teresina"),
(3,'Rua Santo mateus',6,'Sorveteria','Bunitu',"Ceará (CE)",8400000,"Fortaleza"),
(4,'Rua Das gabirobas',562,NULL,'Parazinho',"Rio Grande do Norte (RN)",3400000,"Natal"),
(5,'Rua nove',69,NULL,'Aguiar',"Paraíba (PB)",3900000,"João Pessoa"),
(6,'Rua don Ruan',99,'Restaurante','Jataúba',"Pernambuco (PE)",9300000,"Recife"),
(7,'Rua vinte e cinco',36,'Livraria','Barra Grande',"Alagoas (AL)",3300000,"Maceió"),
(8,'Rua São gabriel',23,'Proximo a oficina do juca','Campo do Brito',"Sergipe (SE)",2300000,"Aracaju"),
(9,'Rua Governador chico',594,'Proximo a biqueira','Acupe',"Bahia (BA)",15200000,"Salvador");


# Selecionando o estado com a MAIOR população
SELECT end_estado as "Nome do estado", MAX(end_populacao) as "População"
FROM endereco;


# Selecionando o estado com a MENOR população
SELECT end_estado as "Nome do estado", MIN(end_populacao) as "População"
FROM endereco;