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
    CargaHorariaSemanal float(4, 2),
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
alter table ClinicaMedico add foreign key(CodMed) references Medico(CodMed);
alter table AgendaConsulta add foreign key(CodCli, CodMed) references ClinicaMedico(CodCli, CodMed);
alter table AgendaConsulta add foreign key(CpfPaciente) references Paciente(CpfPaciente) on update cascade on delete restrict;
-- adicionando um valor defalt à carga horária semanal
alter table ClinicaMedico alter CargaHorariaSemanal set default 20.0; 

/*
-- trigger 
delimiter$
create Excluir_especialidade
after delete
on Especialidade for each row
begin 
	delete from Medico where CodMed = old.CodMed
end$
delimiter ;
*/


-- populando o banco de dados
-- inserções na relação Especialidades
insert into Especialidade(CodEspec, NomeEspec, Descricao) values (0001, 'Clínico Geral', 'Consultas, exames, prescricoes.');
insert into Especialidade(CodEspec, NomeEspec, Descricao) values (0002, 'Pediatria', 'Assistência à criança e ao adolescente.');
insert into Especialidade values (0003, 'Odontologista', 'Cuidados bucais');
-- select * from Especialidade;

-- inserções na relação Clínica
insert into Clinica(CodCli, NomeCli, Endereco, Telefone, Email) 
values (1001, 'Renascer', 'Rua Exp. Guilherme Salvador, 57 - Recife', '81995374533', 'oi@renascer.com');
insert into Clinica values (1002, 'Sim!', 'Av. Vieira Aguiar, 3234 - Olinda', '81995374537', 'contato@sim.com.br');
insert into Clinica values (1003, 'Hapvida', 'Rod BR 101, km 30 - Recife', '81995373544', 'hapvida@sac.com.br');
-- select * from Clinica;

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

-- inserções na relação ClinicaMedico
insert into ClinicaMedico () values ();