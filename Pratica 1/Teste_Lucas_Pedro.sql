CREATE DATABASE Teste_Lucas_Pedro;
use Teste_Lucas_Pedro;

CREATE TABLE cadastrosocial(
	nome_cadastrosocial VARCHAR(20),
    endereco_cadastrosocial VARCHAR(30),
    id_cadastrosocial DOUBLE NOT NULL,
    telefone_cadastrosocial DOUBLE,
    PRIMARY KEY(codigo_cadastrosocial)
);

CREATE TABLE pessoa(
	cpf_pessoa VARCHAR(11) NOT NULL,
    nome_pessoa VARCHAR(30) NOT NULL,
	data_nascimento_pessoa DATE NOT NULL,
	id_cadastrosocial_pessoa DOUBLE NOT NULL,
    sexo_pessoa CHAR(1) NOT NULL,
    
    PRIMARY KEY(cpf),
    FOREIGN KEY (id_cadastrosocial_pessoa) REFERENCES cadastrosocial(id_cadastrosocial)
);

CREATE TABLE empregado(
	cpf_empregado VARCHAR(11) NOT NULL,
	setor_nome VARCHAR(20) NOT NULL,
    salario_empregado FLOAT NOT NULL,
    cargo_empregado CHAR(15),
	desc_cargo_empregado TEXT,
    id_empregado VARCHAR(20) NOT NULL,
    data_de_admicao_empregado DATE NOT NULL,
    
    PRIMARY KEY(id_empregado),
    FOREIGN KEY (cpf_empregado) REFERENCES pessoa(cpf)
);

CREATE TABLE resposavelFamiliar(
	cpf_resposavelFamiliar VARCHAR(11) NOT NULL,
    id_resposavelFamiliar DOUBLE NOT NULL,
    
    PRIMARY KEY(id_resposavelFamiliar , cpf_resposavelFamiliar),
    FOREIGN KEY(cpf_resposavelFamiliar) REFERENCES pessoa(cpf)
);

CREATE TABLE dependenteFamiliar /*FILHO */(
	id_dependenteFamiliar VARCHAR(11) NOT NULL,
    cpf_dependenteFamiliar VARCHAR(11) NOT NULL,
    id_dependenteFamiliar  VARCHAR(15),
    
    
    PRIMARY KEY(codigo_dependenteFamiliar),
    FOREIGN KEY(cpf_dependenteFamiliar) REFERENCES pessoa(cpf),
	FOREIGN KEY(cod_dependente_resposavel) REFERENCES resposavel(cpf_resposavel)
);
CREATE TABLE cadastro(
	id_cadastro DOUBLE NOT NULL,
    data_cadastro DATE,
    responsalvel_familiar_cadastro VARCHAR(20) NOT NULL,
    dependente_familiar_cadastro VARCHAR(20) NOT NULL,
    nome_mae_cadastro VARCHAR(20) NOT NULL,
    FOREIGN KEY(responsalvel_familiar_cadastro) REFERENCES cadastrosocial(nome_cadastrosocial),
    FOREIGN KEY(id_cadastro) REFERENCES pessoa(id_cadastrosocial_pessoa)

);

CREATE TABLE consulta(

	id_consulta DOUBLE NOT NULL,
    data_consulta DATE,
    data_nascimento_consulta DATE NOT NULL,
    nome_pessoa_consulta VARCHAR(20) NOT NULL,
    nome_mae_consulta VARCHAR(20) NOT NULL,
    
   PRIMARY KEY(id_consulta),
   FOREIGN KEY(nome_mae_consulta) REFERENCES cadastro(nome_mae_cadastro),
   FOREIGN KEY(nome_pessoa_consulta) REFERENCES cadastrosocial(nome_cadastrosocial),
   FOREIGN KEY(id_paciente_consulta) REFERENCES pessoa(id_pessoa)
);





DROP TABLE dependenteFamiliar; 
DROP TABLE resposavelFamiliar;
DROP DATABASE Teste_Lucas_Pedro;