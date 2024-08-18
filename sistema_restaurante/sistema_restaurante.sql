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

-- populando as tables da database sistema_restaurante --

INSERT INTO restaurante (nome, endereco, telefone) VALUES
    ('Restaurante 1', 'Endereço 1', '111111111'),
    ('Restaurante 2', 'Endereço 2', '222222222'),
    ('Restaurante 3', 'Endereço 3', '333333333'),
    ('Restaurante 4', 'Endereço 4', '444444444'),
    ('Restaurante 5', 'Endereço 5', '555555555');
    
INSERT INTO cliente (nome, email, telefone) VALUES
    ('Cliente 1', 'cliente1@example.com', '111111111'),
    ('Cliente 2', 'cliente2@example.com', '222222222'),
    ('Cliente 3', 'cliente3@example.com', '333333333'),
    ('Cliente 4', 'cliente4@example.com', '444444444'),
    ('Cliente 5', 'cliente5@example.com', '555555555'),
    ('Cliente 6', 'cliente6@example.com', '666666666'),
    ('Cliente 7', 'cliente7@example.com', '777777777'),
    ('Cliente 8', 'cliente8@example.com', '888888888'),
    ('Cliente 9', 'cliente9@example.com', '999999999'),
    ('Cliente 10', 'cliente10@example.com', '101010101'),
    ('Cliente 11', 'cliente11@example.com', '111111112'),
    ('Cliente 12', 'cliente12@example.com', '121212121'),
    ('Cliente 13', 'cliente13@example.com', '131313131'),
    ('Cliente 14', 'cliente14@example.com', '141414141'),
    ('Cliente 15', 'cliente15@example.com', '151515151'),
    ('Cliente 16', 'cliente16@example.com', '161616161'),
    ('Cliente 17', 'cliente17@example.com', '171717171'),
    ('Cliente 18', 'cliente18@example.com', '181818181'),
    ('Cliente 19', 'cliente19@example.com', '191919191'),
    ('Cliente 20', 'cliente20@example.com', '202020202'),
    ('Cliente 21', 'cliente21@example.com', '212121212'),
    ('Cliente 22', 'cliente22@example.com', '222222222'),
    ('Cliente 23', 'cliente23@example.com', '232323232'),
    ('Cliente 24', 'cliente24@example.com', '242424242'),
    ('Cliente 25', 'cliente25@example.com', '252525252'),
    ('Cliente 26', 'cliente26@example.com', '262626262'),
    ('Cliente 27', 'cliente27@example.com', '272727272'),
    ('Cliente 28', 'cliente28@example.com', '282828282'),
    ('Cliente 29', 'cliente29@example.com', '292929292'),
    ('Cliente 30', 'cliente30@example.com', '303030303');
    
INSERT INTO cliente_has_restaurante (id_cliente, id_restaurante) VALUES
    (1, 1), (1, 3),
    (2, 1), (2, 4),
    (3, 1), (3, 5),
    (4, 1), (4, 2),
    (5, 1), (5, 3),
    (6, 2), (6, 4),
    (7, 2), (7, 5),
    (8, 2), (8, 1),
    (9, 2), (9, 3),
    (10, 2), (10, 4),
    (11, 3), (11, 5),
    (12, 3), (12, 1),
    (13, 3), (13, 2),
    (14, 3), (14, 4),
    (15, 3), (15, 5),
    (16, 4), (16, 1),
    (17, 4), (17, 2),
    (18, 4), (18, 3),
    (19, 4), (19, 5),
    (20, 4), (20, 1),
    (21, 5), (21, 2),
    (22, 5), (22, 3),
    (23, 5), (23, 4),
    (24, 5), (24, 1),
    (25, 5), (25, 2),
    (26, 1), (26, 3),
    (27, 2), (27, 4),
    (28, 3), (28, 5),
    (29, 4), (29, 1),
    (30, 5), (30, 2);
    

INSERT INTO mesa (id_restaurante, capacidade) VALUES
    (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4),
    (2, 4), (2, 4), (2, 4), (2, 4), (2, 4), (2, 4), (2, 4), (2, 4), (2, 4), (2, 4), (2, 4), (2, 4), (2, 4), (2, 4), (2, 4),
    (3, 2), (3, 2), (3, 4), (3, 4), (3, 4),
    (4, 2), (4, 4), (4, 6), (4, 6), (4, 4),(4, 2), (4, 4), (4, 6), (4, 6), (4, 4),(4, 2), (4, 4), (4, 6), (4, 6), (4, 4),
    (5, 2), (5, 4), (5, 6), (5, 6), (5, 4);
    
INSERT INTO reserva (id_cliente, id_mesa, data, status, numero_pessoas) VALUES
    (1, 1, '2024-08-01 12:00:00', 'Confirmada', 4),
    (2, 2, '2024-08-01 13:00:00', 'Confirmada', 2),
    (3, 3, '2024-08-01 14:00:00', 'Confirmada', 6),
    (4, 4, '2024-08-02 12:00:00', 'Confirmada', 3),
    (5, 5, '2024-08-02 13:00:00', 'Confirmada', 5);
    
INSERT INTO cardapio (nome, origem, id_restaurante) VALUES
    ('Cardápio 1', 'Italiano', 1),
    ('Cardápio 2', 'Japonês', 2),
    ('Cardápio 3', 'Brasileiro', 3),
    ('Cardápio 4', 'Mexicano', 4),
    ('Cardápio 5', 'Frances', 5);
    
INSERT INTO prato (nome, tipo, preco, descricao, id_cardapio) VALUES
    ('Prato 1', 'Entrada', 25.00, 'Descrição do Prato 1', 1),
    ('Prato 2', 'Principal', 50.00, 'Descrição do Prato 2', 1),
    ('Prato 3', 'Entrada', 30.00, 'Descrição do Prato 3', 2),
    ('Prato 4', 'Principal', 60.00, 'Descrição do Prato 4', 2),
    ('Prato 5', 'Sobremesa', 20.00, 'Descrição do Prato 5', 3),
    ('Prato 6', 'Entrada', 28.00, 'Descrição do Prato 6', 3),
    ('Prato 7', 'Principal', 55.00, 'Descrição do Prato 7', 4),
    ('Prato 8', 'Sobremesa', 22.00, 'Descrição do Prato 8', 4),
    ('Prato 9', 'Entrada', 24.00, 'Descrição do Prato 9', 5),
    ('Prato 10', 'Principal', 52.00, 'Descrição do Prato 10', 5),
    ('Prato 11', 'Entrada', 26.00, 'Descrição do Prato 11', 1),
    ('Prato 12', 'Principal', 54.00, 'Descrição do Prato 12', 1),
    ('Prato 13', 'Entrada', 29.00, 'Descrição do Prato 13', 2),
    ('Prato 14', 'Principal', 59.00, 'Descrição do Prato 14', 2),
    ('Prato 15', 'Sobremesa', 21.00, 'Descrição do Prato 15', 3),
    ('Prato 16', 'Entrada', 27.00, 'Descrição do Prato 16', 3),
    ('Prato 17', 'Principal', 56.00, 'Descrição do Prato 17', 4),
    ('Prato 18', 'Sobremesa', 23.00, 'Descrição do Prato 18', 4),
    ('Prato 19', 'Entrada', 25.00, 'Descrição do Prato 19', 5),
    ('Prato 20', 'Principal', 53.00, 'Descrição do Prato 20', 5),
    ('Prato 21', 'Entrada', 26.00, 'Descrição do Prato 21', 1),
    ('Prato 22', 'Principal', 55.00, 'Descrição do Prato 22', 1),
    ('Prato 23', 'Entrada', 30.00, 'Descrição do Prato 23', 2),
    ('Prato 24', 'Principal', 60.00, 'Descrição do Prato 24', 2),
    ('Prato 25', 'Sobremesa', 22.00, 'Descrição do Prato 25', 3),
    ('Prato 26', 'Entrada', 28.00, 'Descrição do Prato 26', 3),
    ('Prato 27', 'Principal', 57.00, 'Descrição do Prato 27', 4),
    ('Prato 28', 'Sobremesa', 24.00, 'Descrição do Prato 28', 4),
    ('Prato 29', 'Entrada', 23.00, 'Descrição do Prato 29', 5),
    ('Prato 30', 'Principal', 51.00, 'Descrição do Prato 30', 5),
    ('Prato 31', 'Entrada', 25.00, 'Descrição do Prato 31', 1),
    ('Prato 32', 'Principal', 50.00, 'Descrição do Prato 32', 1),
    ('Prato 33', 'Entrada', 30.00, 'Descrição do Prato 33', 2),
    ('Prato 34', 'Principal', 60.00, 'Descrição do Prato 34', 2),
    ('Prato 35', 'Sobremesa', 20.00, 'Descrição do Prato 35', 3),
    ('Prato 36', 'Entrada', 28.00, 'Descrição do Prato 36', 3),
    ('Prato 37', 'Principal', 55.00, 'Descrição do Prato 37', 4),
    ('Prato 38', 'Sobremesa', 22.00, 'Descrição do Prato 38', 4),
    ('Prato 39', 'Entrada', 24.00, 'Descrição do Prato 39', 5),
    ('Prato 40', 'Principal', 52.00, 'Descrição do Prato 40', 5),
    ('Prato 41', 'Entrada', 26.00, 'Descrição do Prato 41', 1),
    ('Prato 42', 'Principal', 54.00, 'Descrição do Prato 42', 1),
    ('Prato 43', 'Entrada', 29.00, 'Descrição do Prato 43', 2),
    ('Prato 44', 'Principal', 59.00, 'Descrição do Prato 44', 2),
    ('Prato 45', 'Sobremesa', 21.00, 'Descrição do Prato 45', 3),
    ('Prato 46', 'Entrada', 27.00, 'Descrição do Prato 46', 3),
    ('Prato 47', 'Principal', 56.00, 'Descrição do Prato 47', 4),
    ('Prato 48', 'Sobremesa', 23.00, 'Descrição do Prato 48', 4),
    ('Prato 49', 'Entrada', 25.00, 'Descrição do Prato 49', 5),
    ('Prato 50', 'Principal', 53.00, 'Descrição do Prato 50', 5),
    ('Prato 51', 'Entrada', 26.00, 'Descrição do Prato 51', 1),
    ('Prato 52', 'Principal', 55.00, 'Descrição do Prato 52', 1),
    ('Prato 53', 'Entrada', 30.00, 'Descrição do Prato 53', 2),
    ('Prato 54', 'Principal', 60.00, 'Descrição do Prato 54', 2),
    ('Prato 55', 'Sobremesa', 22.00, 'Descrição do Prato 55', 3),
    ('Prato 56', 'Entrada', 28.00, 'Descrição do Prato 56', 3),
    ('Prato 57', 'Principal', 57.00, 'Descrição do Prato 57', 4),
    ('Prato 58', 'Sobremesa', 24.00, 'Descrição do Prato 58', 4),
    ('Prato 59', 'Entrada', 23.00, 'Descrição do Prato 59', 5),
	('Prato 60', 'Entrada', 25.00, 'Descrição do Prato 60', 1);

INSERT INTO pedido (total, id_mesa, id_cliente, data) VALUES
    (100.00, 1, 1, '2024-08-01 12:30:00'),
    (120.00, 1, 1, '2024-08-02 12:30:00'),
    (140.00, 1, 1, '2024-08-03 12:30:00'),
    (150.00, 1, 2, '2024-08-04 12:30:00'),
    (160.00, 2, 2, '2024-08-01 13:30:00'),
    (170.00, 2, 2, '2024-08-02 13:30:00'),
    (180.00, 3, 3, '2024-08-01 14:30:00'),
    (190.00, 3, 3, '2024-08-02 14:30:00'),
    (200.00, 4, 4, '2024-08-02 12:30:00'),
    (210.00, 4, 4, '2024-08-03 12:30:00'),
    (220.00, 5, 5, '2024-08-02 13:30:00'),
    (230.00, 5, 5, '2024-08-03 13:30:00'),
    (240.00, 6, 6, '2024-08-03 11:30:00'),
    (250.00, 6, 6, '2024-08-04 11:30:00'),
    (260.00, 7, 7, '2024-08-03 12:00:00'),
    (270.00, 7, 7, '2024-08-04 12:00:00'),
    (280.00, 8, 8, '2024-08-03 13:00:00'),
    (290.00, 8, 8, '2024-08-04 13:00:00'),
    (300.00, 9, 9, '2024-08-03 14:00:00'),
    (310.00, 9, 9, '2024-08-04 14:00:00'),
    (320.00, 10, 10, '2024-08-03 15:00:00'),
    (330.00, 10, 10, '2024-08-04 15:00:00'),
    (340.00, 11, 11, '2024-08-04 12:30:00'),
    (350.00, 11, 11, '2024-08-05 12:30:00'),
    (360.00, 12, 12, '2024-08-04 13:00:00'),
    (370.00, 12, 12, '2024-08-05 13:00:00'),
    (380.00, 13, 13, '2024-08-04 14:00:00'),
    (390.00, 13, 13, '2024-08-05 14:00:00'),
    (400.00, 14, 14, '2024-08-04 15:00:00'),
    (410.00, 14, 14, '2024-08-05 15:00:00'),
    (420.00, 15, 15, '2024-08-04 16:00:00'),
    (430.00, 15, 15, '2024-08-05 16:00:00'),
    (440.00, 16, 16, '2024-08-05 12:30:00'),
    (450.00, 16, 16, '2024-08-06 12:30:00'),
    (460.00, 17, 17, '2024-08-05 13:00:00'),
    (470.00, 17, 17, '2024-08-06 13:00:00'),
    (480.00, 18, 18, '2024-08-05 14:00:00'),
    (490.00, 18, 18, '2024-08-06 14:00:00'),
    (500.00, 19, 19, '2024-08-05 15:00:00'),
    (510.00, 19, 19, '2024-08-06 15:00:00'),
    (520.00, 20, 20, '2024-08-05 16:00:00'),
    (530.00, 20, 20, '2024-08-06 16:00:00'),
    (540.00, 21, 21, '2024-08-06 12:30:00'),
    (550.00, 21, 21, '2024-08-07 12:30:00'),
    (560.00, 21, 21, '2024-08-08 12:30:00'),
    (570.00, 22, 22, '2024-08-06 13:00:00'),
    (580.00, 22, 22, '2024-08-07 13:00:00'),
    (590.00, 23, 23, '2024-08-06 14:00:00'),
    (600.00, 23, 23, '2024-08-07 14:00:00'),
    (610.00, 24, 24, '2024-08-06 15:00:00'),
    (620.00, 24, 24, '2024-08-07 15:00:00'),
    (630.00, 25, 25, '2024-08-06 16:00:00'),
    (640.00, 25, 25, '2024-08-07 16:00:00'),
    (650.00, 26, 26, '2024-08-07 12:30:00'),
    (660.00, 26, 26, '2024-08-08 12:30:00'),
    (670.00, 27, 27, '2024-08-07 13:00:00'),
    (680.00, 27, 27, '2024-08-08 13:00:00'),
    (690.00, 28, 28, '2024-08-07 14:00:00'),
    (700.00, 28, 28, '2024-08-08 14:00:00'),
    (710.00, 29, 29, '2024-08-07 15:00:00'),
    (720.00, 29, 29, '2024-08-08 15:00:00'),
    (730.00, 30, 30, '2024-08-07 16:00:00'),
    (740.00, 30, 30, '2024-08-08 16:00:00'),
    (100.00, 1, 1, '2024-08-09 12:30:00'),
    (150.00, 2, 2, '2024-08-09 13:00:00'),
    (200.00, 3, 3, '2024-08-09 14:00:00'),
    (250.00, 4, 4, '2024-08-09 15:00:00'),
    (300.00, 5, 5, '2024-08-09 16:00:00'),
    (350.00, 6, 6, '2024-08-09 17:00:00'),
    (400.00, 7, 7, '2024-08-10 12:00:00'),
    (450.00, 8, 8, '2024-08-10 13:00:00'),
    (500.00, 9, 9, '2024-08-10 14:00:00'),
    (550.00, 10, 10, '2024-08-10 15:00:00'),
    (600.00, 11, 11, '2024-08-10 16:00:00'),
    (650.00, 12, 12, '2024-08-11 12:00:00'),
    (700.00, 13, 13, '2024-08-11 13:00:00'),
    (750.00, 14, 14, '2024-08-11 14:00:00'),
    (800.00, 15, 15, '2024-08-11 15:00:00'),
    (850.00, 16, 16, '2024-08-11 16:00:00'),
    (900.00, 17, 17, '2024-08-12 12:00:00'),
    (950.00, 18, 18, '2024-08-12 13:00:00'),
    (1000.00, 19, 19, '2024-08-12 14:00:00'),
    (1050.00, 20, 20, '2024-08-12 15:00:00'),
    (1100.00, 21, 21, '2024-08-12 16:00:00'),
    (1150.00, 22, 22, '2024-08-12 17:00:00'),
    (1200.00, 23, 23, '2024-08-13 12:00:00'),
    (1250.00, 24, 24, '2024-08-13 13:00:00'),
    (1300.00, 25, 25, '2024-08-13 14:00:00'),
    (1350.00, 26, 26, '2024-08-13 15:00:00'),
    (1400.00, 27, 27, '2024-08-13 16:00:00'),
    (1450.00, 28, 28, '2024-08-13 17:00:00'),
    (1500.00, 29, 29, '2024-08-14 12:00:00'),
    (1550.00, 30, 30, '2024-08-14 13:00:00'),
    (1600.00, 1, 1, '2024-08-14 14:00:00'),
    (1650.00, 2, 2, '2024-08-14 15:00:00'),
    (1700.00, 3, 3, '2024-08-14 16:00:00'),
    (1750.00, 4, 4, '2024-08-14 17:00:00'),
    (1800.00, 5, 5, '2024-08-15 12:00:00'),
    (1850.00, 6, 6, '2024-08-15 13:00:00'),
    (1900.00, 7, 7, '2024-08-15 14:00:00'),
    (1950.00, 8, 8, '2024-08-15 15:00:00'),
    (2000.00, 9, 9, '2024-08-15 16:00:00'),
    (2050.00, 10, 10, '2024-08-15 17:00:00');

    
INSERT INTO pedido_has_prato (id_pedido, id_prato) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
    (2, 6), (2, 7), (2, 8), (2, 9), (2, 10),
    (3, 11), (3, 12), (3, 13), (3, 14), (3, 15),
    (4, 16), (4, 17), (4, 18), (4, 19), (4, 20),
    (5, 21), (5, 22), (5, 23), (5, 24), (5, 25),
    (6, 26), (6, 27), (6, 28), (6, 29), (6, 30),
    (7, 31), (7, 32), (7, 33), (7, 34), (7, 35),
    (8, 36), (8, 37), (8, 38), (8, 39), (8, 40),
    (9, 41), (9, 42), (9, 43), (9, 44), (9, 45),
    (10, 46), (10, 47), (10, 48), (10, 49), (10, 50),
    (11, 51), (11, 52), (11, 53), (11, 54), (11, 55),
    (12, 56), (12, 57), (12, 58), (12, 59), (12, 60),
    (13, 1), (13, 2), (13, 3), (13, 4), (13, 5),
    (14, 6), (14, 7), (14, 8), (14, 9), (14, 10),
    (15, 11), (15, 12), (15, 13), (15, 14), (15, 15),
    (16, 16), (16, 17), (16, 18), (16, 19), (16, 20),
    (17, 21), (17, 22), (17, 23), (17, 24), (17, 25),
    (18, 26), (18, 27), (18, 28), (18, 29), (18, 30),
    (19, 31), (19, 32), (19, 33), (19, 34), (19, 35),
    (20, 36), (20, 37), (20, 38), (20, 39), (20, 40),
    (21, 41), (21, 42), (21, 43), (21, 44), (21, 45),
    (22, 46), (22, 47), (22, 48), (22, 49), (22, 50),
    (23, 51), (23, 52), (23, 53), (23, 54), (23, 55),
    (24, 56), (24, 57), (24, 58), (24, 59), (24, 60),
    (25, 1), (25, 2), (25, 3), (25, 4), (25, 5),
    (26, 6), (26, 7), (26, 8), (26, 9), (26, 10),
    (27, 11), (27, 12), (27, 13), (27, 14), (27, 15),
    (28, 16), (28, 17), (28, 18), (28, 19), (28, 20),
    (29, 21), (29, 22), (29, 23), (29, 24), (29, 25),
    (30, 26), (30, 27), (30, 28), (30, 29), (30, 30),
    (31, 31), (31, 32), (31, 33), (31, 34), (31, 35),
    (32, 36), (32, 37), (32, 38), (32, 39), (32, 40),
    (33, 41), (33, 42), (33, 43), (33, 44), (33, 45),
    (34, 46), (34, 47), (34, 48), (34, 49), (34, 50),
    (35, 51), (35, 52), (35, 53), (35, 54), (35, 55),
    (36, 56), (36, 57), (36, 58), (36, 59), (36, 60),
    (37, 1), (37, 2), (37, 3), (37, 4), (37, 5),
    (38, 6), (38, 7), (38, 8), (38, 9), (38, 10),
    (39, 11), (39, 12), (39, 13), (39, 14), (39, 15),
    (40, 16), (40, 17), (40, 18), (40, 19), (40, 20),
    (41, 21), (41, 22), (41, 23), (41, 24), (41, 25),
    (42, 26), (42, 27), (42, 28), (42, 29), (42, 30),
    (43, 31), (43, 32), (43, 33), (43, 34), (43, 35),
    (44, 36), (44, 37), (44, 38), (44, 39), (44, 40),
    (45, 41), (45, 42), (45, 43), (45, 44), (45, 45),
    (46, 46), (46, 47), (46, 48), (46, 49), (46, 50),
    (47, 51), (47, 52), (47, 53), (47, 54), (47, 55),
    (48, 56), (48, 57), (48, 58), (48, 59), (48, 60),
    (49, 1), (49, 2), (49, 3), (49, 4), (49, 5),
    (50, 6), (50, 7), (50, 8), (50, 9), (50, 10),
    (51, 11), (51, 12), (51, 13), (51, 14), (51, 15),
    (52, 16), (52, 17), (52, 18), (52, 19), (52, 20),
    (53, 21), (53, 22), (53, 23), (53, 24), (53, 25),
    (54, 26), (54, 27), (54, 28), (54, 29), (54, 30),
    (55, 31), (55, 32), (55, 33), (55, 34), (55, 35),
    (56, 36), (56, 37), (56, 38), (56, 39), (56, 40),
    (57, 41), (57, 42), (57, 43), (57, 44), (57, 45),
    (58, 46), (58, 47), (58, 48), (58, 49), (58, 50),
    (59, 51), (59, 52), (59, 53), (59, 54), (59, 55),
    (60, 56), (60, 57), (60, 58), (60, 59), (60, 60),
    (61, 1), (61, 2), (61, 3), (61, 4), (61, 5),
    (62, 6), (62, 7), (62, 8), (62, 9), (62, 10),
    (63, 11), (63, 12), (63, 13), (63, 14), (63, 15),
    (64, 16), (64, 17), (64, 18), (64, 19), (64, 20),
    (65, 21), (65, 22), (65, 23), (65, 24), (65, 25),
    (66, 26), (66, 27), (66, 28), (66, 29), (66, 30),
    (67, 31), (67, 32), (67, 33), (67, 34), (67, 35),
    (68, 36), (68, 37), (68, 38), (68, 39), (68, 40),
    (69, 41), (69, 42), (69, 43), (69, 44), (69, 45),
    (70, 46), (70, 47), (70, 48), (70, 49), (70, 50),
    (71, 51), (71, 52), (71, 53), (71, 54), (71, 55),
    (72, 56), (72, 57), (72, 58), (72, 59), (72, 60),
    (73, 1), (73, 2), (73, 3), (73, 4), (73, 5),
    (74, 6), (74, 7), (74, 8), (74, 9), (74, 10),
    (75, 11), (75, 12), (75, 13), (75, 14), (75, 15),
    (76, 16), (76, 17), (76, 18), (76, 19), (76, 20),
    (77, 21), (77, 22), (77, 23), (77, 24), (77, 25),
    (78, 26), (78, 27), (78, 28), (78, 29), (78, 30),
    (79, 31), (79, 32), (79, 33), (79, 34), (79, 35),
    (80, 36), (80, 37), (80, 38), (80, 39), (80, 40),
    (81, 41), (81, 42), (81, 43), (81, 44), (81, 45),
    (82, 46), (82, 47), (82, 48), (82, 49), (82, 50),
    (83, 51), (83, 52), (83, 53), (83, 54), (83, 55),
    (84, 56), (84, 57), (84, 58), (84, 59), (84, 60),
    (85, 1), (85, 2), (85, 3), (85, 4), (85, 5),
    (86, 6), (86, 7), (86, 8), (86, 9), (86, 10),
    (87, 11), (87, 12), (87, 13), (87, 14), (87, 15),
    (88, 16), (88, 17), (88, 18), (88, 19), (88, 20),
    (89, 21), (89, 22), (89, 23), (89, 24), (89, 25),
    (90, 26), (90, 27), (90, 28), (90, 29), (90, 30),
    (91, 31), (91, 32), (91, 33), (91, 34), (91, 35),
    (92, 36), (92, 37), (92, 38), (92, 39), (92, 40),
    (93, 41), (93, 42), (93, 43), (93, 44), (93, 45),
    (94, 46), (94, 47), (94, 48), (94, 49), (94, 50),
    (95, 51), (95, 52), (95, 53), (95, 54), (95, 55),
    (96, 56), (96, 57), (96, 58), (96, 59), (96, 60),
    (97, 1), (97, 2), (97, 3), (97, 4), (97, 5),
    (98, 6), (98, 7), (98, 8), (98, 9), (98, 10),
    (99, 11), (99, 12), (99, 13), (99, 14), (99, 15),
    (100, 16), (100, 17), (100, 18), (100, 19), (100, 20),
    (101, 21), (101, 22), (101, 23), (101, 24), (101, 25),
    (102, 26), (102, 27), (102, 28), (102, 29), (102, 30),
    (103, 31), (103, 32), (103, 33), (103, 34), (103, 35);