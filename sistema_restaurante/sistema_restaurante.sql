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

-- table cliente_has_restaurantes --
CREATE TABLE cliente_has_restaurante(
	id_cliente INT NOT NULL,
	id_restaurante INT NOT NULL,
	CONSTRAINT fk_cliente
		FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
	CONSTRAINT fk_restaurante
		FOREIGN KEY(id_restaurante) REFERENCES restaurante(id_restaurante)
);

-- table mesa --
CREATE TABLE mesa(
	id_mesa INT PRIMARY KEY AUTO_INCREMENT,
	capacidade INT NOT NULL DEFAULT 0,
	id_restaurante INT NOT NULL,
	CONSTRAINT fk_restaurante_mesa
		FOREIGN KEY(id_restaurante) REFERENCES restaurante(id_restaurante)
);

-- table reserva --
CREATE TABLE reserva(
	id_reserva INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT NOT NULL,
	id_mesa INT NOT NULL,
	data DATETIME NOT NULL,
	status VARCHAR(32) NOT NULL,
	numero_pessoas INT NOT NULL DEFAULT 0,
	CONSTRAINT fk_reserva_cliente
		FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
	CONSTRAINT 	fk_reserva_mesa
		FOREIGN KEY(id_mesa) REFERENCES mesa(id_mesa)
	);

	-- table cardapio --
	CREATE TABLE cardapio(
	id_cardapio INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	origem VARCHAR(32) NOT NULL,
	id_restaurante INT NOT NULL,
	CONSTRAINT fk_cardapio_restaurante
		FOREIGN KEY(id_restaurante) REFERENCES restaurante(id_restaurante)
);

-- table prato --
CREATE TABLE prato(
	id_prato INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(32) NOT NULL,
	tipo VARCHAR(32),
	preco DECIMAL(5,2) NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	id_cardapio INT,
	CONSTRAINT fk_prato_cardapio
		FOREIGN KEY(id_cardapio) REFERENCES cadapio(id_cardapio)
);

-- table pedido --
CREATE TABLE pedido(
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
	total DECIMAL(6,2) NOT NULL,
	id_mesa INT NOT NULL,
	id_cliente INT NOT NULL,
    data DATETIME NOT NULL,
	CONSTRAINT fk_pedido_cliente
		FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
	CONSTRAINT fk_pedido_mesa
		FOREIGN KEY(id_mesa) REFERENCES mesa(id_mesa)
);

-- table pedido_prato --
CREATE TABLE pedido_has_prato(
	id_pedido INT NOT NULL,
	id_prato INT NOT NULL,
	CONSTRAINT fk_pedido_has_prato_1
		FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido),
	CONSTRAINT fk_pedido_has_prato_2
		FOREIGN KEY(id_prato) REFERENCES prato(id_prato)
);