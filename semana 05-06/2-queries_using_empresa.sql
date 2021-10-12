/* 
 *  QUESTÃO 2 (4,0 PONTOS)
 *  Considere o esquema de banco de dados relacional Empresa, representado na figura 3.6 (página 48) do
 *  livro 'Sistemas de Banco de Dados', 6ª Edição, cujo script SQL para criar e popular o referido BD 
 *  encontra-se disponível nas Semanas 3 e 4 do Classroom. Especifique em SQL os seguintes comandos e
 *  apresente as tabelas resultantes:
 *
 */
 USE empresa_jose_vitor;
/*
 *  A) Usando consulta aninhada, recupere os nomes de todos os funcionários que trabalham no departamento
 *  em que um dos funcionários possui salário de R$ 38.000.
 *
 */
SELECT Pnome, Unome
FROM FUNCIONARIO
WHERE FUNCIONARIO.Dnr IN (
  SELECT Dnr
  FROM FUNCIONARIO
  WHERE Salario = 38000);


/*
 *  B) Usando consulta aninhada, recupere os nomes dos funcionários que ganham 
 *  pelo menos R$ 16.000,00 a menos que o funcionário que recebe mais na empresa.
 *
 */
 SELECT Pnome, Unome
 FROM FUNCIONARIO
 WHERE Salario
 BETWEEN
  (SELECT MAX(Salario)-16000
   FROM FUNCIONARIO)
 AND
  ( SELECT MAX(Salario)
    FROM FUNCIONARIO)-1;


/*
 *  C) Para cada departamento cujo salário médio do funcionário seja maior do que R$ 32.000,00,
 *  retorne o nome do departamento e o número de funcionários que trabalham no departamento.
 * 
 */
SELECT D.Dnome, Count(F.Dnr)
FROM DEPARTAMENTO as D join FUNCIONARIO as F on D.Dnumero = F.Dnr
WHERE (SELECT AVG(Salario) FROM FUNCIONARIO WHERE Dnr = D.Dnumero) > 32000
GROUP BY D.Dnumero;


/*
 *  D) Obter a quantidade de funcionários do sexo feminino, que ganham menos de
 *  R$ 30.000, em cada departamento.
 *
 */
SELECT Dnr, COUNT(Cpf) as 'qnt_de_mulheres'
FROM FUNCIONARIO
WHERE Sexo = 'F' AND Salario < 30000
GROUP BY Dnr;


/*
 *  E) Especifique uma view em SQL que obtenha para cada departamento, o número 
 *  do departamento, nome do departamento, nome do gerente, quantidade de funcionários,
 *  total de salários, menor salário, maior salário e média de salários.
 *
 */
CREATE VIEW V_DF_DEPARTAMENTO AS
  SELECT * FROM
  (
    SELECT 
        D.Dnumero, D.Dnome,
        CONCAT(F.Pnome, ' ', F.Unome) AS 'Nome do Gerente'
    FROM
        DEPARTAMENTO D JOIN FUNCIONARIO F ON D.Dnumero = F.Dnr
    WHERE Cpf_gerente = Cpf
  ) AS R1
  JOIN
  (
    SELECT 
        F.Dnr, COUNT(F.Dnr) AS 'QUANT_FUNCIONARIOS',
        SUM(F.Salario), MIN(F.Salario), MAX(F.Salario), AVG(F.Salario)
    FROM
        FUNCIONARIO F
    GROUP BY Dnr
  ) AS R2
  ON R1.Dnumero = R2.Dnr;
