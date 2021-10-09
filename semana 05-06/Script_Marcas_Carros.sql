-- Introdução ao Armazenamento e Análise de Dados - IAAD
-- Script para criação e inserção de dados nas tabelas Carros e Marcas

create schema junções;
use junções;

create table marcas(
marca varchar(50) primary key, 
sede varchar(50),
ano_fundação int);

create table carros(
marca varchar(50),
carro varchar(50),
ano int,
cor varchar(50),
primary key (marca, carro, ano, cor));

insert into marcas values
('Volkswagem','Alemanha',1937), ('Ford','Estados Unidos', 1903), ('General Motors','Estados Unidos', 1908), 
('Fiat','Itália', 1899), ('Renault','França', 1899), ('Hyundai','Coreia do Sul', 1967);

insert into carros values 
('Volkswagem','Fox',2019,'preto'), ('Volkswagem','Saveiro',2020,'preto'), ('Ford','Ecosport',2019,'verde'), 
('Ford','KA',2020,'prata'), ('Fiat','Argo',2019,'branco'), ('Fiat','Uno',2020,'preto'), 
('Fiat','Mobi',2019,'prata'), ('Fiat','Uno',2018,'prata'), ('Fiat','Mobi',2020,'verde'), 
('Fiat','Uno',2019,'branco'), ('Honda','HR-V',2020,'prata'), ('Honda','Civic',2019,'preto'), 
('Honda','HR-V',2019,'azul'), ('Toyota','Corolla',2019,'verde');

