create database teste_pedro_nathalia;
use teste_pedro_nathalia;

create table mae (
nome_m    		Varchar (10)      not null ,
sobrenome_m  	Varchar(15)  	  not null ,
idade_m      	int				not null,
Cpf 	       	int   			not null , 
PRIMARY KEY (cpf)
);

CREATE TABLE FILHO (
nome_f   	 Varchar(10)    not null,
sobrenome_f  Varchar(15)	not null,
idade_f  		Int      	not null,
Cpf 	       	int   		not null , 

PRIMARY KEY (cpf),
foreign key(cpf) references mae(cpf)
);

CREATE TABLE FILHA ( 
nome_n    		Varchar(10)      not null ,
sobrenome_n  	Varchar(15)   not null,
idade_n   		int (4)         	not null,
Cpf 	       	int   		not null , 

primary key (cpf),
foreign key(cpf) references mae(cpf)


);
CREATE TABLE PAI ( 
nome_p   		Varchar (10)       not null ,
sobrenome_p  	Varchar(15)         not null ,
idade_p      	Integer (3) ,
Cpf 	       	int   			not null , 

primary key (cpf),
foreign key(cpf) references mae(cpf)

);

insert into mae(nome_m,sobrenome_m,idade_m,cpf) 	values 		('kenia','jordao',38,'1236532569');
insert into filho(nome_f,sobrenome_f,idade_f,cpf_f) values 		('Joao','jordao',16,'2305623508');
insert into filha(nome_n,sobrenome_n,idade_n,cpf) 	values 		('maria','teixeira',12,'3026523598');

use teste_pedro_nathalia;

drop table pai;
drop table mae;
drop table filho;
drop table filha;
