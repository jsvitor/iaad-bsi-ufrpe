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


