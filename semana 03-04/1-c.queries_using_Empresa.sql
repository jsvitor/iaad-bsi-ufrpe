use empresa_jose_vitor;
-- 1. Retornar os nomes dos funcionários do departamento 4 que trabalham mais de 9 horas por semana no projeto Informatização.
select FUNCIONARIO.Pnome, FUNCIONARIO.Unome
from 
	FUNCIONARIO join TRABALHA_EM on FUNCIONARIO.Cpf = TRABALHA_EM.Fcpf
    join PROJETO on TRABALHA_EM.Pnr = PROJETO.Projnumero
where FUNCIONARIO.Dnr = 4 and TRABALHA_EM.Horas > 9 and PROJETO.Projnome = 'Informatização';

-- 2. Retornar os nomes de todos os funcionários que possuem pelo menos um dependente com o mesmo sexo do funcionário.
select FUNCIONARIO.Pnome as 'primeiro nome', FUNCIONARIO.Unome
from FUNCIONARIO join DEPENDENTE on FUNCIONARIO.Cpf = DEPENDENTE.Fcpf
where FUNCIONARIO.Sexo = DEPENDENTE.Sexo;

-- 3. Retornar os nomes de todos os funcionários que são supervisionados diretamente por 'Jennifer Souza'.
select FUNCIONARIO.Pnome, FUNCIONARIO.Unome
from FUNCIONARIO
where FUNCIONARIO.Cpf_supervisor = (
	select FUNC.Cpf
	from FUNCIONARIO as FUNC
	where FUNC.Pnome = 'Jennifer' and FUNC.Unome = 'Souza');
-- 4. Inserir <'45345345376', 'João', 'M', '1990-12-12', 'marido'> em DEPENDENTE.
insert into DEPENDENTE values ('45345345376', 'João', 'M', '1990-12-12', ucase('marido'));
-- delete from DEPENDENTE where Fcpf = '45345345376';
-- select * from DEPENDENTE;

-- 5. Modificar Cpf_gerente e Data_inicio_gerente da tupla DEPARTAMENTO com Dnumero = 5 para '12345678966' e '2020-09-07', respectivamente.
update DEPARTAMENTO
set Cpf_gerente = '12345678966', Data_inicio_gerente = '2020-09-07'
where Dnumero = 5;

-- 6. Modificar o atributo Horas para 5.0 da tupla TRABALHA_EM com Fcpf = '99988777767' e Pnr = 10.
update TRABALHA_EM
set Horas = 5.0
where Fcpf = '99988777767' and Pnr = 10;
select * from TRABALHA_EM;

-- 7. Modificar os salários de todos os funcionários do departamento 'Administração', acrescentando 10 por cento em cada salário.
update FUNCIONARIO
set Salario = Salario*1.10
where Dnr = (select Dnumero from DEPARTAMENTO where Dnome = 'Administração');
select * from FUNCIONARIO where Dnr=4;