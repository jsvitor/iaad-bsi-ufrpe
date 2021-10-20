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

CREATE SCHEMA startup_bd;

USE startup_bd;

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

