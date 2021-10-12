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



/*
 * D) Especifique o comando SQL que retorne os nomes de todas as clínicas médicas
 * e a quantidade de médicos(as) de cada clínica.
 *
 */
select ClinicaMedico.CodCli, count(ClinicaMedico.CodMed)
from Medico right join ClinicaMedico using(CodMed)
group by ClinicaMedico;



/*
 * E) Especifique o comando SQL que retorne para cada especialidade, o código e 
 * o nome da especialidade, seguido do número de médicos (quantidade total) que 
 * atuam na especialidade. Considere que apenas as especialidades com mais de 10
 * médicos devem aparecer no resultado da consulta.
 *
 */
select Especialidade.CodEspec, Especialidade.NomeEspec, count(Medico.CodMed) as "Nº de medicos"
from Especialidade left join Medico using(CodEspec)
group by Especialidade.CodEspec
having count(Medico.CodMed) > 10;



/*
 *  F) Especifique o comando SQL que retorne os nomes das clínicas médicas que 
 *  estão sem médicos cadastrados.
 *
 */
select Clinica.NomeCli as "Clinica Sem Médico"
from Clinica left join ClinicaMedico using(CodCli)
where ClinicaMedico.CodMed is null;



/* 
 *  G) Especifique o comando SQL que retorne:
 *  (I) Código e nome de cada especialidade;
 *  (II) Código e nome de cada médico que atua nesta especialidade 
 *       (Atenção: se a especialidade não tiver médicos, deve-se aparecer null);
 *  (III) Código e nome de cada clínica em que atua o médico
 *       (Atenção: se o médico não atua em nenhuma clínica, deve-se aparecer null).
 *
 */
select Especialidade.CodEspec, Especialidade.NomeEspec, Medico.CodMed, Medico.NomeMed, ClinicaMedico.CodCli, Clinica.NomeCli
from Especialidade left join Medico using(CodEspec)
left join ClinicaMedico using(CodMed) left join Clinica using (CodCli);



/*
 * H) Explique o retorno da consulta SQL abaixo:
 */
/*  
SELECT Medico.CodMed,
FROM Medico
WHERE
  NOT EXISTS (
    SELECT * FROM Clinica
    WHERE NOT EXISTS (
       SELECT * FROM ClinicaMedico
       WHERE Clinica.CodCli = ClinicaMedico.CodCli AND
                    Medico.CodMed = ClinicaMedico.CodMed
                     )
              )
*/
-- deveria retornar CodMed para os quais não existe Clinica associado.
SELECT Medico.CodMed -- retorna vazio, pois o not exists é falso. Mas poderia retornar o CodMed de todos os médicos caso fosse verdadeira.
FROM Medico
WHERE
  NOT EXISTS ( -- é verdadeiro quando a subconsulta retorna nenhum valor, nesse caso ela retorna a clinica Clean
    SELECT * FROM Clinica -- seleciona apenas as tuplas de Clinica que não estão na subconsulta, ou seja, Clinica que não está em ClinicaMedico
    WHERE NOT EXISTS (  -- 2207 não existe nessa seleção e Clinica Clean tbm não existe
       SELECT * FROM ClinicaMedico -- retorna todas as tuplas de ClinicaMedico que possue Clinica e Medico.
       WHERE Clinica.CodCli = ClinicaMedico.CodCli AND
                    Medico.CodMed = ClinicaMedico.CodMed -- não exista clinica associada ao médico e medico associado a clinica
                     )
              );

/*  RESPOSTA:
 *  Caso ela fosse executada, haveria um erro de sintaxe, pois na primeira linha há 
 *  uma vírgula após a especificação do atributo Medico.CodMed.
 *  Também há um erro de sintaxe no último select aninhado:
 *  a relação Clinica não foi definida após a cláusula FROM, mas é chamada na condição do WHERE.
 *  Contudo, a consulta não será executada, pois não foi colocado o ponto e vírgula no final.
 *
 */



/*
 *  I) Elabore uma consulta (escolha livre) que represente a operação “Full Outer Join”
 *  (Lembrando que o MySQL não implementa diretamente esta operação, sendo necessário
 *  usar a operação de união). Explique o significado da consulta.
 * Seleciona nome do médico e da clinica, tendo como objetivo saber quais médicos estão Clinica
 * e quais não estão. Assim como, saber quais clinicas não possuem médicos.
 */

select Medico.NomeMed as NomeMed, RCN.NomeCli
from Medico left join (select * from ClinicaMedico left join Clinica using(CodCli)) as RCN  using(CodMed)
union all
select Medico.NomeMed, RCNX.NomeCli
from Medico right join (select * from ClinicaMedico right join Clinica using(CodCli)) as RCNX using(CodMed)
where Medico.CodMed is null;

/*
 *  J) Especifique um gatilho (Trigger) em SQL para o BD Clínicas Médicas (escolha livre).
 *  Explique o objetivo de seu gatilho e apresente um exemplo do gatilho sendo ativado/executado pelo SGBD.
 * 
 *  OBJETIVO DO GATILHO:
 *  Toda vez que uma atualização na relação ClinicaMedico for feita e o valor de CargaHorariaSemanal não for informado,
 *  o valor será inserido como 22;
 */
delimiter // -- por padrão o MySQL delimita instruções por meio do ponto e vírgula(;), mas dentro da definição do gatilho
-- iremos delimitar com barras duplas (//). Sendo que ao final, devemos retornar ao valor padrão (delimiter ;)

create trigger update_ClinicaMedico before update
on ClinicaMedico
for each row -- para cada linha que for alterada, execute essas instruções:
  begin
    -- se durante um update não for fornecido uma carga horária, será adicionado o valor 20 horas
    if (NEW.CargaHorariaSemanal = OLD.CargaHorariaSemanal) then
      set NEW.CargaHorariaSemanal = 22;
    end if;

  end //

delimiter ;


/*
 *  K) Especifique um procedimento armazenado (Stored Procedure) em SQL para o BD Clínicas Médicas (escolha livre).
 *  Explique o objetivo de seu procedimento armazenado e apresente um exemplo dele sendo ativado/executado pelo SGBD.
 *  
 *  RESPOSTA:
 *  Tem como objetivo contar a quantidade de médicos que não estão associados a ClinicaMedico;
 */
DELIMITER $$
CREATE PROCEDURE Quant_de_Medicos_Nao_Associados_a_Clinica (out total int)
BEGIN
  /*CORPO DO PROCEDIMENTO*/
  select count(CodMed) into total from Medico left join ClinicaMedico using(CodMed) where CodCli is null;
END $$
DELIMITER ;

call Quant_de_Medicos_Nao_Associados_a_Clinica(@quant);
select @quant;