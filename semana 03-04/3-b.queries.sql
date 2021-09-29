/* QUESTÃO 3 - Letra b
 * Exemplos de comandos de inserção, remoção e atualização, a fim de constatar que as restrições de integridade implementadas corretamente.
 *
 */

use clinica_medica_jsvitor;

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