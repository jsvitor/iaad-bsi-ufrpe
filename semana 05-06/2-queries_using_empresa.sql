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
