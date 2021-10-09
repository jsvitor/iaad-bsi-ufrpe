use clinica_medica_jsvitor;

/* 
 * A) Especifique o comando SQL que retorne os nomes dos(as) médicos(as) e os
 * nomes das respectivas especialidades em que eles(as) atuam. Apresentar a 
 * consulta de três formas:
 * (I) junção na cláusula where,
 * (II) conexão interna (inner join),
 * (III) junção natural (natural join). 
 *
 */
-- (I) junção na cláusula where:
select Medico.NomeMed, Especialidade.NomeEspec
from Medico, Especialidade
where Medico.CodEspec = Especialidade.CodEspec;

-- (II) conexão interna (inner join)
select Medico.NomeMed, Especialidade.NomeEspec
from Medico inner join Especialidade on Medico.CodEspec = Especialidade.CodEspec;

-- Quando os atributos comparados possuem o mesmo nome em ambas as tabelas, podemos usar a cláusula "using".
-- Outra observação, quando se trata da junção inner join, a palavra inner é facultativa.
select Medico.NomeMed, Especialidade.NomeEspec
from Medico join Especialidade using(CodEspec);

-- (III) junção natural (natural join)
select Medico.NomeMed, Especialidade.NomeEspec
from Medico natural join Especialidade;

/* 
 * B) Especifique o comando SQL que retorne os nomes de todas as clínicas médicas
 * e os respectivos nomes dos(as) médicos(as) vinculados(as) às clínicas.
 * Considere apenas os(as) médicos cuja data de ingresso seja superior a 2015.
 *
 */
select Medico.NomeMed, Clinica.NomeCli
from ClinicaMedico join Medico using(CodMed) join Clinica using(CodCli)
where ClinicaMedico.DataIngresso >= '2016-01-01';



/* 
 * C) Especifique o comando SQL que retorne os códigos e nomes dos médicos que 
 * não atuam em nenhuma das clínicas cadastradas no banco de dados. Apresentar a
 * consulta de três formas:
 * (I) left join,
 * (II) not in,
 * (III) not exists.
 * 
 * Apresente também a tabela resultante.
 *
 */

 -- (I) left join, pego todos os valores distintos de Medico a partir (from) da junção de medico com ClinicaMedico
 select Medico.CodMed, Medico.NomeMed
 from Medico left outer join ClinicaMedico using(CodMed)
 where ClinicaMedico.CodMed is null;
 
 -- (II) not in,
select distinct Medico.CodMed, Medico.NomeMed
from Medico, ClinicaMedico
where Medico.CodMed not in (select CodMed from ClinicaMedico);

-- (III) not exists
select Medico.CodMed, Medico.NomeMed
from Medico
where not exists (select CodMed from ClinicaMedico where ClinicaMedico.CodMed = Medico.CodMed);


