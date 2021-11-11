# Seminário prático sobre MongoDB

## Introdução ao MongoDB;
- o quê é o mongo db?
- para que serve o mongodb?
- Onde é usado o mongodb?
- Por quem é usado?
- Como o mongodb armazena os dados?
- Vantagens e desvantagens
- funcionalidades gerais

## Processo de instalação

> * Docker
> * Executável
> * Usando na núvem
> * Sandbox

### Usando MongoDB no Docker

> acesse o [Play With Docker](https://labs.play-with-docker.com/) e execute os passos abaixo.

Primeiro vamos baixar a imagem oficial do MongoDB por meio do seguinte comando:
```bash
$ docker pull mongo:latest
```

> Para saber se a imagem foi realmente instalada,
> basta executar ```$ docker image ls```, para listar todas as imagens instaladas.

Tendo instalado a imagem do MongoDB, basta instanciar um container MongoDB por meio do comando abaixo:

```bash
$ docker run -d -p 27017:27017 -p 28017:28017 -e MONGODB_PASS="mypass" mongo
$ docker run -d  --name mongo-on-docker  -p 27888:27017 -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=secret mongo
```

Agora, tendo uma instância do MongoDB, basta executar o comando abaixo para rodar o container:

```bash
$ docker exec -it mongo-on-docker mongo
```

Simples assim, com apenas três comandos você já consegue instalar, configurar e executar o MongoDB.

## Configurações Iniciais


## um exemplo prático das operações CRUD envolvendo o empresa

* Empresa (Funcionário, Departamento, Projeto, Dependentes, Trabalha_Em...)

## Referências:

* https://medium.com/dockerbr/mongodb-no-docker-dd3b72c7efb7
* 
