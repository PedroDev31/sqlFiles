drop database atv_Pedro_Lucas;
create database atv_Pedro_Lucas;
use atv_Pedro_Lucas;

CREATE TABLE revista(
	edicao int NOT NULL,
    nome VARCHAR(15) NOT NULL,
    cod_revista INT4 NOT NULL PRIMARY KEY
);
CREATE TABLE secao(
	tipo VARCHAR(15) NOT NULL,
    desc_secao VARCHAR(15) NOT NULL,
    cod_secao INT4 NOT NULL PRIMARY KEY
);
CREATE TABLE artigo(
	titulo VARCHAR(15) NOT NULL,
    autor VARCHAR(30) NOT NULL,
    cod_artigo INT4 NOT NULL PRIMARY KEY
);
CREATE TABLE autor(
	nome_autor VARCHAR(10) NOT NULL,
    sobrenome VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    matricula_unidade INT NOT NULL,
    cod_autor INT4 NOT NULL PRIMARY KEY,
    cod_aturo_super INT4 NOT NULL
);
CREATE TABLE setor(
	nome_setor VARCHAR(15) NOT NULL,
    local_setor VARCHAR(70) NOT NULL,
    cod_setor INT4 NOT NULL PRIMARY KEY
);
CREATE TABLE universidade(
	nome_universidade VARCHAR(20) NOT NULL,
    local_universidade VARCHAR(15) NOT NULL,
    orcamento float NOT NULL,
    cod_universidade INT4 NOT NULL PRIMARY KEY    
);