/*	QUESTÃO 3 - letra c - Especifique as consultas em SQL indicadas abaixo e apresente as tabelas resultantes:
 *
 */
use clinica_medica_jsvitor;
 -- 1. Listar os nomes de todas as médicas cadastradas no BD (apenas gênero feminino).
select NomeMed from Medico where Genero = 'F';
 
 -- 2. Listar os nomes dos(as) médicos(as) cuja especialidade é Pediatria.
select NomeMed from Medico where CodEspec = (select CodEspec from Especialidade where NomeEspec = 'Pediatria');

 -- 3. Listar os nomes dos(as) médicos(as) dermatologista, cuja carga horária semanal é maior que 20 horas.
select Medico.NomeMed
from Medico join ClinicaMedico on Medico.CodMed = ClinicaMedico.CodMed
where ClinicaMedico.CargaHorariaSemanal > 20 and CodEspec = (select CodEspec from Especialidade where NomeEspec = 'dermatologista');
 
-- 4. Listar os nomes dos(as) pacientes que possuem consultas agendadas entre 30/08/2021 e 13/09/2021.
select P.NomePac
from Paciente as P inner join AgendaConsulta as AC
where P.CpfPaciente = AC.CpfPaciente and AC.DataHora between '30-08-2021 00:00:00' and '13-09-2021 00:00:00';

-- 5. Para cada médico/a que inicia com a letra 'A', listar seu nome completo, sua especialidade e o(s) nome(s) da(s) clínica(s) em que atua(m).
select NomeMed, NomeEspec, NomeCli
from 
	(
		select t2.codMed, t2.NomeMed, t2.NomeEspec, CodCli
		from (select t1.CodMed, NomeMed, NomeEspec
			  from (select *
					from Medico
					where NomeMed like 'A%'
					) as t1 inner join Especialidade on t1.CodEspec = Especialidade.CodEspec
			 ) as t2 inner join ClinicaMedico on ClinicaMedico.CodMed = t2.CodMed
	) as t3 inner join Clinica on Clinica.CodCli = t3.CodCli
;