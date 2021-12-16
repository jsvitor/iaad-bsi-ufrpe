# 📑 Introdução ao Armazenamento e Análise de Dados (IAAD)

> ### Sinopse do Conteúdo
> * Sistemas de Gerenciamento de Bancos de Dados (SGBD);
> * Modelo Conceitual;
> * Modelo Relacional;
> * Normalização;
> * Álgebra Relacional;
> * Processamento de transações;
> * Execução e Otimização de Consultas;
> * Dados semiestruturados;
> * Banco de Dados NoSQL;
> * Database as a Service (DaaS).


<details>
	<summary>Ementa</summary>

### OBJETIVOS DA DISCIPLINA

* Proporcionar aos estudantes conhecimentos teóricos e práticos acerca das principais características, arquitetura e necessidades de uso de SGBDs;
* Compreender as especificidades dos BDs relacionais e diferenciá-los de outros modelos de dados;
* Elaborar e executar comandos/consultas em Structured Query Language - SQL;
* Implementar bancos de dados eficientes, utilizando a abordagem relacional (e não-relacional), considerando as restrições de integridade, privacidade e segurança das informações.

### CONTEÚDO PROGRAMÁTICO
1. Armazenamento de dados semiestruturados, Modelo Relacional e Normalização;
2. SGBD: Consultas, Transações, Concorrência, Desempenho, Otimização e Segurança;
3. Formalização: Modelo Conceitual e Álgebra Relacional;
4. Tópicos Avançados: NoSQL, Banco de Dados Distribuídos e Database as a Service (DaaS).	

### BIBLIOGRAFIA
> #### BÁSICA:
>
> 1. ELMASRI, Ramez; NAVATHE, Shamkant B. Sistemas de banco de dados. 7a ed. São Paulo: Pearson, 2018, 1152 p. ISBN 978-8543025001.
> 2. SILBERSCHATZ, Abraham; KORTH, Henry F; SUDARSHAN, S. Sistema de banco de dados. 6a ed. GEN LTC, 2012. 904 p. ISBN 978-8535245356.
> 3. DATE, C. J. Introdução a sistemas de bancos de dados. Rio de Janeiro: Elsevier, 2003. 865 p. ISBN 9788535212730.
>
> #### COMPLEMENTAR:
>
> 1. RAMAKRISHNAN, Raghu; GEHRKE, Johannes. Sistemas de gerenciamento de banco de dados. 3a ed.
São Paulo: McGraw-Hill, 2008. 905 p. ISBN: 9788577260270.
> 2. TEOREY, Toby; LIGHTSTONE, Sam; NADEAU, Tom; JAGADISH, H. V. Projeto e modelagem de
bancos de dados. 5a Ed. Rio de Janeiro: Elsevier, 2014. 328 p. ISBN 9788535264456.
> 3. VAISH, Gaurav. Getting started with NoSQL. Packt Publishing Ltd, 2013.
> 4. LOSHIN, David. Big data analytics: from strategic planning to enterprise integration with tools, techniques, NoSQL, and graph. Elsevier, 2013.
> 5. MACHADO, F. N. R. Banco de dados: projeto e implementação. 4. ed. São Paulo: Érica, 2020. 376 p. ISBN 978-8536532684.


</details>  

## Semana 01 à 02 → Introdução
<details>
  <summary>Curadoria da Profa. Roberta Macêdo 🐱‍🚀</summary>
    
  ### Objetivos das semanas 1 e 2:
  - [x] Compreender os conceitos introdutórios sobre banco de dados e usuários de BD.
  - [x] Entender as vantagens da abordagem baseada em Sistema Gerenciador de Banco de Dados (SGBD).
  - [x] Compreender os conceitos de modelos de dados, esquemas e instâncias.
  - [x] Entender a arquitetura três esquemas (também conhecida como arquitetura ANSI/SPARC) e a importância da independência de dados.
  - [x] Realizar as atividades propostas: avaliação diagnóstica (formulário online)  e lista de exercícios (atividade avaliativa baseada nos capítulos 01 e 02: prazo de 15 dias)

  #### MATERIAIS DIDÁTICOS DE APOIO AOS ESTUDOS:

  Orientações iniciais sobre a disciplina
 * 🎬  https://drive.google.com/file/d/1zH3rYW1y8prU3pZ0NvD423QNG_38E7Tz/view?usp=sharing
 * 🎬 Videoaula da Profa. Sarajane Peres - UNIVESP: https://youtu.be/pmAxIs5U1KI

📖 Leitura dos Capítulos 1 e 2 (páginas 2 a 36) do livro 'Sistemas de Banco de Dados', 6ª Edição, de Ramez Elmasri e Shamkant Navathe.

(Opcional) Para videoaulas mais detalhadas, acesse a playlist "Banco de Dados 2 - Partes 1 a 4" do Prof. Wandré Nunes - UNIFEI:
* 🎬 https://youtu.be/JXvaE24q0dE
* 🎬 https://youtu.be/cpyplRQFjUw
* 🎬 https://youtu.be/062Txe5Wsig
* 🎬 https://youtu.be/9TouzGG4p_Y


Bons estudos!

</details>

## Semana 03 à 04 → Modelo de Banco de Dados Relacional
<details>
  <summary>Curadoria da Profa. Roberta Macêdo 🐱‍🚀</summary>

  ### Objetivos das semanas 2 e 3:
   - [x] Entender os conceitos fundamentais do Modelo de Dados Relacional.
   - [x] Compreender as restrições que podem ser especificadas em um BD relacional.
   - [x] Compreender os principais comandos da DDL e DML.
   - [x] Entender como especificar restrições de integridade e realizar consultas em SQL.
   - [x] Aprender a executar instruções *insert*, *delete* e *update* em SQL.
   - [x] Realizar a atividade avaliativa (prazo de 15 dias).
    
 #### MATERIAIS DIDÁTICOS DE APOIO AOS ESTUDOS:

  **Videoaula de Introdução ao MySQL Workbench e criação do BD Empresa:**
  * 🎬 https://www.loom.com/share/adb7dd4bbfed4762b9f78e8d5b507976
  * 📄 Script SQL do BD Empresa (arquivo anexo).
  * 📄 Esquema relacional do BD Empresa (arquivo anexo).
  
  **Encontro síncrono realizado em 21/09/2021:**
  🎬 https://drive.google.com/file/d/1BcefHTnLgiODbJgFiZh58N6vnS5MMA-n/view?usp=drivesdk
  
  **Videoaulas da Profa. Sarajane Peres - UNIVESP**
  * 🎬 https://youtu.be/yLuJbXcAvoc
  * 🎬 https://youtu.be/-HSyOYvksVw
  * 🎬 https://youtu.be/XnS8XCXPkuk (até 19min15s)
  
  📖 Leitura dos capítulos 3 e 4 (páginas 38 a 73) do livro 'Sistemas de Banco de Dados', 6ª Edição, de Ramez Elmasri e Shamkant Navathe.
  
  (**Opcional**) Para videoaulas mais detalhadas, acesse a *playlist* "Banco de Dados 3 - Partes 1 a 5" do Prof. Wandré Nunes - UNIFEI:
  * 🎬 https://youtu.be/dXCTIz-a4K8
  * 🎬 https://youtu.be/oT3oELAS8-A
  * 🎬 https://youtu.be/3K5FT_zI_fA
  * 🎬 https://youtu.be/OI0BKJNeRFs
  * 🎬 https://youtu.be/DLzbj8FgQ-E

</details>

<details>
  <summary>Configuração do ambiente MySQL em container Docker</summary>
  
  <code>
    $ docker exec -it mysql-local-db mysql -uroot -pQaz123
  </code>

</details>

## Semana 05 à 06 → Structured Query Language - SQL
<details>
  <summary>Curadoria da Profa. Roberta Macêdo 🐱‍🚀</summary>
  
  ### Objetivos das semanas 5 e 6:  
   - [x] Compreender os diferentes tipos de junção: Inner Join, left/right Join, full outer join, cross join etc.
   - [x] Entender como especificar consultas SQL aninhadas.
   - [x] Compreender as principais funções de agregação e agrupamento (Group By e Having).
   - [x] Saber especificar ações como gatilhos (Trigger) e  procedimentos armazenados (Stored Procedures).
   - [x] Compreender o conceito de visões (View) e como elas podem ser implementadas pelo SGBD.
   - [x] Realizar a atividade avaliativa.
  
  #### MATERIAIS DIDÁTICOS DE APOIO AOS ESTUDOS:

  **Videoaula sobre os tipos de junção (reutilizada do período anterior):**
  - [x] 🎬 https://www.loom.com/share/61584a42eee442b598b303120852beca
  * 📄 Script Marcas e Carros (arquivo anexo).
  
  **Videoaulas da Profa. Sarajane Peres - UNIVESP**
  - [x] 🎬 https://youtu.be/XnS8XCXPkuk (A partir de 19min15s)
  - [x] 🎬 https://youtu.be/oFti3s_Lc_oz
  - [x] 🎬 https://youtu.be/qxoBxi7LpXk
    
  📖 Leitura do Capítulo 5 (páginas 76 a 95) do livro 'Sistemas de Banco de Dados', 6ª Edição, de Ramez Elmasri e Shamkant Navathe.

  
  ##### Conteúdo da Atividade Avaliativa:
  * Junções, Consultas Aninhadas, Funções de Agregação, Agrupamento, Triggers, Stored Procedures, Views.

  Bons estudos!
  

</details>


## Semana 07 à 08 → Modelagem de dados, Engenharia Reversa e Álgebra Relacional

<details>

<summary>Curadoria da Profa. Roberta Macêdo 🐱‍🚀</summary>

### Objetivos:

- [x] Obter uma visão geral sobre Modelagem de Dados, usando o modelo Entidade-Relacionamento Estendido (EER), por meio da Engenharia Reversa.

- [x] Aprender a especificar consultas da Álgebra Relacional usando as operações unárias, binárias e com base na teoria dos conjuntos.

- [x] Realizar a atividade avaliativa.

  

#### MATERIAIS DIDÁTICOS DE APOIO AOS ESTUDOS:

  

**Videoaula sobre Engenharia Reversa na prática (Google Meet)**:

- [x] 🎬 http://bit.ly/engenharia_reversa (*reutilizada do período anterior*)

  

**Videoaula sobre Álgebra Relacional e exercícios de fixação (Google Meet)**:

- [x] 🎬 http://bit.ly/algebrarelacional (*reutilizada do período anterior*)

  

**Videoaulas da Profa. Sarajane Peres - UNIVESP**

* 🎬 Parte 1: https://youtu.be/jhD9WYNWorA

* 🎬 Parte 2: https://youtu.be/mjjjwrh6_6Q


- [ ] 📖 Leitura do Capítulo 06 (páginas 96 a 129) do livro 'Sistemas de Banco de Dados', 6ª Edição, de Ramez Elmasri e Shamkant Navathe.

Bons estudos!

-----------------------
	
**Resumo/(Notas do livro) do Conteúdo da Atividade Avaliativa**:
	
## Modelo Relacional	
### Álgebra Relacional e o Cálculo Relacional
> Segundo Elmasri e Navathe:
> São linguagens formais para o modelo relacional, sendo o padrão SQL a linguagem prática.
> Lembre-se:
> "*um modelo de dados* **precisa incluir** um **conjunto de operações para manipular** o banco de dados, **além dos conceitos do 
> modelo de dados** **para definir** a **estrutura e as restrições** do banco de dados. Apresentamos as estruturas 
> e as restrições do modelo relacional formal no Capítulo 3."
> 
> #### Cálculo Relacional de Tupla (variáveis estendem-se por *tuplas*) e Cálculo Relacional de Domínio (variáveis estendem-se por *domínios* (valores) de atributos."
> o cálculo relaciona é fundamentando no ramo da lógica matemática chamado de cálculo de de predicado.
	
|Síbolo| Operação |	Sintaxe	| Tipo
|--|--|--|--|
| **`σ`** | Seleção / restrição | **σ** <sub>condição</sub> ( Relação ) | Primitiva
| **`π`** | Projeção | **π** <sub>expressões</sub> ( Relação ) | Primitiva
| **`⋃`** | União | Relação1 ⋃ Relação2 | Primitiva
| **`⋂`** | Intersecção | Relação1 **⋂** Relação2 | Adicional
| **`–`** | Diferença de conjuntos | Relação1 **–** Relação2 | Primitiva
| **`x`** | Produto cartesiano | Relação1 **x** Relação2 | Primitiva
| **<code>&#124;×&#124;</code>** | Junção | Relação1 **<code>&#124;×&#124;</code>** Relação2 | Adicional
| **`÷`** | Divisão | Relação1 **÷** Relação2 | Adicional
| **`ρ`** | Renomeação | **ρ** nome( Relação ) | Primitiva
| **`←`** | Atribuição | variável **←** Relação | Adicional

> algumas operações/solicitações de banco de dados relacionais que não constavam na álgebra relacional primitiva, tiveram que ser adicionadas.
> estas incluem funções de agregação, que são operações que podem resumir dados das tabelas.
	
#### As operações podem ser divididas em dois grupos
	
#### Operações Unárias
> Um operador unário significa que ele só pode ser aplicado apenas a uma relação.

> ##### Seleção
> A operação de seleção é usada para *selecionar um subconjunto das tuplas*
> de uma relação  que satisfazem uma condição de **seleção**. Ela é um filtro
> que que retem apenas as tuplas que satisfazem à condição de seleção, as
> demais tuplas são descartadas.</br>
> Sendo o **grau** - seu número de atributos - da relação resultante de uma operação de SELEÇÃO *igual ou menor* ao número de tuplas em R.
<code>σ <sub>DNO = 4</sub> ( FUNCIONARIO )</code></br>
<code>**σ** <sub>condição</sub>( R )</code></br>
> onde condição de seleção é uma expressão Booleana especificada sobre atributos da relação R 
> a fração de tuplas selecionadas por uma condição de seleção é conhecidada como **seletividade**.


> ##### Projeção
> Essa operação escolhe algumas colunas da relação e descarta as demais colunas. A PROJEÇÃO cria uma partição vertical da relação contendo apenas os atributos (colunas) especificados fazendo a eleminação de duplicatas.</br>
<code>π <sub>UNOME, PNOME, SALARIO</sub> ( FUNCIONARIO )</code></br>
<code>π <sub>SEXO, SALARIO</sub> ( FUNCIONARIO )</code></br>

> ##### Renome
> Por meio da operação de renome, podemos criar **relações de resultado intermediário.**
> <code>ρ TEMP ( σ<sub>DNO = 5</sub>( FUNCIONARIO ) )</code> </br>
> <code>ρ R ( π<sub>PNOME, UNOME, SALARIO</sub>( TEMP ) )</code> </br>
> <code>ρ ( PRIMEIRONOME, ULTIMONOME, SALARIO ) ( R )</code> </br>

#### Operações da Álgebra Relacional com Base na **Teoria dos Conjuntos**
> ##### União
> retorna a união dos valores de duas relações, eliminando as duplicatas.
> comutativa.
 
> ##### Intersecção
> retorna o que é comum para ambas as relações.
> comutativa.


> ##### Diferença
> retorna tudo que está em aluno, menos as que estão em instrutor.
> não comutativa.

#### Operações Binárias complexas

> Esta também é uma operação de conjunto binária, mas as relações sobre as quais ela é
> aplicada não precisam ser compatíveis na união.
> Operam sobre duas tabelas combinando tuplas relacionadas (registros) baseadas em condições de junção.

> ##### Produto
> Também conhecida como **produto cruzado** ou **junção cruzada**.
> Em sua forma binária, esta operação de conjunto produz um novo elemento combinando cada membro 
> (tupla) de uma relação (conjunto) com cada membro (tupla) da outra relação (conjunto).

> ##### Junção
> Consiste na sequência de um produto cartesiano seguido de uma junção.
> Podendo ser uma:
> Equijunção: quando a condição é uma igualdade.
> Junção natural: quando os valores comparados possuem o mesmo nome de atributo.

> ##### Divisão

- [x] https://spaceprogrammer.com/bd/aprendendo-as-principais-operacoes-da-algebra-relacional/

  

</details>

## Semana 09 à 10 → Seminário sobre NoSQL

<details>
  <summary>Orientações da Profa. Roberta Macêdo 🐱‍🚀</summary>
	
> #### A 2ª VA é composta por duas atividades, ambas em equipe: SEMINÁRIO e IMPLEMENTAÇÃO.
>
> ##### SEMANAS 9 e 10: SEMINÁRIO
> ##### SEMANAS 11 A 13: IMPLEMENTAÇÃO
>
> Leiam atentamente as orientações abaixo sobre o seminário.
> As equipes devem ser formadas por no mínimo 3 e máximo 5 integrantes, considerando as seguintes opções:

* **Situação 1**: equipes formadas por estudantes que estão cursando a disciplina Projeto 3 neste período letivo (ou que já cursaram, com aprovação, em semestres anteriores). 
* **Situação 2**: equipes formadas por estudantes que NÃO estão cursando a disciplina Projeto 3 e não cursaram nos período anteriores.

> Cada equipe deverá produzir um vídeo, apresentando um seminário PRÁTICO sobre um dos temas a seguir (escolha livre):

* **Banco de Dados NoSQL**
	Exemplos de BD NoSQL open source: MongoDB, Redis, Cassandra, Google Cloud Firestore (Firebase), Neo4j, HBase, Couchbase, Apache CouchDB, Riak, ArangoDB, OrientDB, RethinkDB, RavenDB, entre outros.

* **Banco de Dados Geográfico**
	Exemplos de ferramentas open source que lidam com Sistemas de Informações Geográficas (SIG): QGIS, PostGIS, entre outras.

* **DataViz - Visualização e Análise de Dados**
	Exemplos de ferramentas (open source ou versões de teste/trial): Tableau Public, Qlik (Qlik Sense, QlikView), PowerBI, BIRT, Metabase, IBM Watson Analytics, entre outras. 

Observação: não deverá haver conteúdos repetidos nos seminários (exceto as equipes da situação 1), isto é, não podem ter duas ou mais equipes apresentando o mesmo assunto/BD. Por isso, assim que a equipe e tema do seminário forem definidos, incluam as informações no link disponibilizado no final desse guia.

🎦 O tempo estimado para o seminário é 20 minutos. 
Todos os integrantes da equipe devem participar do vídeo. Ao iniciar sua fala no seminário, informar seu nome.
Distribuam adequadamente o tempo de fala de cada integrante da equipe. 

Por ser um seminário PRÁTICO, cada equipe deverá abordar o processo de instalação, configurações iniciais, funcionalidades gerais, e um exemplo prático das operações. Para as equipes que escolherem BD NoSQL ou BD Geográfico, os exemplos devem envolver as operações CRUD (ou seja, exemplificar como são realizadas as operações de armazenamento/carga, leitura, atualização e remoção de dados). 

ATENÇÃO: Se sua equipe faz parte da "Situação 1", os exemplos devem ser baseados no escopo/domínio do projeto 3. 
Se sua equipe faz parte da "Situação 2", os exemplos devem ser baseados nas informações dispostas no esquema Empresa (Funcionário, Departamento, Projeto, Dependentes, Trabalha_Em...).


Recomendação: fiquem atentos à qualidade do vídeo e áudio do seminário, a fim de minimizar ruído. Disponibilizem o vídeo em boa/alta resolução. 
	
	
</details>


## Semana 11 à 13 → Implementação de Sistema

<details>
  <summary>Orientações da Profa. Roberta Macêdo 🐱‍🚀</summary>

A 2ª VA é composta por duas atividades, ambas em equipe (3 a 5 integrantes):
SEMANAS 9 e 10: SEMINÁRIO
SEMANAS 11 A 13: IMPLEMENTAÇÃO

Leiam ATENTAMENTE as orientações abaixo sobre a atividade de implementação.
As equipes devem ser as mesmas formadas na atividade anterior (seminário).

SITUAÇÃO 1: 
Equipes formadas por estudantes que estão cursando a disciplina Projeto 3 neste período letivo (ou que já cursaram, com aprovação, em semestres anteriores). 
➡ Implementar um sistema computacional baseado no escopo/domínio da base de dados utilizada em projeto 3. Deve-se utilizar o BD RELACIONAL MYSQL. 
➡ Estudar o material extra sobre o processo de Normalização, cujos links estão indicados abaixo. Aplicar o processo de Normalização (até a 3ª FN). 

SITUAÇÃO 2: 
Equipes formadas por estudantes que NÃO estão cursando a disciplina Projeto 3 e não cursaram nos período anteriores.
➡ Implementar um sistema computacional baseado no esquema de banco de dados “Clínicas Médicas” OU “Publicações Científicas”, utilizando o BD RELACIONAL MYSQL. Observação: o esquema “Clínicas Médicas” foi utilizado nas atividades 2 e 3, já o esquema “Publicações Científicas” foi utilizado na atividade 4.
➡ Estudar o material extra sobre o processo de Normalização, cujos links estão indicados abaixo. Como os esquemas “Clínicas Médicas” e “Publicações Científicas” já se encontram normalizados, cada equipe deverá explicar no vídeo o porquê do esquema escolhido já está normalizado até a 3ª Forma Normal.

ORIENTAÇÕES PARA TODOS OS GRUPOS:
➡ A escolha da linguagem de programação é livre (python, dart, java, php, javascript, entre outras), mas o BD deve ser o MySQL.
➡ O sistema deve contemplar as quatro operações básicas de CRUD (Create, Read, Update e Delete).
➡ Incluir no sistema pelo menos um trigger e um stored procedure. 
➡ Incluir no sistema no mínimo duas consultas, envolvendo junções, funções de agregação e agrupamentos. 
➡ O banco de dados deve estar populado.
➡ O sistema deve dispor de interface gráfica, seja web, mobile ou desktop.

SOBRE A ENTREGA:
➡ Cada grupo deverá produzir um VÍDEO explicando o processo de desenvolvimento do sistema, bem como o passo a passo com as orientações de configurações do ambiente e execução do programa, incluindo as informações das bibliotecas/pacotes, versões dos programas/ferramentas, APIs, dependências, padrão de projeto (arquitetura), ambiente de desenvolvimento (IDE) e frameworks utilizados no desenvolvimento do sistema. 
➡ Explicar no vídeo os objetivos das duas consultas, do trigger e do stored procedure implementados pela equipe, apresentando exemplos deles sendo ativado/executado. 
➡ Cada grupo deverá disponibilizar o link do Google Drive (ou GitHub) contendo o arquivo compactado (rar, zip, bz2 ou afins) do código fonte do programa, e o script de criação do BD populado (arquivo .sql).
➡ Recomendação: fiquem atentos à qualidade do vídeo e áudio, a fim de minimizarem ruídos. Disponibilizem o vídeo em boa/alta resolução. 

⏰ Prazo para postagem do link do vídeo explicativo e código: 03/12/2021
Inserir link neste documento: https://docs.google.com/document/d/1B7POv_kR3osW3Ory0wpcKoCELfgFg1jIGDy11k8UnSw/edit?usp=sharing

📝 Pontuação da implementação: 10 pontos.

Encontro síncrono realizado em 09/11/2021:
🎬 link em breve...
___________________________________________
MATERIAL EXTRA SOBRE NORMALIZAÇÃO
Objetivos:
- Entender os fundamentos das dependências funcionais.
- Compreender o processo de normalização de bancos de dados relacionais: primeira forma normal - 1ªFN, segunda forma normal - 2ªFN e terceira forma normal - 3ªFN. Observação: existem mais formas normais, contudo, para a disciplina de IAAD é suficiente abordarmos até a 3ª FN.

Videoaula da Profa. Roberta (Revisão e Exercícios de Normalização)
🎬 https://drive.google.com/file/d/18r3Ks1RmWsVAwLiCiGHfvYhW6X0reCsn/view?usp=sharing

Videoaulas da Profa. Sarajane Peres - UNIVESP
🎬 Parte 1: https://youtu.be/1Pcgwf5q9d4
🎬 Parte 2: https://youtu.be/KuakqxxghF8
🎬 Parte 3: https://youtu.be/Bt4UzD6yjF4
🎬 Parte 4: https://youtu.be/pIvuT6YMtDI

📖 Leitura do Capítulo 15 (páginas 337 a 363) do livro 'Sistemas de Banco de Dados', 6ª Edição, de Ramez Elmasri e Shamkant Navathe.

	
	
</details>
