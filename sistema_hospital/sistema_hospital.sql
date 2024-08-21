-- criando a database
create database if not exists sistema_hospital;

-- selecionando database para adicionar as tables na sequencia
use sistema_hospital;

-- criando a table paciente
create table if not exists paciente(
id_paciente int primary key auto_increment,
nome varchar(100) not null,
cpf varchar(14) not null unique,
data_nascimento date not null,
endereco varchar(255),
telefone varchar(15) not null,
sexo char(1) not null,
email varchar(100) unique
);


