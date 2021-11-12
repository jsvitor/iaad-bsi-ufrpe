# 💚 Seminário prático sobre MongoDB

![mongodb logo](https://webimages.mongodb.com/_com_assets/cms/kuyjf3vea2hg34taa-horizontal_default_slate_blue.svg?auto=format%252Ccompress)

## Introdução ao MongoDB
- O que é o mongo db?
É o banco de dados orientado a objetos mais popular, estando em 5º lugar dos bancos mais usados no mundo e em primeiro como banco de dados NoSQL.
Ele armazena os dados num formado semelhante ao JSON e é de esquema livre.

- Para que serve o mongodb?
Ele foi criado em 2007, por componentes da Double Click, uma empresa que veículava cerca de 400.000 anúncios por segundo, mas muitas vezes sofria com escalabilidade e agilidade.

- Onde é usado o mongodb?
Em cenários de Big Data.

- Como o mongodb armazena os dados?
![How-mongodb-works](https://miro.medium.com/max/1400/1*fQbtENxfv757UXuzGQQ3gQ.png)

- Vantagens e desvantagens

![aplicações](https://blog.couchbase.com/wp-content/uploads/2017/04/nosql-vs-sql-overview-1.png)

- Funcionalidades gerais
* Escalabilidade horizontal (sharding)
* Suporte de múltiplos engines de armazenamento
* Alta performance

## Processo de instalação

Há diversas formas de usar o MongoDB, entre elas destaco:

> * Em um container Docker
> * Executável
> * Usando na núvem
> * Sandbox

Para este seminário, optei por mostrar a configuração do ambiente usando o Docker.

### Usando MongoDB no Docker

O Docker é uma ferramenta para criar, implantar e rodar aplicações usando facilmente containers.
Um contêiner é uma unidade padrão de software que pode ser usada para
empacotar aplicativos e todas as dependências em um único pacote.
Esses contêineres podem ser executados em qualquer plataforma de servidor,
independentemente da configuração subjacente ou da estrutura de hardware.


> acesse o [Play With Docker](https://labs.play-with-docker.com/) e execute os passos abaixo.

Primeiro vamos baixar a imagem oficial do MongoDB por meio do seguinte comando:
```bash
$ docker pull mongo:latest
```

> Para saber se a imagem foi realmente instalada,
> basta executar ```$ docker image ls```, para listar todas as imagens instaladas.

Tendo instalado a imagem do MongoDB, basta instanciar um container MongoDB por meio do comando abaixo:

```bash
$ docker run -d  --name mongo-on-docker -p 27888:27017 -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=secret mongo
```

![docker-ports](https://www.code4it.dev/static/7e983e27425fb44d41cf3189d3835b92/84f4d/Docker-ports.png)


Agora, tendo uma instância do MongoDB, basta executar o comando abaixo para rodar o container:

```sh
docker exec -it mongo-on-docker mongosh --port 27017  --authenticationDatabase "admin" -u "mongoadmin" -p
```

Simples assim, com apenas três comandos você já consegue instalar, configurar e executar o MongoDB.

[Mongo Official Image | Docker Hub](https://hub.docker.com/_/mongo)

## Configurações Iniciais


### Exemplo prático das operações CRUD envolvendo o esquema empresa:


![Esquema empresa](https://raw.githubusercontent.com/jsvitor/iaad-bsi-ufrpe/main/semana%2003-04/empresa_diagram.png)

<details>
  <summary>alguns comandos</summary>
  
#### Para exibir os bancos de dados existentes:

```sh
show dbs;
```

#### Para alterar o database:

```sh
use nome-do-database-desejado
```

### Para criar uma Collection

```sh
db.createCollection('nome-da-collection')
```

### Para listar os bancos de dados:

```sh
show dbs;
```


</details>

<details>
  <summary>COLLECTIONS</summary>
	
### Criar a collection de Funcionário

```sh
db.createCollection("FUNCIONARIO")
```

### Criar a collection de Departamento

```sh
db.createCollection("DEPARTAMENTO")
```

### Criar a collection de localização do departamento

```sh
db.createCollection("LOCALIZACAO_DEP")
```  

### Criar a collection de departamento

```sh
db.createCollection("DEPENDENTE")
```

### Criar a collection de projeto

```sh
db.createCollection("PROJETO")
```

### Criar a collection de trabalha_em

```sh
db.createCollection("TRABALHA_EM")
```

</details>


<details>
   <summary>INSERT</summary>
  

### Insere registros de funcionário
 
````
db.FUNCIONARIO.insertMany([
  {
    "Pnome": "João", 
    "Minicial": "B",
	"Unome": "Silva" ,
"Cpf": "12345678966" ,
"Datanasc": "1965-01-09" ,
"Endereco": "Rua das flores, 751, São Paulo, SP" ,
"Sexo": "M",
"Salario": 30000,
"Cpf_supervisor": "33344555587",
"Dnr": 5    
  },
  {
    "Pnome": "Fernando", 
    "Minicial": "T",
	"Unome": "Wong",
"Cpf": "33344555587",
"Datanasc": "1955-12-08",
"Endereco": "Rua da lapa, 34, Sao Paulo, SP",
"Sexo": "M",
"Salario": 40000,
"Cpf_supervisor": "88866555576",
"Dnr": 5   
  }, {
    "Pnome": "Alice", 
    "Minicial": "J",
	"Unome": "Zelaya",
"Cpf": "99988777767",
"Datanasc": "1968-01-19",
"Endereco": "Rua Souza Lima, 35, Curitiba, PR",
"Sexo": "F",
"Salario": 25000,
"Cpf_supervisor": "98765432168",
"Dnr": 4   
  }, {
    "Pnome": "Jennifer", 
    "Minicial": "S",
	"Unome": "Souza",
"Cpf": "98765432168",
"Datanasc": "1941-06-20",
"Endereco": "Av. Arthur de Lima, 54, Santo Andre, SP",
"Sexo": "F",
"Salario": 43000,
"Cpf_supervisor": "88866555576",
"Dnr": 4   
  }, {
    "Pnome": "Ronaldo", 
    "Minicial": "K",
	"Unome": "Lima",
"Cpf": "66688444476",
"Datanasc": "1962-09-15",
"Endereco": "Rua Rebouças,65, Piracicaba, SP",
"Sexo": "M",
"Salario": 38000,
"Cpf_supervisor": "33344555587",
"Dnr": 1   
  }
])

````
  
### Insere documentos em Departamento
  
````
db.DEPARTAMENTO.insertMany([
{ 
 “dnome”: “Pesquisa”,
“Dnumero”: “5”,
“Cpf_gerente”: “33344555587”,
“Data_inicio_gerente”: “22-05-1988”,
},
{
“Dnome”: “Administração”,
“Dnumero”: “4”,
“Cpf_Gerente”: “98765432168”,
“Data_Inicio_Gerente”: “01-01-1995”,
},
{
 “dnome”: “Matriz”,
“Dnumero”: “1”,
“Cpf_gerente”: “88866555576”,
“Data_inicio_gerente”: “19-06-1981”,
},
)
```` 
 
### Insere documentos em Projeto

````
db.PROJETO.insertMany(
	
[
{“projnome”: “ProdutoX”,
 “projnumero”: 1,
 “projlocal”: “Santo André”,
 “dnum”: 5,	},
 
{“projnome”: “Produto Y”,
 “projnumero”: 2,
 “projlocal”: “Itu”,
 “dnum”: 5,	},
 
{“projnome”: “Produto Z”,
 “projnumero”: 3,
 “projlocal”: “São Paulo”,
 “dnum”: 5,	},
 
{“projnome”: “Informatização”,
 “projnumero”: 10,
 “projlocal”: “Mauá”,
 “dnum”:4 ,	},
 
{“projnome”: “Reorganização”,
 “projnumero”: 20 ,
 “projlocal”: “São Paulo”,
 “dnum”: “1” ,	},
 
{“projnome”: “Novosbeneficios”,
 “projnumero”: 30 ,
 “projlocal”: “Mauá”,
 “dnum”: 4,	}
]
)
````
 
### Inserções de local
 
```` 
db.LOCALIZACAO.DEP.insertMany(
	
[
{“dnumero”: 1,
 “dlocal”: “São Paulo”},
 
{“dnumero”: 4,
 “dlocal”: “Mauá”},
 
{“dnumero”: 5,
 “dlocal”: “Santo André”},
 
{“dnumero”: 5,
 “dlocal”: “Itu”},
]
)
````

</details>

<details>
  <summary>READ</summary>

  
### Ler todos os documentos da collection:
 
````mongosh
db.FUNCIONARIO.find().pretty()
````
 
### Ler um documento com um atributo com valor específico:
 
````mongosh
db.FUNCIONARIO.find({pnome: "João"})
````
### Listar funcionários com sexo femino
 
````mongosh
db.FUNCIONARIO.find({Sexo: "F"}).pretty()
````
 
### Find com o operador $and: 
 
````mongosh
db.FUNCIONARIO.find({ $and: [{Sexo: "F"}, {Unome: "Zelaya"}]}).pretty()

  
</details>
  
<details>
  <summary>UPDATE</summary>
  	
 
### Atualização de funcionário:
 
````mongosh
db.FUNCIONARIO.updateOne({Cpf: "12345678966"}, {$set: {salario: 40000 }});
````

````
db. FUNCIONARIO.updateMany({Salario:{$lt 25000} }, {$set: {Salario: 30000}}
````
	
````
db.FUNCIONARIO.replaceOne({Salario:{$gt 40000}}, {$set: {Salario_Surpervisor:40000}}
````

	
</details>
  

<details>
  <summary>DELETE</summary>

### remover/deletar documento
 
````
db.FUNCIONARIO.remove({“Cpf”: “99988777767”})
````
 
### remover/deletar uma collection:
 
````
db.FUNCIONARIO.remove({}); 
````
	
</details>
  

#### [Operações CRUD](https://docs.mongodb.com/manual/crud/)


## Referências:

* https://medium.com/dockerbr/mongodb-no-docker-dd3b72c7efb7
* https://www.code4it.dev/blog/run-mongodb-on-docker
* https://www.youtube.com/watch?v=DbKPeaVHwdE
* https://hub.docker.com/_/mongo
* https://docs.mongodb.com/manual/crud/
