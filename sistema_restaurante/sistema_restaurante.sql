-- criando database --
CREATE DATABASE sistema_restaurante;

-- selecionando o banco de dados --
USE sistema_restaurante;

-- criando as tables --

-- table restaurante --
CREATE TABLE restaurante(
	id_restaurante INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	endereco VARCHAR(255) NOT NULL,
	telefone VARCHAR(15) NOT NULL UNIQUE
);

-- table clientes --
CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	telefone VARCHAR(15) NOT NULL
);