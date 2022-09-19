drop database Loja_alex_Pedro;
CREATE DATABASE Loja_alex_Pedro;
USE Loja_alex_Pedro ;



create table fornecedor(

codigo	varchar(20)		not null ,
id_fornecedor	int 	not null primary key,
nome	varchar(15)		not null,
cidade	varchar(20)		not null

);

create table peca(
codigop	varchar(20)		not null ,
nome	varchar(15)		not null,
cor 	varchar(20),
peso	float,
cidade	varchar(15),
id_peca	int 			not null	primary key

);


create table fornece(
	cod_Fornecedor	varchar(20)	not null ,
    cord_peca		varchar(20),
    qde				int,
    id_Fornecimento	int 	not null	primary key,
    id_fornecedor int not null ,
    id_peca	 int not null, 
    
    foreign key (id_fornecedor) references fornecedor (id_fornecedor), 
	foreign key (id_peca) references peca (id_peca)
    
);
/*INSERTS*/

insert into fornecedor value('F1',64034,'Smith','Londres');
insert into fornecedor value('F2',47744,'Jones  ','Paris');
insert into fornecedor value('F3',04645,'Blake','Paris');
insert into fornecedor value('F4',45533,'Clark','Londres');
insert into fornecedor value('F5',20404,'Adams','Atenas');
insert into fornecedor value('F1',76644,'John','Roma');
insert into fornecedor value('',47663,'Gates','Roma');


/*insert 2 incorreto: Pois na peca de codigo p7 recebe azul em peso, que deveria receber um numero em float*/
Insert into peca values('P1','Porca','Vermelho',12.0,'Londres',03678);
Insert into peca values('P2','Pino','Verde',12.0,'Londres',78487);
Insert into peca values('P3','Parafuso','Azul',12.0,'Londres',39728);
Insert into peca values('P4','Parafuso','Vermelho',12.0,'Londres',88436);
Insert into peca values('P5','Came','Azul',12.0,'Londres',26322);
Insert into peca values('P6','Tubo','Vermelho',12.0,'Londres',08744);
Insert into peca values('P1','Tubo','',0,'',29371);
Insert into peca values('P7','Canivete','Azul',0,'',28428);
/*incorreto pois recebe azul em int */
INSERT INTO fornece VALUES ('F1','P1',300,01175,64034,03678);
INSERT INTO fornece VALUES ('F1','P2',200,61224,64034,78487);
INSERT INTO fornece VALUES ('F1','P3',400,26675,64034,39728);
INSERT INTO fornece VALUES ('F1','P4',200,11522,64034,88436);
INSERT INTO fornece VALUES ('F1','P5',100,44182,64034,26322);
INSERT INTO fornece VALUES ('F1','P6',100,25806,64034,08744);
INSERT INTO fornece VALUES ('F2','P1',300,42444,47744,03678);
INSERT INTO fornece VALUES ('F2','P2',400,80000,47744,78487);
INSERT INTO fornece VALUES ('F3','P2',200,40560,04645,78487);
INSERT INTO fornece VALUES ('F4','P2',200,95508,45533,78487);
INSERT INTO fornece VALUES ('F4','P4',300,29026,45533,88436);
INSERT INTO fornece VALUES ('F4','P5',400,64399,45533,26322);
INSERT INTO fornece VALUES ('F1','P1',500,45069,64034,03678);
INSERT INTO fornece VALUES ('F1','P7',0,38364,64034,28428);
INSERT INTO fornece VALUES ('F2','P3',0,78566,azul,39728);


Alter table peca add valor int ;
Alter table fornecedor add cnpj int8;
alter table fornece add Data_fornece date;

Insert into peca values('P1','Porca','Preto',12.0,'Londres',02678,5.50);
Insert into peca values('P2','Pino','Vermelho',10.5,'Nova York',02386,2.50);
Insert into peca values('P7','Canivete','Cinza',20.0,'Bangu',67931,20.99);
Insert into peca values('P4','Parafuso','Rosa',9.5,'Petropolis',31997,2.90);

insert into fornecedor values ('F4',44727,'Jonas','Bangu',22671711000120);
insert into fornecedor values ('F7',68545,'Romario','Nova York',32671711000360);
insert into fornecedor values ('F9',42262,'Tiringa ','Londres',32671711000145);
insert into fornecedor values ('F0',13138,'Jailson','Ipatinga',12671511000654);

INSERT INTO fornece VALUES ('F4','P1',150,62673,44727,02678,'2022-07-10');
INSERT INTO fornece VALUES ('F7','P2',250,97079,68545,02386,'2022-07-11');
INSERT INTO fornece VALUES ('F9','P7',399,61086,42262,67931,'2022-07-12');
INSERT INTO fornece VALUES ('F0','P4',467,65171,13138,31997,'2022-07-13');

alter table peca modify peso double ;
alter table fornece modify qde int (10);

delete from peca where cor='vermelho' and peso=19;
delete from fornecedor where nome='Gates';
delete from fornecedor where cod_Fornecedor='F1';


alter table peca drop column valor; 
drop table fornecedor,peca ,fornece;
