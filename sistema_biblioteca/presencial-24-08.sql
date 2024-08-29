-- criando database biblioteca
create database if not exists sistema_biblioteca;

-- selecionando a database sistema_biblioteca
use sistema_biblioteca;

-- adicionando as tables
create table if not exists autor(
id_autor int primary key auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
sobrenome varchar(100) not null,
data_nascimento date not null
);

create table if not exists acervo(
id_acervo int primary key auto_increment,
titulo varchar(100) not null,
editora varchar(100),
isbn varchar(13) not null unique,
ano_publicacao date,
numero_paginas int,
disponibilidade varchar(45),
genero varchar(45),
codigo_barras varchar(45),
sinopse varchar(255),
tipo_item varchar(45),
id_autor int not null,
constraint fk_autor
	foreign key(id_autor) references autor(id_autor) 
);

create table if not exists exemplar(
id_exemplar int primary key auto_increment,
quantidade_exemplares int not null,
id_acervo int not null,
constraint fk_exemplar_acervo
	foreign key(id_acervo) references acervo(id_acervo)
);

create table if not exists usuario(
id_usuario int primary key auto_increment,
nome varchar(100) not null,
cpf varchar(14) not null unique,
email varchar(100),
telefone varchar(15) not null,
status_usuario varchar(45) not null,
cidade varchar(100) not null,
data_nascimento date
);

create table if not exists reserva(
id_reserva int primary key auto_increment,
data_reserva date not null,
vencimento date not null,
id_usuario int not null,
id_exemplar int not null,
id_acervo int not null,
constraint fk_reserva_usuario
	foreign key(id_usuario) references usuario(id_usuario),
constraint fk_reserva_exemplar
	foreign key(id_exemplar) references exemplar(id_exemplar),
constraint fk_reserva_acervo
	foreign key(id_acervo) references acervo(id_acervo)
);

create table if not exists emprestimo(
id_emprestimo int primary key auto_increment,
data_emprestimo date not null,
status_emprestimo varchar(45),
id_usuario int not null,
id_reserva int not null,
id_exemplar int not null,
id_acervo int not null,
constraint fk_emprestimo_usuario
	foreign key(id_usuario) references usuario(id_usuario),
constraint fk_emprestimo_reserva
	foreign key(id_reserva) references reserva(id_reserva),
constraint fk_emprestimo_exemplar
	foreign key(id_exemplar) references exemplar(id_exemplar),
constraint fk_emprestimo_livro
	foreign key(id_acervo) references acervo(id_acervo)
);

create table if not exists cobranca(
id_cobranca int primary key auto_increment,
data_devolucao date not null,
total_pagar decimal(5,2),
multa decimal(5,2),
id_emprestimo int not null,
id_usuario int not null,
id_reserva int not null,
id_exemplar int not null,
id_acervo int not null,
constraint fk_cobranca_emprestimo
	foreign key(id_emprestimo) references emprestimo(id_emprestimo),
constraint fk_cobranca_usuario
	foreign key(id_usuario) references usuario(id_usuario),
constraint fk_cobranca_reserva
	foreign key(id_reserva) references reserva(id_reserva),
constraint fk_cobranca_exemplar
	foreign key(id_exemplar) references exemplar(id_exemplar),
constraint fk_cobranca_acervo
	foreign key(id_acervo) references acervo(id_acervo)
);


-- populando a tabela
INSERT INTO autor (nome, sobrenome, email, data_nascimento) VALUES
('João', 'Silva', 'joao.silva1@example.com', '1985-03-14'),
('Maria', 'Souza', 'maria.souza1@example.com', '1990-07-22'),
('Carlos', 'Oliveira', 'carlos.oliveira1@example.com', '1982-12-05'),
('Ana', 'Pereira', 'ana.pereira1@example.com', '1975-01-15'),
('Paulo', 'Lima', 'paulo.lima1@example.com', '1988-04-17'),
('Fernanda', 'Alves', 'fernanda.alves1@example.com', '1995-09-12'),
('Bruno', 'Ribeiro', 'bruno.ribeiro1@example.com', '1981-11-21'),
('Cláudia', 'Mendes', 'claudia.mendes1@example.com', '1986-05-30'),
('Ricardo', 'Gomes', 'ricardo.gomes1@example.com', '1993-02-08'),
('Juliana', 'Martins', 'juliana.martins1@example.com', '1991-06-14'),
('Roberto', 'Fernandes', 'roberto.fernandes1@example.com', '1983-08-25'),
('Tatiane', 'Barbosa', 'tatiane.barbosa1@example.com', '1997-03-19'),
('Gabriel', 'Costa', 'gabriel.costa1@example.com', '1989-10-10'),
('Luana', 'Freitas', 'luana.freitas1@example.com', '1992-11-02'),
('Felipe', 'Santos', 'felipe.santos1@example.com', '1987-07-07'),
('Patrícia', 'Carvalho', 'patricia.carvalho1@example.com', '1994-09-28'),
('Marcos', 'Batista', 'marcos.batista1@example.com', '1980-02-16'),
('Larissa', 'Campos', 'larissa.campos1@example.com', '1996-05-05'),
('Thiago', 'Teixeira', 'thiago.teixeira1@example.com', '1984-01-20'),
('Vanessa', 'Ferreira', 'vanessa.ferreira1@example.com', '1990-12-03'),
('Renato', 'Borges', 'renato.borges1@example.com', '1987-04-11'),
('Sandra', 'Melo', 'sandra.melo1@example.com', '1992-08-19'),
('Vinícius', 'Araujo', 'vinicius.araujo1@example.com', '1983-11-09'),
('Aline', 'Silveira', 'aline.silveira1@example.com', '1991-02-25'),
('Gustavo', 'Rocha', 'gustavo.rocha1@example.com', '1986-10-30'),
('Mariana', 'Cunha', 'mariana.cunha1@example.com', '1995-03-12'),
('Eduardo', 'Monteiro', 'eduardo.monteiro1@example.com', '1984-07-18'),
('Camila', 'Santos', 'camila.santos1@example.com', '1993-09-22'),
('Felipe', 'Pinto', 'felipe.pinto1@example.com', '1989-06-04'),
('Isabela', 'Nogueira', 'isabela.nogueira1@example.com', '1990-01-13'),
('André', 'Barros', 'andre.barros1@example.com', '1982-12-15'),
('Juliana', 'Silva', 'juliana.silva2@example.com', '1996-11-05'),
('Leonardo', 'Costa', 'leonardo.costa1@example.com', '1985-05-28'),
('Renata', 'Correia', 'renata.correia1@example.com', '1991-10-21'),
('Fernando', 'Souza', 'fernando.souza1@example.com', '1983-03-27'),
('Larissa', 'Vieira', 'larissa.vieira1@example.com', '1994-07-15'),
('Rodrigo', 'Carvalho', 'rodrigo.carvalho1@example.com', '1988-12-01'),
('Amanda', 'Martins', 'amanda.martins1@example.com', '1992-06-23'),
('Bruno', 'Gomes', 'bruno.gomes1@example.com', '1981-08-13'),
('Daniela', 'Oliveira', 'daniela.oliveira1@example.com', '1995-04-10');


INSERT INTO acervo (titulo, editora, isbn, ano_publicacao, numero_paginas, disponibilidade, genero, codigo_barras, sinopse, tipo_item, id_autor) VALUES
('Introdução à Programação', 'Érica', 9781234567897, '2010-01-15', 350, 'Disponível', 'Tecnologia e Ciência', '1234567890001', 'Livro sobre os conceitos básicos de programação.', 'Livro', 1),
('História da Computação', 'Érica', 9781234567898, '2012-05-23', 420, 'Disponível', 'Tecnologia e Ciência', '1234567890002', 'Uma visão abrangente da história do Milênio.', 'Livro', 2),
('Ciência para Crianças', 'Junior', 9781234567899, '2015-08-30', 150, 'Disponível', 'Ciência', '1234567890003', 'Um livro educativo para crianças sobre ciências.', 'Livro', 3),
('Aventura na Floresta', 'Kids', 9781234567800, '2017-11-10', 200, 'Disponível', 'Literatura Infantil', '1234567890004', 'Uma história divertida para crianças.', 'Livro', 4),
('Manual de Eletrônica', 'TechBooks', 9781234567801, '2008-02-19', 300, 'Indisponível', 'Tecnologia e Ciência', '1234567890005', 'Guia completo sobre eletrônica.', 'Livro', 5),
('Revista Ciência Hoje', 'Revistas & Cia', 9781234567802, '2020-06-14', 100, 'Disponível', 'Ciência', '1234567890006', 'Revista mensal sobre avanços científicos.', 'Revista', 6),
('A Magia dos Números', 'Mathematica', 9781234567803, '2011-09-23', 250, 'Disponível', 'Matemática', '1234567890007', 'Exploração do mundo dos números.', 'Livro', 7),
('O Pequeno Príncipe', 'Érica', 9781234567804, '2000-04-01', 150, 'Disponível', 'Literatura Infantil', '1234567890008', 'Um clássico da literatura infantil.', 'Livro', 8),
('Manual de Primeiros Socorros', 'Health Press', 9781234567805, '2018-12-12', 180, 'Indisponível', 'Saúde', '1234567890009', 'Guia prático para situações de emergência.', 'Livro', 9),
('Histórias de Aventura', 'Adventure Books', 9781234567810, '2016-07-21', 220, 'Disponível', 'Aventura', '1234567890010', 'Coletânea de histórias de aventura.', 'Livro', 10),
('Guia de Astronomia', 'Astronomy Inc.', 9781234567811, '2013-10-18', 280, 'Disponível', 'Ciência', '1234567890011', 'Guia para iniciantes em astronomia.', 'Livro', 11),
('Enciclopédia de Física', 'ScienceWorld', 9781234567812, '2005-01-11', 500, 'Disponível', 'Ciência', '1234567890012', 'Uma enciclopédia abrangente de física.', 'Livro', 12),
('Revista Tecnológica', 'TechMag', 9781234567813, '2019-03-15', 90, 'Indisponível', 'Tecnologia e Ciência', '1234567890013', 'Artigos e notícias sobre tecnologia.', 'Revista', 13),
('Cálculo Avançado', 'MathWorks', 9781234567814, '2014-08-28', 400, 'Disponível', 'Matemática', '1234567890014', 'Estudo avançado de cálculo.', 'Livro', 14),
('Mundo dos Dinossauros', 'DinoBooks', 9781234567815, '2021-11-03', 120, 'Disponível', 'Ciência', '1234567890015', 'Exploração do mundo dos dinossauros.', 'Livro', 15),
('Aventuras na Selva', 'Jungle Reads', 9781234567816, '2017-05-09', 240, 'Indisponível', 'Aventura', '1234567890016', 'Histórias emocionantes na selva.', 'Livro', 16),
('Biologia para Iniciantes', 'Érica', 9781234567817, '2010-02-27', 360, 'Disponível', 'Ciência', '1234567890017', 'Introdução à biologia.', 'Livro', 17),
('Histórias de Dragões', 'Fantasy World', 9781234567818, '2012-09-14', 180, 'Disponível', 'Fantasia', '1234567890018', 'Histórias mágicas de dragões.', 'Livro', 18),
('O Universo em Foco', 'Cosmos Books', 9781234567819, '2018-06-07', 280, 'Disponível', 'Ciência', '1234567890019', 'Uma exploração do universo.', 'Livro', 19),
('Fábulas Encantadas', 'Tales for Kids', 9781234567820, '2020-12-15', 130, 'Disponível', 'Literatura Infantil', '1234567890020', 'Fábulas e contos para crianças.', 'Livro', 20),
('Histórias de Piratas', 'Adventure Press', 9781234567821, '2015-08-04', 200, 'Indisponível', 'Aventura', '1234567890021', 'Aventuras no mar com piratas.', 'Livro', 21),
('O Corpo Humano', 'Health Insights', 9781234567822, '2013-03-23', 300, 'Disponível', 'Saúde', '1234567890022', 'Exploração do corpo humano.', 'Livro', 22),
('Revista Saúde e Bem-estar', 'Health Journal', 9781234567823, '2021-09-12', 80, 'Disponível', 'Saúde', '1234567890023', 'Dicas e informações sobre saúde.', 'Revista', 23),
('As Aventuras de Tom Sawyer', 'Érica', 9781234567824, '1999-05-14', 190, 'Disponível', 'Literatura Infantil', '1234567890024', 'Clássico da literatura infanto-juvenil.', 'Livro', 24),
('Manual de Robótica', 'TechBooks', 9781234567825, '2019-01-10', 320, 'Indisponível', 'Tecnologia e Ciência', '1234567890025', 'Guia completo sobre robótica.', 'Livro', 25),
('Revista Matemática', 'Math Journals', 9781234567826, '2017-07-07', 75, 'Disponível', 'Matemática', '1234567890026', 'Artigos sobre matemática.', 'Revista', 26),
('O Mundo dos Animais', 'Wildlife Books', 9781234567827, '2016-10-20', 280, 'Disponível', 'Ciência', '1234567890027', 'Exploração do reino animal.', 'Livro', 27),
('Histórias do Futuro', 'Future Reads', 9781234567828, '2022-03-11', 220, 'Disponível', 'Ficção Científica', '1234567890028', 'Histórias de ficção científica.', 'Livro', 28),
('Enciclopédia de Astronomia', 'Star Publishers', 9781234567829, '2015-11-02', 460, 'Indisponível', 'Ciência', '1234567890029', 'Uma enciclopédia sobre astronomia.', 'Livro', 29),
('Aventuras no Espaço', 'Space Books', 9781234567830, '2021-02-15', 250, 'Disponível', 'Ficção Científica', '1234567890030', 'Histórias emocionantes no espaço.', 'Livro', 30),
('Manual de Programação', 'Code Press', 9781234567831, '2018-09-30', 380, 'Disponível', 'Tecnologia e Ciência', '1234567890031', 'Guia completo de programação.', 'Livro', 31),
('Fitas de Exercícios', 'Fitness Video', 9781234567832, NULL, '120', 'Indisponível', 'Saúde', '1234567890032', 'Fitas de vídeo com exercícios físicos.', 'Fita', 32);


INSERT INTO exemplar (quantidade_exemplares, id_acervo) VALUES
(5, 1),
(3, 2),
(7, 3),
(10, 4),
(2, 5),
(8, 6),
(6, 7),
(4, 8),
(9, 9),
(3, 10),
(5, 11),
(2, 12),
(7, 13),
(4, 14),
(8, 15),
(6, 16),
(9, 17),
(5, 18),
(3, 19),
(10, 20),
(7, 21),
(4, 22),
(6, 23),
(8, 24),
(2, 25),
(5, 26),
(7, 27),
(9, 28),
(4, 29),
(6, 30);

INSERT INTO usuario (nome, cpf, email, telefone, status_usuario, cidade, data_nascimento) VALUES
('João Silva', '123.456.789-01', 'teste@teste.com', '(11) 98765-4321', 'Ativo', 'São Paulo', '1985-03-14'),
('Maria Souza', '123.456.789-02', 'maria.souza@example.com', '(21) 99876-5432', 'Ativo', 'Rio de Janeiro', '1990-07-22'),
('Carlos Oliveira', '123.456.789-03', 'carlos.oliveira@example.com', '(31) 98765-4321', 'Ativo', 'Belo Horizonte', '1982-12-05'),
('Ana Pereira', '123.456.789-04', 'ana.pereira@example.com', '(41) 99876-5432', 'Ativo', 'Curitiba', '1975-01-15'),
('Amanda Lima', '123.456.789-05', 'amanda.lima@example.com', '(51) 98765-4321', 'Ativo', 'Porto Alegre', '1988-04-17'),
('Fernanda Alves', '123.456.789-06', 'fernanda.alves@example.com', '(61) 99876-5432', 'Ativo', 'Brasília', '1995-09-12'),
('Bruno Ribeiro', '123.456.789-07', 'bruno.ribeiro@example.com', '(71) 98765-4321', 'Ativo', 'Salvador', '1981-11-21'),
('Cláudia Mendes', '123.456.789-08', 'claudia.mendes@example.com', '(81) 99876-5432', 'Ativo', 'Recife', '1986-05-30'),
('Ricardo Gomes', '123.456.789-09', 'teste@teste.com', '(91) 98765-4321', 'Ativo', 'Belém', '1993-02-08'),
('Juliana Martins', '123.456.789-10', 'juliana.martins@example.com', '(31) 99876-5432', 'Ativo', 'Belo Horizonte', '1991-06-14'),
('Roberto Fernandes', '123.456.789-11', 'roberto.fernandes@example.com', '(11) 98765-4321', 'Ativo', 'São Paulo', '1983-08-25'),
('Tatiane Barbosa', '123.456.789-12', 'tatiane.barbosa@example.com', '(21) 99876-5432', 'Ativo', 'Rio de Janeiro', '1997-03-19'),
('Gabriel Costa', '123.456.789-13', 'gabriel.costa@example.com', '(41) 98765-4321', 'Ativo', 'Curitiba', '1989-10-10'),
('Luana Freitas', '123.456.789-14', 'luana.freitas@example.com', '(51) 99876-5432', 'Ativo', 'Porto Alegre', '1992-11-02'),
('Felipe Santos', '123.456.789-15', 'teste@teste.com', '(61) 98765-4321', 'Ativo', 'Brasília', '1987-07-07'),
('Patrícia Carvalho', '123.456.789-16', 'patricia.carvalho@example.com', '(71) 99876-5432', 'Ativo', 'Salvador', '1994-09-28'),
('Marcos Batista', '123.456.789-17', 'marcos.batista@example.com', '(81) 98765-4321', 'Ativo', 'Recife', '1980-02-16'),
('Larissa Campos', '123.456.789-18', 'larissa.campos@example.com', '(91) 99876-5432', 'Ativo', 'Belém', '1996-05-05'),
('Thiago Teixeira', '123.456.789-19', 'thiago.teixeira@example.com', '(11) 98765-4321', 'Ativo', 'São Paulo', '1984-01-20'),
('Vanessa Ferreira', '123.456.789-20', 'vanessa.ferreira@example.com', '(21) 99876-5432', 'Ativo', 'Rio de Janeiro', '1990-12-03'),
('Rodrigo Lopes', '123.456.789-21', 'rodrigo.lopes@example.com', '(31) 98765-4321', 'Ativo', 'Belo Horizonte', '1986-06-18'),
('Camila Souza', '123.456.789-22', 'camila.souza@example.com', '(41) 99876-5432', 'Ativo', 'Curitiba', '1993-07-24'),
('Eduardo Oliveira', '123.456.789-23', 'teste@teste.com', '(51) 98765-4321', 'Ativo', 'Porto Alegre', '1982-09-09'),
('Raquel Lima', '123.456.789-24', 'raquel.lima@example.com', '(61) 99876-5432', 'Ativo', 'Brasília', '1990-03-16'),
('Gustavo Alves', '123.456.789-25', 'gustavo.alves@example.com', '(71) 98765-4321', 'Ativo', 'Salvador', '1987-10-05'),
('Sabrina Martins', '123.456.789-26', 'sabrina.martins@example.com', '(81) 99876-5432', 'Ativo', 'Recife', '1995-01-28'),
('Fernando Costa', '123.456.789-27', 'fernando.costa@example.com', '(91) 98765-4321', 'Ativo', 'Belém', '1989-04-04'),
('Vivian Silva', '123.456.789-28', 'vivian.silva@example.com', '(11) 99876-5432', 'Ativo', 'São Paulo', '1992-08-15'),
('jonathan eichenberger', '666.666.666.66', 'jonathan_eichenbe@estudante.sesisenai.org.br', '(47)99882-2323', 'Ativo', 'Jaraguá do Sul', '1987-06-22'),
('Lucas Ribeiro', '123.456.789-29', 'lucas.ribeiro@example.com', '(21) 98765-4321', 'Ativo', 'Rio de Janeiro', '1984-12-22'),
('Patrícia Mendes', '123.456.789-30', 'patricia.mendes@example.com', '(31) 99876-5432', 'Ativo', 'Belo Horizonte', '1991-11-11'),
('Christofer Alberto Pfeiffer', '666.888.666-11', 'christofer_pfeiffer@estudante.sesisenai.org.br', '(47)98765-1234', 'Ativo', 'Jaraguá do Sul', '2008-03-10');

 
INSERT INTO reserva (data_reserva, vencimento, id_usuario, id_exemplar, id_acervo) VALUES
('2024-08-01', '2024-08-15', 1, 1, 1),
('2024-08-02', '2024-08-16', 2, 2, 2),
('2024-08-03', '2024-08-17', 3, 3, 3),
('2024-08-04', '2024-08-18', 4, 4, 4),
('2024-08-05', '2024-08-19', 5, 5, 5),
('2024-08-06', '2024-08-08', 6, 6, 28),
('2024-08-07', '2024-08-10', 7, 7, 30),
('2024-08-08', '2024-08-22', 8, 8, 8),
('2024-08-09', '2024-08-23', 9, 9, 9),
('2024-08-10', '2024-08-24', 10, 10, 10),
('2024-08-11', '2024-08-25', 11, 11, 11),
('2024-08-12', '2024-08-26', 12, 12, 12),
('2024-08-13', '2024-08-27', 13, 13, 13),
('2024-08-14', '2024-08-28', 14, 14, 14),
('2024-08-15', '2024-08-29', 15, 15, 15),
('2024-08-16', '2024-08-30', 16, 16, 16),
('2024-08-17', '2024-08-31', 17, 17, 17),
('2024-08-18', '2024-09-01', 18, 18, 18),
('2024-08-19', '2024-09-02', 19, 19, 19),
('2024-08-20', '2024-09-03', 20, 20, 20);


INSERT INTO emprestimo (data_emprestimo, status_emprestimo, id_usuario, id_reserva, id_exemplar, id_acervo) VALUES
('2024-08-02', 'Devolvido', 1, 1, 1, 1),
('2024-08-03', 'Devolvido', 2, 2, 2, 2),
('2024-08-04', 'Emprestado', 3, 3, 3, 3),
('2024-08-05', 'Devolvido', 4, 4, 4, 4),
('2024-08-06', 'Devolvido', 5, 5, 5, 5),
('2024-08-07', 'Emprestado', 6, 6, 6, 28),
('2024-08-08', 'Devolvido', 7, 7, 7, 30),
('2024-08-09', 'Emprestado', 8, 8, 8, 8),
('2024-08-10', 'Devolvido', 9, 9, 9, 9),
('2024-08-11', 'Devolvido', 10, 10, 10, 10),
('2024-08-12', 'Emprestado', 11, 11, 11, 11),
('2024-08-13', 'Devolvido', 12, 12, 12, 12),
('2024-08-14', 'Devolvido', 13, 13, 13, 13),
('2024-08-15', 'Emprestado', 14, 14, 14, 14),
('2024-08-16', 'Devolvido', 15, 15, 15, 15),
('2024-08-17', 'Devolvido', 16, 16, 16, 16),
('2024-08-18', 'Emprestado', 17, 17, 17, 17),
('2024-08-19', 'Devolvido', 18, 18, 18, 18),
('2024-08-20', 'Emprestado', 19, 19, 19, 19),
('2024-08-21', 'Devolvido', 20, 20, 20, 20),
('2024-08-22', 'Devolvido', 1, 1, 1, 1),
('2024-08-23', 'Emprestado', 2, 2, 2, 2),
('2024-08-24', 'Devolvido', 3, 3, 3, 3),
('2024-08-25', 'Devolvido', 4, 4, 4, 4),
('2024-08-26', 'Emprestado', 5, 5, 5, 5),
('2024-08-27', 'Devolvido', 6, 6, 6, 6),
('2024-08-28', 'Emprestado', 7, 7, 7, 7),
('2024-08-29', 'Devolvido', 8, 8, 8, 8),
('2024-08-30', 'Emprestado', 9, 9, 9, 9),
('2024-08-31', 'Devolvido', 10, 10, 10, 10);

INSERT INTO cobranca (data_devolucao, total_pagar, multa, id_emprestimo, id_usuario, id_reserva, id_exemplar, id_acervo) VALUES
('2024-08-04', 5.00, 0.00, 1, 1, 1, 1, 1),
('2024-08-05', 5.00, 0.00, 2, 2, 2, 2, 2),
('2024-08-07', 10.00, 5.00, 3, 3, 3, 3, 3),
('2024-08-08', 5.00, 0.00, 4, 4, 4, 4, 4),
('2024-08-09', 5.00, 0.00, 5, 5, 5, 5, 5),
('2024-08-11', 10.00, 5.00, 6, 6, 6, 6, 28),
('2024-08-12', 5.00, 20.00, 7, 7, 7, 7, 30),
('2024-08-14', 15.00, 10.00, 8, 8, 8, 8, 8),
('2024-08-13', 5.00, 0.00, 9, 9, 9, 9, 9),
('2024-08-15', 5.00, 0.00, 10, 10, 10, 10, 10),
('2024-08-16', 10.00, 5.00, 11, 11, 11, 11, 11),
('2024-08-17', 5.00, 0.00, 12, 12, 12, 12, 12),
('2024-08-19', 15.00, 10.00, 13, 13, 13, 13, 13),
('2024-08-20', 5.00, 0.00, 14, 14, 14, 14, 14),
('2024-08-21', 5.00, 0.00, 15, 15, 15, 15, 15),
('2024-08-23', 15.00, 10.00, 16, 16, 16, 16, 16),
('2024-08-24', 5.00, 0.00, 17, 17, 17, 17, 17),
('2024-08-25', 5.00, 0.00, 18, 18, 18, 18, 18),
('2024-08-27', 20.00, 15.00, 19, 19, 19, 19, 19),
('2024-08-28', 5.00, 0.00, 20, 20, 20, 20, 20),
('2024-08-29', 5.00, 0.00, 1, 1, 1, 1, 1),
('2024-08-30', 10.00, 5.00, 2, 2, 2, 2, 2),
('2024-09-01', 15.00, 10.00, 3, 3, 3, 3, 3),
('2024-09-02', 5.00, 0.00, 4, 4, 4, 4, 4),
('2024-09-03', 5.00, 0.00, 5, 5, 5, 5, 5),
('2024-09-05', 15.00, 10.00, 6, 6, 6, 6, 6),
('2024-09-06', 5.00, 0.00, 7, 7, 7, 7, 7),
('2024-09-08', 20.00, 15.00, 8, 8, 8, 8, 8),
('2024-09-07', 5.00, 0.00, 9, 9, 9, 9, 9),
('2024-09-08', 5.00, 0.00, 10, 10, 10, 10, 10),
('2024-09-09', 10.00, 5.00, 11, 11, 11, 11, 11),
('2024-09-10', 5.00, 0.00, 12, 12, 12, 12, 12),
('2024-09-12', 15.00, 10.00, 13, 13, 13, 13, 13),
('2024-09-13', 5.00, 0.00, 14, 14, 14, 14, 14),
('2024-09-14', 5.00, 0.00, 15, 15, 15, 15, 15),
('2024-09-16', 20.00, 15.00, 16, 16, 16, 16, 16),
('2024-09-17', 5.00, 0.00, 17, 17, 17, 17, 17),
('2024-09-18', 5.00, 0.00, 18, 18, 18, 18, 18),
('2024-09-20', 15.00, 10.00, 19, 19, 19, 19, 19),
('2024-09-21', 5.00, 0.00, 20, 20, 20, 20, 20);

-- Consultas Propostas na Imersão

-- 01) Consultar todos os itens do acervo cadastrados na biblioteca;
select * from acervo;

-- 02) Consultar todos os itens do acervo cadastrados e dasabilitados; 
select * from acervo where disponibilidade like 'indisponivel';

-- 03) Consultar todos os livros com gênero "Literatura Infantil;
SELECT titulo as Livro, genero FROM acervo WHERE genero like 'Literatura Infantil' and tipo_item like 'livro';

-- 04) Consultar todos os livros com gênero “Tecnologia e Ciência” da editora “Érica” e exibir somente os seguintes dados na consulta: código do livro, nome/título do livro, gênero, editora e código de barras;
select id_acervo as Código_do_livro, titulo, genero, editora, codigo_barras from acervo where genero like 'tecnologia e ciencia' and editora like 'erica';

-- 05) Consultar todos os itens do acervo que não são livros, estejam habilitados e ordená-los primeiramente pelo gênero e posteriormente pelo nome (crescente);
select * from acervo where genero not like 'livro' and disponibilidade like 'disponivel'
order by genero asc, titulo asc;

-- 06) Consultar somente os livros que estão emprestados;
select a.titulo, em.status_emprestimo from acervo a
inner join exemplar e
	on a.id_acervo = e.id_acervo
inner join reserva r
	on e.id_acervo = r.id_acervo
inner join emprestimo em
	on r.id_acervo = em.id_acervo
where em.status_emprestimo like 'emprestado';
    
-- 07) Consultar os itens do acervo que não permite-se realizar empréstimos (apreciação local);
select titulo, tipo_item, disponibilidade from acervo where disponibilidade like 'indisponivel';

-- 08) Consultar todos os leitores que tenham telefone ou e-mail cadastrados;
select * from usuario where telefone is not null or email is not null;

-- 09) Consultar todos os leitores que possuem até 3 livros emprestados;
select u.nome, count(e.id_emprestimo) from usuario u 
inner join emprestimo e
	on u.id_usuario = e.id_usuario
group by e.id_usuario
having count(e.id_emprestimo) <= 3;

-- 10) Consultar os livros emprestados e que estão com atraso;
select a.titulo, r.data_reserva, r.vencimento, c.data_devolucao, e.status_emprestimo from acervo a
inner join exemplar ex
	on a.id_acervo = ex.id_acervo
inner join reserva r
	on ex.id_acervo = r.id_acervo
inner join emprestimo e
	on r.id_reserva = e.id_reserva
inner join cobranca c
	on e.id_reserva = c.id_reserva
where c.data_devolucao > r.vencimento and e.status_emprestimo like 'emprestado';

-- 11) Consultar empréstimos atrasados e exibir: nome do livro, data da devolução, nome do leitor, telefone e e-mail;
select a.titulo, r.vencimento, c.data_devolucao, u.nome as Nome_leitor, u.telefone, u.email from acervo a
inner join exemplar ex
	on a.id_acervo = ex.id_acervo
inner join reserva r
	on ex.id_acervo = r.id_acervo
inner join emprestimo e
	on r.id_reserva = e.id_reserva
inner join usuario u
	on e.id_usuario = u.id_usuario
inner join cobranca c
	on e.id_reserva = c.id_reserva
where c.data_devolucao > r.vencimento and e.status_emprestimo like 'emprestado';

-- 12) Contar a quantidade de livros emprestados que estão atrasados;
select count(e.id_emprestimo) as Livros_atrasados from reserva r
inner join emprestimo e
	on r.id_reserva = e.id_reserva
inner join cobranca c
	on e.id_reserva = c.id_reserva
where c.data_devolucao > r.vencimento and e.status_emprestimo like 'emprestado';

-- 13) Apresentar os empréstimos realizados entre as datas 21/08/2024 a 02/09/2024 que estejam com status de devolvido;
select a.titulo, u.nome as Nome_leitor, c.data_devolucao, status_emprestimo from acervo a
inner join exemplar ex
	on a.id_acervo = ex.id_acervo
inner join reserva r
	on ex.id_acervo = r.id_acervo
inner join emprestimo e
	on r.id_reserva = e.id_reserva
inner join usuario u
	on e.id_usuario = u.id_usuario
inner join cobranca c
	on e.id_reserva = c.id_reserva
where e.data_emprestimo between '2024-08-21' and '2024-09-02' and e.status_emprestimo like 'devolvido';

-- 14) Consultar as reservas, apresentando: nome do leitor, nome do livro e data da reserva;
select u.nome as Leitor, a.titulo, r.data_reserva from acervo a
inner join exemplar ex
	on a.id_acervo = ex.id_acervo
inner join reserva r
	on ex.id_acervo = r.id_acervo
inner join usuario u
	on r.id_usuario = u.id_usuario
where id_reserva;

-- 15) Consultar livros com o título ou sinopse que possuam o termo “Milênio” e estejam habilitados ou ativos;
select * from acervo where titulo like 'Milenio' or sinopse like '%milenio%';


-- 16 Apresentar a quantidade de reservas entre as datas de 01/06/2023 até 01/08/2023;
select count(id_reserva) as Quantidade_reservas from reserva
where data_reserva between '2024-06-01' and '2024-08-01';

-- 17) Somar o valor das multas aplicadas aos livros recebidos em atraso entre o intervalo de 02/05/2024 até 24/08/2024;
select sum(multa) as Soma_multas from cobranca
where data_devolucao between '2024-05-02' and '2024-08-24';

-- 18) Apresentar o valor médio das multas cobradas entre 01/03/2023 até 30/06/2023 que sejam de livros com gênero Ficção;
select avg(c.multa) as media_multas from cobranca c
inner join emprestimo e 
	on c.id_emprestimo = e.id_emprestimo
inner  join exemplar ex 
	on e.id_exemplar = ex.id_exemplar
inner join acervo l 
	on ex.id_acervo = l.id_acervo
where c.multa > 0 and c.data_devolucao between '2024-02-02' and '2024-09-24' and l.genero = 'Ficção Científica';

-- 19) Apresentar os empréstimos realizados entre 22/05/2024 até 31/08/2024 que tenham sido realizados pela colaboradora Amanda;
select a.titulo, u.nome as Nome_leitor, e.status_emprestimo from acervo a
inner join exemplar ex
	on a.id_acervo = ex.id_acervo
inner join reserva r
	on ex.id_acervo = r.id_acervo
inner join emprestimo e
	on r.id_reserva = e.id_reserva
inner join usuario u
	on e.id_usuario = u.id_usuario
inner join cobranca c
	on e.id_reserva = c.id_reserva
where e.data_emprestimo between '2024-05-22' and '2024-08-31' and u.nome like 'Amanda%';

-- 20) Consultar os livros entre o intervalo de 25 até 32,apresentando somente o nome do livro e o nome do autor;
select a.id_acervo, a.titulo as Nome_livro, au.nome as Nome_autor, a.tipo_item from autor au
inner join acervo a
	on au.id_autor = a.id_autor
where a.id_acervo between 25 and 32 and a.tipo_item like 'livro';

-- 21) Excluir os usuários com e-mail teste@teste.com
delete from usuario where id_usuario > 0 and email like'teste@teste.com';


-- 22) Alterar o item do acervo com código 9 para o título ou nome “Um amor para toda a vida”, editora “Céu Azul” e código de barras “7891234567890”;
update acervo
set titulo = 'Um Amor para toda a vida', editora = 'Céu Azul', codigo_barras = '7891234567890'
where id_acervo = 9;

-- 23) Alterar o status (desabilitar) os leitores que tenham e-mail “@estudante.sesisenai.org.br”;
update usuario
set status_usuario = 'Desabilitado'
where id_usuario > 0 and email like'%@estudante.sesisenai.org.br';

-- 24) Consultar os leitores que estejam desabilitados, tenham o e-mail @estudante.sesisenai.org.br e residam em um das cidades de Florianópolis, Criciúma, Jaraguá do Sul ou Lages.
select * from usuario 
where status_usuario ='Desabilitado' and email like '%@estudante.sesisenai.org.br'
and cidade in ('Florianópolis', 'Criciúma', 'Jaraguá do sul', 'Lages')

