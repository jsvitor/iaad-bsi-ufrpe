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
