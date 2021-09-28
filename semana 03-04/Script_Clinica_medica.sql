-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Script do Banco de Dados clinica medica

begin;
create schema clinica_medica_jsvitor;

use clinica_medica_jsvitor;
-- drop schema clinica_medica_jsvitor;
-- Tabela com informações de clínicas médicas
create table if not exists Clinica(
	CodCli int not null,
    NomeCli varchar(15),
    Endereco varchar(40),
    Telefone char(11),
    Email varchar(40),
    primary key(CodCli)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;

-- Tabela com informações de médicos
create table if not exists Medico(
	CodMed int not null,
    NomeMed varchar(15),
	Genero varchar(15),
    Telefone char(11),
    Email varchar(40) unique,
    CodEspec int(3),
    primary key(CodMed)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;

-- Tabela com informações de pacientes
create table if not exists Paciente(
	CpfPaciente char(11) not null,
    NomePac varchar(15),
    DataNascimento date,
    Genero varchar(15),
    Telefone char(11),
    Email varchar(40) unique,
    primary key(CpfPaciente)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;

-- Tabela que relaciona médicos a clínicas
create table if not exists ClinicaMedico(
	CodCli int not null,
    CodMed int not null,
    DataIngresso date,
    CargaHorariaSemanal float(4, 2) DEFAULT 20,
    primary key(CodCli, CodMed)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;

-- tabela com informações da agenda de consultas dos médicos
create table if not exists AgendaConsulta (
	CodCli int not null,
    CodMed int not null,
    CpfPaciente char(11) not null,
    DataHora datetime not null,
    primary key(CodCli, CodMed, CpfPaciente, DataHora)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;

-- tabela com informações de especialidades médicas
create table if not exists Especialidade(
	CodEspec int not null,
    NomeEspec varchar(30),
    Descricao varchar(40) not null,
    primary key(CodEspec)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;

-- alterando as relações para adicionar as chaves estrangeiras
alter table Medico add foreign key(CodEspec) references Especialidade(CodEspec) on update cascade on delete cascade;
alter table ClinicaMedico add foreign key(CodCli) references Clinica(CodCli);
alter table ClinicaMedico add foreign key(CodMed) references Medico(CodMed) on update cascade on delete cascade;
alter table AgendaConsulta add foreign key(CodCli, CodMed) references ClinicaMedico(CodCli, CodMed) on update cascade  on delete cascade;
alter table AgendaConsulta add foreign key(CpfPaciente) references Paciente(CpfPaciente) on update cascade on delete restrict;
-- adicionando um valor defalt à carga horária semanal
-- alter table ClinicaMedico alter CargaHorariaSemanal on update 20 ; -- my sql não suporta

-- populando o banco de dados
-- inserções na relação Especialidades
insert into Especialidade(CodEspec, NomeEspec, Descricao) values (0001, 'Clínico Geral', 'Consultas, exames, prescricoes.');
insert into Especialidade(CodEspec, NomeEspec, Descricao) values (0002, 'Pediatria', 'Assistência à criança e ao adolescente.');
insert into Especialidade values (0003, 'Odontologista', 'Cuidados bucais');


-- inserções na relação Clínica
insert into Clinica(CodCli, NomeCli, Endereco, Telefone, Email) 
values (1001, 'Renascer', 'Rua Exp. Guilherme Salvador, 57 - Recife', '81995374533', 'oi@renascer.com');
insert into Clinica values (1002, 'Sim!', 'Av. Vieira Aguiar, 3234 - Olinda', '81995374537', 'contato@sim.com.br');
insert into Clinica values (1003, 'Hapvida', 'Rod BR 101, km 30 - Recife', '81995373544', 'hapvida@sac.com.br');


-- inserções na relação Paciente date: YYYY:MM:DD
insert into Paciente (CpfPaciente, NomePac, DataNascimento, Genero, Telefone, Email)
values ('12345678912', 'Valéria', '1980-01-22', 'F', '88995374501', 'val@gmail.com');
insert into Paciente values ('12345678913', 'Jonh', '1982-01-23', 'M', '88995374573', 'amplificado@gmail.com');
insert into Paciente values ('12345678914', 'Helena', '1999-01-23', 'F', '88995374574', 'Helleena@gmail.com');
insert into Paciente values ('12345678915', 'Bonifácio', '2018-11-10', 'M', '88995374575', 'jose_bonifacio@ufrpe.br');

-- inserções na associação Medico
insert into Medico (CodMed, NomeMed, Genero, Telefone, Email, CodEspec)
values (2001, 'Arlindo', 'M', '81995078534', 'arlindomorais@gmail.com', 0001);
insert into Medico values (2002, 'Marília', 'F', '81995078534', 'marilia@ooutlook.com', 0002);
insert into Medico values (2003, 'Vitória', 'F', '81995078534', 'vitoria@ooutlook.com', 0003);
-- describe Medico;

-- inserções na relação ClinicaMedico
insert into ClinicaMedico (CodCli, CodMed, DataIngresso, CargaHorariaSemanal) values (1001, 2001, '2015-11-21', 40);
insert into ClinicaMedico values (1001, 2002, '2021-09-25', 15);
insert into ClinicaMedico values (1001, 2003, '2017-07-22', 30.5);
insert into ClinicaMedico values (1002, 2003, '2017-08-21', 9.1);
insert into ClinicaMedico values (1003, 2003, '2002-02-02', 45);

-- inserções de tuplas na relação AgendaConsulta  DATETIME format: 'YYYY-MM-DD hh:mm:ss'
insert into AgendaConsulta (CodCli, CodMed, CpfPaciente, DataHora) values (1001, 2001, '12345678912', '2021-09-29 14:30:00');
insert into AgendaConsulta values (1001, 2001, '12345678913', '2021-09-29 15:00:00');
insert into AgendaConsulta values (1002, 2003, '12345678913', '2021-09-29 15:50:00');
select * from AgendaConsulta;
/*
select * from Especialidade;
select * from Clinica;
select * from ClinicaMedico;
*/
/* QUESTÃO 3 - Letra b
 * Exemplos de comandos de inserção, remoção e atualização, a fim de constatar que as restrições de integridade implementadas corretamente.
 *
 */
-- 1. inserções na relação Paciente, a fim de constatar a unicidade do email.
insert into Paciente (CpfPaciente, NomePac, DataNascimento, Genero, Telefone, Email)
values ('12345678321', 'Valdomiro', '1980-01-04', 'M', '88995374321', 'val@gmail.com');

-- 1. inserção na relação Medico, a fim de constatar a unicidade do email.
insert into Medico (CodMed, NomeMed, Genero, Telefone, Email, CodEspec)
values (2004, 'Arquelina', 'F', '81995078342', 'arlindomorais@gmail.com', 0003);

-- 2. inserção na relação Especialidade, a fim de constatar a obrigatoriedade do domínio Descricao.
insert into Especialidade(CodEspec, NomeEspec, Descricao)
values (0004, 'Clínico Geral', null);

-- 3. atualização na relação ClinicaMedico, a fim de constatar a inserção de valor padrão no domínio CargaHorariaSemanal.
update ClinicaMedico
set DataIngresso='2015-10-24'
where CodCli = 1001 and CodMed = 2001;

-- 4. deleção na relação Especialidade, a fim de constatar a deleção em cascata das tuplas de outras relações associadas.
select * from Medico where CodEspec = 0001;
delete from Especialidade where CodEspec = 0001;
select * from Medico where CodEspec = 0001;

-- 4. atualização na relação Especialidade, a fim de constatar a atualização em cascata das tuplas de outras relações associadas
select * from Medico where CodEspec = 0002;
update Especialidade set CodEspec = 1345 where CodEspec = 0002;
select * from Medico;

-- 5. deleção na relação Paciente, a fim de constatar o funcionamento da restrição de relacionamento.
select * from AgendaConsulta;
delete from Paciente where CpfPaciente = '12345678913';


-- select * from Especialidade;
-- drop schema clinica_medica_jsvitor;
