
CREATE DATABASE praticaPedroLucas;
USE praticaPedroLucas;


CREATE TABLE biblioteca(
bib_resp	VARCHAR(20) NOT NULL,
bib_cod		INT NOT NULL UNIQUE,
bib_nome	VARCHAR(30) NOT NULL,
bib_desc	VARCHAR(50) NOT NULL,
bib_local	VARCHAR(50) NOT NULL,

PRIMARY KEY (bib_cod)
);


CREATE TABLE artigo(
artigo_cod		INT NOT NULL UNIQUE,
artigo_datapub	DATE NOT NULL,
artigo_titulo	VARCHAR(30) NOT NULL,
artigo_isbn		BIGINT NOT NULL UNIQUE,
artigo_area		VARCHAR(15) NOT NULL,
artigo_bib		INT NOT NULL,

PRIMARY KEY (artigo_cod),
FOREIGN KEY (artigo_bib) REFERENCES biblioteca (bib_cod)
ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE funcionario(
func_cod		INT NOT NULL UNIQUE,
func_sexo		CHAR(1) NOT NULL,
func_datanasc	DATE NOT NULL,
func_salario	DOUBLE NOT NULL,
func_endereco	VARCHAR(50) NOT NULL,

PRIMARY KEY (func_cod)
);


CREATE TABLE universidade(
uni_cod		INT NOT NULL UNIQUE,
uni_notamec	DOUBLE NOT NULL,
uni_nome	VARCHAR(20) NOT NULL,
uni_sigla	VARCHAR(5) NOT NULL,
uni_local	VARCHAR(50) NOT NULL,

PRIMARY KEY (uni_cod)
);


CREATE TABLE setor(
setor_cod			INT NOT NULL UNIQUE,
setor_resp			INT NOT NULL,
setor_nome			VARCHAR(20) NOT NULL,
setor_endereco 		VARCHAR(50) NOT NULL,
setor_universidade	INT NOT NULL,

PRIMARY KEY (setor_cod),
FOREIGN KEY (setor_resp) REFERENCES funcionario(func_cod)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (setor_universidade) REFERENCES universidade(uni_cod)
ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE contrata(
contrata_func	INT NOT NULL UNIQUE,
contrata_setor	INT NOT NULL UNIQUE,
contrata_data	DATE NOT NULL,

PRIMARY KEY (contrata_func, contrata_setor),
FOREIGN KEY (contrata_func) REFERENCES funcionario(func_cod)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (contrata_setor) REFERENCES setor(setor_cod)
ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE autor(
autor_cod		INT NOT NULL UNIQUE,
autor_nome		VARCHAR(20) NOT NULL,
autor_email 	VARCHAR(20) NOT NULL,
autor_endereco	VARCHAR(50) NOT NULL,
autor_sexo		CHAR(1) NOT NULL,
autor_setor		INT NOT NULL,

PRIMARY KEY (autor_cod),
FOREIGN KEY (autor_setor) REFERENCES setor (setor_cod)
ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE autoria(
autoria_ordem	VARCHAR(10) NOT NULL,
autoria_autor	INT NOT NULL,
autoria_artigo	INT NOT NULL,

PRIMARY KEY (autoria_autor, autoria_artigo),
FOREIGN KEY (autoria_autor) REFERENCES autor(autor_cod)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (autoria_artigo) REFERENCES artigo(artigo_cod)
ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE curso(
curso_cod		INT NOT NULL UNIQUE,	
curso_nome		VARCHAR(20) NOT NULL,
curso_area		VARCHAR(15) NOT NULL,
curso_preco		DOUBLE NOT NULL,
curso_duracao 	VARCHAR(10) NOT NULL,
curso_uni		INT NOT NULL,

PRIMARY KEY (curso_cod),
FOREIGN KEY (curso_uni) REFERENCES universidade(uni_cod)
ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE aluno(
aluno_cod		INT NOT NULL UNIQUE,
aluno_mat		INT NOT NULL UNIQUE,
aluno_sexo		CHAR(1) NOT NULL,
aluno_nome		VARCHAR(20) NOT NULL,
aluno_periodo	INT NOT NULL,
aluno_curso		INT NOT NULL,

PRIMARY KEY (aluno_cod),
FOREIGN KEY (aluno_curso) REFERENCES curso(curso_cod)
ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE artigo
DROP COLUMN artigo_isbn;

ALTER TABLE artigo
ADD artigo_citacoes INT NOT NULL;

ALTER TABLE artigo
MODIFY COLUMN artigo_titulo VARCHAR(300);

ALTER TABLE universidade
MODIFY COLUMN uni_nome VARCHAR(100);

ALTER TABLE universidade
MODIFY COLUMN uni_sigla VARCHAR(10);

ALTER TABLE setor
MODIFY COLUMN setor_nome VARCHAR(100);

ALTER TABLE autor
MODIFY COLUMN autor_email VARCHAR(100);

ALTER TABLE autor
MODIFY COLUMN autor_nome VARCHAR(100);

ALTER TABLE autoria
MODIFY COLUMN autoria_ordem VARCHAR(50);

ALTER TABLE curso
MODIFY COLUMN curso_duracao INT;

ALTER TABLE curso
MODIFY COLUMN curso_nome VARCHAR(50);

ALTER TABLE curso
MODIFY COLUMN curso_area VARCHAR(50);

ALTER TABLE biblioteca
MODIFY COLUMN bib_nome VARCHAR(100);

ALTER TABLE biblioteca
MODIFY COLUMN bib_desc text;

ALTER TABLE biblioteca
MODIFY COLUMN bib_local VARCHAR(200);


CREATE TABLE revista(
revista_cod 			INT NOT NULL UNIQUE,
revista_titulo 			VARCHAR(100) NOT NULL,
revista_fatorImpacto 	DOUBLE NOT NULL,
revista_formato 		VARCHAR(20) NOT NULL,
revista_qualis 			CHAR(2) NOT NULL,
revista_bib				INT NOT NULL,

PRIMARY KEY (revista_cod),
FOREIGN KEY (revista_bib) REFERENCES biblioteca (bib_cod)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE sessao(
sessao_nome 	VARCHAR(30) NOT NULL,
sessao_cod 		INT NOT NULL UNIQUE,
sessao_resp 	INT NOT NULL,
sessao_uni 		INT NOT NULL,
sessao_bib 		INT NOT NULL,

PRIMARY KEY (sessao_cod),
FOREIGN KEY (sessao_resp) REFERENCES funcionario(func_cod)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (sessao_uni) REFERENCES universidade(uni_cod)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (sessao_bib) REFERENCES biblioteca(bib_cod)
ON UPDATE CASCADE ON DELETE CASCADE
);

# PESSOAS -> AUTOR

INSERT INTO biblioteca VALUES
("Pablo",01,"Livrainos","Deus é bom(as vezes)","Ceu azul,Belo Horizonte-MG"),
("Markin", 02, "Biblioteca Central da UFMG", "Biblioteca da UFMG", "Pampulha, Belo Horizonte"),
("José", 03, "Biblioteca Padre Alberto Antoniazzi", "Biblioteca PUC coração Eurístico", "Coração Eucarístico, Belo Horizonte"),
("Ronaldo", 04, "Biblioteca Professor Geraldo Ataliba", "Biblioteca PUC Campus Monte Alegre", "Perdizes, São Paulo"),
("Denilson", 05, "SiBI", "Sistema de Bibliotecas e Informação da UFRJ", "Urca, Rio de Janeiro"),
("Camile", 06, "Biblioteca Central da UFSC", "Localizado na UFSC", " Carvoeira, Florianópolis"),
("Carmen", 07, "Biblioteca Universitária Reitor Macedo Costa", "UFBA Ondina", "Ondina, Salvador"),
("Mario", 08, "Biblioteca Central Ufrgs", "Disponibilizados acervos variados e oferecem serviços de informação", "Farroupilha, Porto Alegre"),
("Patrícia", 09, "Biblioteca Pública Municipal Leonor de Aguiar Batista", "Biblioteca pública em Betim", "Angola, Betim"),
("Letícia", 10, "Biblioteca Mário de Andrade", "Biblioteca pública", "R. da Consolação, 94");

INSERT INTO artigo VALUES
(01,"2020-04-29","Medidas de distanciamento social no controle da pandemia de COVID-19: potenciais impactos e desafios no Brasil","Saude",01,628),
(02,"2020-05-29","O pesadelo macabro da Covid-19 no Brasil: entre negacionismos e desvarios","Saude",02,77),
(03,"2020-05-08","A pandemia de COVID-19 no Brasil: crônica de uma crise sanitária anunciada","Saude",03,387),
(04,"2020-06-24","Análise da subnotificação de COVID-19 no Brasil","Saude",04,53),
(05,"2020-07-24","Distanciamento e isolamento sociais pela Covid-19 no Brasil: impactos na saúde mental","Saude",05,185),
(6,"1971-01-01","CHACALTAYA Emulsion Chamber Experiment","Física",06,75),
(7,"2014-07-26","Introdução à Estatística Espacial para a Saúde Pública","Saude",07,94),
(8,"1909-08-01","Nova tripanozomiaze humana: estudos sobre a morfolojia e o ciclo evolutivo do Schizotrypanum cruzi n. gen., n. sp., ajente etiolojico de nova entidade morbida do homem","Biologia",08,2270),
(9,"1999-02-23","Starburst99: Synthesis Models for Galaxies with Active Star Formation","Astronomia",09,4428),
(10,"2015-06-12","O cérebro nosso de cada dia","Biologia",10,755);

INSERT INTO revista VALUES
(01,"A CANCER JOURNAL FOR CLINICIANS",286.13,"Digital","A1",01),
(02,"NEW ENGLAND JOURNAL OF MEDICINE",176.079,"Digital","A2",02),
(03,"NATURE REVIEWS MOLECULAR CELL BIOLOGY",113.95,"Digital Impresso","B1",03),
(04,"NATURE MEDICINE",87.241,"Impresso","B1",04),
(05,"NATURE",69.504,"Digital Impresso","B2",05),
(06, "American Society of Hematology", 16.562, "Impresso", "A1",06),
(07, "BMJ Group", 27.604, "Digital", "A1",07),
(08, "American Medical Association", 51.273, "Impresso", "A1",08),
(09, "NEJM Group", 70.670, "Impresso", "A1",09),
(10, "Memórias do Instituto Oswaldo Cruz", 2.147,"Digital Impresso","A2",10);

INSERT INTO universidade VALUES
(01,5,"Universidade Federal de Minas Gerais","UFMG","Belo Horizonte-MG"),
(02,5,"Universidade de São Paulo","USP","São Paulo-SP"),
(03,5,"UNICAMP Universidade Estadual de Campinas","UNICAMP","Campinas-SP"),
(04,5,"Universidade Federal de Santa Catarina","UFSC","Florianópolis-SC"),
(05,5,"Universidade Federal do Rio Grande do Sul","UFRGS","Porto Alegre-RS"),
(06,05,"Universidade Federal do Rio de Janeiro","UFRJ","Rio de Janeiro-RJ"),
(07,05,"Universidade Vanderbilt","VU","Tennessee-EUA"),
(08,3.76,"Universidade Federal da Bahia","UFBA","Salvador-BA"),
(09,4,"Pontifícia Universidade Católica de Minas Gerais","PUCMG","Belo Horizonte-MG"),
(10,4,"Pontifícia Universidade Católica do Rio de Janeiro","PUCRJ","Rio de Janeiro-RJ");

INSERT INTO funcionario VALUES
(01,"M","1978-05-12",4521.85,"Belo Horizonte-MG"),
(02,"M","1995-07-21",4500,"São Paulo-SP"),
(03,"F","1980-06-30",5000,"Campinas-SP"),
(04,"F","1990-10-05",4800.00,"Florianópolis-SC"),
(05,"F","1995-11-09",4700.00,"Porto Alegre-RS"),
(06,"M","1987-05-07",4250,"Rio de Janeiro-RJ"),
(07,"F","1972-12-12",8000,"Tennessee-EUA"),
(08,"M","1980-10-10",5500,"São Paulo-SP"),
(09,"M","1989-11-22",3700,"Salvador-BA"),
(10,"F","1990-12-12",4120,"Rio de Janeiro-RJ");

INSERT INTO setor VALUES
(01,01,"Instituto de Ciências Biológicas","Belo Horizonte-MG",01),
(02,02,"Faculdade de Medicina da Universidade de São Paulo","São Paulo-SP",02),
(03,03,"Instituto de Ciências Agrárias","Campinas-SP",03),
(04,04,"Instituto de Ciências Exatas","Florianópolis-SC",04),
(05,05,"Escola de Engenharia da Universidade Federal do Rio Grande do Sul","Porto Alegre-RS",05),
(06,06,"Faculdade de Medicina da URFJ","Rio de Janeiro-RJ",06),
(07,07,"Setor de Neurociência","Tennessee-EUA",07),
(08,08,"Instituto Nacional de Pesquisas Espaciais","São Paulo-SP",02),
(09,09,"Instituto de Saúde Coletiva","Salvador-BA",08),
(10,06,"Departamento de Engenharia Industrial","Rio de Janeiro-RJ",10);

INSERT INTO autor VALUES
(01,"César Lattes","cesarlattes@gmail.com","Jandaia Do Sul-PR","M",4),
(02,"Oswaldo Cruz","oswaldocruz@gmail.com","São Paulo-SP","M",6),
(03,"Carlos Chagas","carloschagas@gmail.com","Rio de Janeiro-RJ","M",6),
(04,"Suzana Herculano-Houze","suzanahh@gmail.com","Tennessee-EUA","F",7),
(05,"Duilia de Mello","demello@cua.edu","Washington-EUA","F",8),
(06,"Estela M. L. Aquino","estelamlaquino@gmail.com","Salvador-BA","F",9),
(07,"Gastão Wagner de Sousa Campos","brasil.gastaowagner@mpc.com.br","Campinas-SP","M",2),
(08,"Guilherme Loureiro Werneck","guilhermelwerneck@iesc.ufrj.br","Rio de Janeiro-RJ","M",6),
(09,"Bianca Brandão de Paula Antunes","biancabpantunes@gmail.com","Rio de Janeiro-RJ","F",10),
(10,"Rossano Cabral Lima","rossanolima1@gmail.com","Rio de Janeiro-RJ","M",6);

INSERT INTO contrata VALUES
(01,01,"2001-12-12"),
(02,02,"2002-11-11"),
(03,03,"2003-07-10"),
(04,04,"2004-02-10"),
(05,05,"2005-10-08"),
(06,06,"2006-03-09"),
(07,07,"2007-04-11"),
(08,08,"2008-09-02"),
(09,09,"2009-04-01"),
(10,10,"2010-02-01");

INSERT INTO autoria VALUES
("Primeiro Autor",6,1),
("Único Autor",7,2),
("Primeiro Autor",8,3),
("Segundo Autor",9,4),
("Único Autor",10,5),
("Primeiro Autor",1,6),
("Primeiro Autor",2,7),
("Único Autor",3,8),
("Primeiro Autor",4,9),
("Único Autor",5,10);

INSERT INTO sessao VALUES
("Ciência da Computação",01,01,01,01),
("Direito",02,02,02,02),
("Economia",03,03,03,03),
("Engenharia",04,04,04,04),
("Interdisciplinar",05,05,05,05),
("Tecnologia da Informação",06,06,06,06),
("Ciências Administrativas",07,07,07,07),
("Ciências Biológicas e da Saúde",08,08,08,08),
("Design",09,09,09,09),
("Gestão",10,10,10,10);

INSERT INTO curso VALUES
(01, "Ciência da Computação", "Tecnologia", 0, 4, 01),
(02, "Administração", "Administração", 0, 4, 02),
(03, "Psicologia", "Ciências Humanas", 99039, 5, 03),
(04, "Ciências Contábeis", "Ciências Sociais Aplicadas", 0, 4, 04),
(05, "Gestão em Marketing", "Publicidade ", 10008, 2, 05),
(06, "Engenharia de Petróleo", "Ciências Exatas", 0, 5, 06),
(07, "Engineering Maintainable Android Apps", "Tecnologia", 44712, 5, 07),
(08, "Arquitetura e Urbanismo", "Ciências Sociais Aplicadas", 0, 5, 08),
(09, "Biomedicina", "Saúde", 81216, 4, 09),
(10, "Odontologia", "Saúde", 33001.8, 5, 10);

INSERT INTO aluno VALUES
(01,00402392,"M","Vitor Silva",2,1),
(02,00245025,"M","Breno Morais",5,2),
(03,00417210,"M","Alex Soares",4,3),
(04,00578945,"M","Marcos Vinicius",3,4),
(05,00698745,"M","Alvaro Calvo",2,5),
(06,00412548,"F","Triely Silva",2,6),
(07,00369524,"F","Anna Clara",6,7),
(08,00789256,"F","Maria Fernanda",4,8),
(09,00654289,"F","Larissa Hoizter",4,9),
(10,00756348,"F","Lavinnya Wanderbeg",3,10);
