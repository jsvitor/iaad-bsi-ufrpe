/* 
 *  QUESTÃO 1 (2,5 pontos)
 *  Considere o esquema abaixo do banco de dados relacional “BD_Startup” (PK estão sublinhadas): 
 *  Startup (id_startup, nome_startup, cidade_sede)
 *  Linguagem_Programação (id_linguagem, nome_linguagem, ano_lançamento)
 *  Programador (id_programador, id_startup, nome_programador, gênero, data_nascimento, email)
 *  id_startup referencia Startup
 *  Programador_Linguagem (id_programador, id_linguagem)
 *  id_programador referencia Programador
 *          	id_linguagem referencia Linguagem_Programação
 *
 *  A) Escreva as instruções DDL necessárias para criação das 4 tabelas do banco 
 *  de dados “BD_Startup” (apresentar o script SQL).
 *  Lembre-se de especificar as PKs e FKs, e incluir as restrições de integridade
 *  que julgar necessárias. Após criação do referido BD, popule-o conforme o estado apresentado a seguir:
 *
 */
BEGIN;

CREATE SCHEMA BD_Startup;

USE BD_Startup;

CREATE TABLE IF NOT EXISTS Startup(
	id_startup INT NOT NULL UNIQUE,
    nome_startup VARCHAR(15),
    cidade_sede VARCHAR(30),
    PRIMARY KEY(id_startup)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- RELACAO COM INFORMACOES DE LINGUAGEM DE PROGRAMACAO
CREATE TABLE IF NOT EXISTS Linguagem_Programacao(
    id_linguagem INT NOT NULL UNIQUE,
    nome_linguagem VARCHAR(15),
    ano_lancamento YEAR,
    PRIMARY KEY(id_linguagem)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- RELACAO COM INFORMACOES DE PROGRAMADOR
CREATE TABLE IF NOT EXISTS Programador(
    id_programador INT NOT NULL UNIQUE,
    id_startup INT NOT NULL,
    nome_programador VARCHAR(30),
    genero CHAR(1),
    data_nascimento DATE,
    email VARCHAR(45),
    PRIMARY KEY(id_programador)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- RELACAO QUE RELACIONA PROGRAMADOR A LIGUAGEM
CREATE TABLE IF NOT EXISTS Programador_Linguagem(
    id_programador INT NOT NULL,
    id_linguagem INT NOT NULL,
    PRIMARY KEY(id_programador, id_linguagem)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ALTERANDO AS RELACOES PARA ADICAO DAS RESTRICOES DE INTEGRIDADE REFERENCIAL
ALTER TABLE Programador ADD FOREIGN KEY(id_startup) REFERENCES Startup(id_startup);
ALTER TABLE Programador_Linguagem ADD FOREIGN KEY(id_programador) REFERENCES Programador(id_programador);
ALTER TABLE Programador_Linguagem ADD FOREIGN KEY(id_linguagem) REFERENCES Linguagem_Programacao(id_linguagem);

/*
 * INSERCOES NA BASE DE DADOS
 */

-- POPULANDO O RELACIONAMENTO Startup COM ESTADO FICTICIO
INSERT INTO Startup VALUES
(10001, "Tech4Toy", "Porto Alegre"),
(10002, "Smart123", "Belo Horizonte"),
(10003, "KnowledgeUp", "Rio de Janeiro"),
(10004, "BSI Next Level", "Recife"),
(10005, "QualiHealth", "São Paulo"),
(10006, "ProEdu", "Florianópolis");

-- POPULANDO O RELACIONAMENTO Linguagem_Programacao
INSERT INTO Linguagem_Programacao VALUES
(20001, "Python", 1991),
(20002, "PHP", 1995),
(20003, "Java", 1995),
(20004, "C", 1972),
(20005, "JavaScript", 1995),
(20006, "Dart", 2011);

-- POPULANDO O RELACIONAMENTO Linguagem_Programacao
INSERT INTO Programador VALUES
(30001, 10001, "João Pedro", "M", "1993-06-23", "joaop@mail.com"),
(30002, 10002, "Paula Silva", "F", "1986-01-10", "paulas@mail.com"),
(30003, 10003, "Renata Vieira", "F", "1991-07-05", "renatav@mail.com"),
(30004, 10004, "Felipe Santos", "M", "1976-11-25", "felipes@mail.com"),
(30005, 10001, "Ana Cristina", "F", "1968-02-19", "anac@mail.com"),
(30006, 10004, "Alexandre Alves", "M", "1988-07-07", "alexandrea@mail.com"),
(30007, 10002, "Laura Marques", "F", "1987-10-04", "lauram@mail.com");

-- POPULANDO O RELACIONAMENTO Programador_Linguagem
INSERT INTO Programador_Linguagem VALUES
(30001, 20001),
(30001, 20002),
(30002, 20003),
(30003, 20004),
(30003, 20005),
(30004, 20005),
(30007, 20001),
(30007, 20002);

