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

-- criando a table médico
create table if not exists medico(
id_medico int primary key auto_increment,
nome varchar(100) not null,
crm varchar(12) not null unique,
especialidade varchar(45) not null,
telefone varchar(15) not null
);

-- criando table consulta
create table if not exists consulta(
id_consulta int primary key auto_increment,
data_consulta datetime not null,
motivo_consulta varchar(255),
diagnostico varchar(255),
prescricao varchar(255),
id_paciente int not null,
id_medico int not null,
constraint fk_consulta_paciente
	foreign key(id_paciente) references paciente(id_paciente),
constraint fk_consulta_medico
	foreign key(id_medico) references medico(id_medico)
);

-- criando a table Receita
create table if not exists receita(
id_receita int primary key auto_increment,
data_emissao date not null,
medicamentos varchar(512),
dosagem varchar(100),
id_consulta int not null,
constraint fk_receita_consulta
	foreign key(id_consulta) references consulta(id_consulta)
);

-- criando a table Exame
create table if not exists exame(
id_exame int primary key auto_increment,
nome_exame varchar(45) not null unique,
data_exame datetime not null,
resultado varchar(512) not null,
id_consulta int not null,
id_medico int not null,
constraint fk_exame_consulta
	foreign key(id_consulta) references consulta(id_consulta),
constraint fk_exame_medico
	foreign key(id_medico) references medico(id_medico)
);

-- criando a table Enfermagem
create table if not exists enfermagem(
id_enfermeiro int primary key auto_increment,
nome varchar(100) not null,
coren varchar(15) not null unique,
setor varchar(45),
telefone varchar(15)
);

-- criando a table Internação
create table if not exists internacao(
id_internacao int primary key auto_increment,
data_entrada datetime not null,
data_saida datetime not null,
quarto int not null unique,
diagnostico varchar(1024) not null,
id_paciente int not null,
id_medico int not null,
id_enfermeiro int not null,
constraint fk_internacao_paciente
	foreign key(id_paciente) references paciente(id_paciente),
constraint fk_internacao_medico 
	foreign key(id_medico)  references medico(id_medico),
constraint fk_internacao_enfermeiro
	foreign key(id_enfermeiro) references enfermagem(id_enfermeiro)
);

-- criando a table Fatura
create table if not exists fatura(
id_fatura int primary key auto_increment,
data_emissao datetime not null,
valor_total decimal(6,2),
id_paciente int not null,
id_consulta int not null,
id_internacao int not null,
constraint fk_fatura_paciente
	foreign key(id_paciente) references paciente(id_paciente),
constraint fk_fatura_consulta
	foreign key(id_consulta) references consulta(id_consulta),
constraint fk_fatura_internacao
	foreign key(id_internacao) references internacao(id_internacao)
);

-- criando a table Fornecedor
create table if not exists Fornecedor(
id_fornecedor int primary key auto_increment,
nome varchar(100) not null,
cnpj varchar(18) not null unique,
telefone varchar(15) not null unique,
endereco varchar(200) not null unique
);

-- criando a table Procedimento
create table if not exists procedimento(
id_procedimento int primary key auto_increment,
nome_procedimento varchar(100),
descricao varchar(512),
custo decimal(6,2),
id_medico int not null,
id_internacao int not null,
constraint fk_procedimento_medico
	foreign key(id_medico) references medico(id_medico),
constraint fk_procedimento_internacao
	foreign key(id_internacao) references internacao(id_internacao)
);

-- criando a  table Fornecimento_Procedimento
create table if not exists fornecimento_procedimento(
id_fornecedor int not null,
id_procedimento int not null,
constraint fk_fornecedor
	foreign key(id_fornecedor) references fornecedor(id_fornecedor),
constraint fk_procedimento
	foreign key(id_procedimento) references procedimento(id_procedimento)
);

-- inserindo dados na tabela paciente
INSERT INTO paciente (nome, cpf, data_nascimento, endereco, telefone, sexo, email) VALUES
('João Silva', '169.696.789-00', '1980-01-15', 'Rua A, 123, Bairro B', '(11) 91234-5678', 'M', 'joaodsds.silva@gmail.com'),
('Maria Souza', '238.567.890-11', '1992-02-20', 'Rua C, 456, Bairro D', '(21) 92345-6789', 'F', 'mariana.souza@email.com'),
('Carlos Pereira', '395.678.901-22', '1975-03-25', 'Rua E, 789, Bairro F', '(31) 93456-7890', 'M', 'carlos.pereira@email.com'),
('Ana Costa', '456.789.012-33', '1985-04-30', 'Rua G, 101, Bairro H', '(41) 94567-8901', 'F', 'ana.costa@email.com'),
('Felipe Nunes', '789.012.345-66', '1999-05-05', 'Rua J, 141, Bairro K', '(61) 95678-0123', 'M', 'felipe.nunes@email.com'),
('Fernanda Almeida', '890.123.456-77', '1990-06-10', 'Rua L, 151, Bairro M', '(71) 96789-1234', 'F', 'fernanda.almeida@email.com'),
('Ricardo Lima', '901.234.567-88', '1987-07-15', 'Rua N, 161, Bairro O', '(81) 97890-2345', 'M', 'ricardo.lima@email.com'),
('Juliana Oliveira', '012.345.678-99', '1995-08-20', 'Rua P, 171, Bairro Q', '(91) 98901-3456', 'F', 'juliana.oliveira@email.com'),
('Paulo Ribeiro', '131.222.333-44', '1978-09-25', 'Rua R, 181, Bairro S', '(51) 99012-4567', 'M', 'paulo.ribeiro@email.com'),
('Mariana Lima', '222.333.444-55', '1983-10-30', 'Rua T, 191, Bairro U', '(61) 90123-5678', 'F', 'mariana.lima@email.com'),

('Lucas Martins', '333.444.555-66', '1989-01-10', 'Rua V, 201, Bairro W', '(71) 91234-6789', 'M', 'lucas.martins@email.com'),
('Gabriela Mendes', '444.555.666-77', '1991-02-15', 'Rua X, 211, Bairro Y', '(81) 92345-7890', 'F', 'gabriela.mendes@email.com'),
('Thiago Barbosa', '555.666.777-88', '1976-03-20', 'Rua Z, 221, Bairro AA', '(91) 93456-8901', 'M', 'thiago.barbosa@email.com'),
('Rafaela Araújo', '666.777.888-99', '1982-04-25', 'Rua AB, 231, Bairro AC', '(11) 94567-9012', 'F', 'rafaela.araujo@email.com'),
('Bruno Rocha', '777.888.999-00', '1994-05-30', 'Rua AD, 241, Bairro AE', '(21) 95678-0123', 'M', 'bruno.rocha@email.com'),
('Larissa Santos', '888.999.000-11', '1996-06-05', 'Rua AF, 251, Bairro AG', '(31) 96789-1234', 'F', 'larissa.santos@email.com'),
('Rafael Correia', '999.000.111-22', '1981-07-10', 'Rua AH, 261, Bairro AI', '(41) 97890-2345', 'M', 'rafael.correia@email.com'),
('Patrícia Silva', '000.121.222-33', '1979-08-15', 'Rua AJ, 271, Bairro AK', '(51) 98901-3456', 'F', 'patricia.silva@email.com'),
('Diego Carvalho', '171.212.333-44', '1984-09-20', 'Rua AL, 281, Bairro AM', '(61) 99012-4567', 'M', 'diego.carvalho@email.com'),
('Isabela Gomes', '222.343.444-55', '1993-10-25', 'Rua AN, 291, Bairro AO', '(71) 90123-5678', 'F', 'isabela.gomes@email.com'),

('Eduardo Lima', '373.444.555-66', '1988-01-10', 'Rua AP, 301, Bairro AQ', '(81) 91234-6789', 'M', 'eduardo.lima@email.com'),
('Beatriz Costa', '484.555.666-77', '1997-02-15', 'Rua AR, 311, Bairro AS', '(91) 92345-7890', 'F', 'beatriz.costa@email.com'),
('Leonardo Alves', '595.666.777-88', '1983-03-20', 'Rua AT, 321, Bairro AU', '(11) 93456-8901', 'M', 'leonardo.alves@email.com'),
('Camila Ferreira', '606.777.888-99', '1986-04-25', 'Rua AV, 331, Bairro AW', '(21) 94567-9012', 'F', 'camila.ferreira@email.com'),
('Guilherme Santos', '717.888.999-00', '1995-05-30', 'Rua AX, 341, Bairro AY', '(31) 95678-0123', 'M', 'guilherme.santos@email.com'),
('Amanda Rodrigues', '828.999.000-11', '1980-06-05', 'Rua AZ, 351, Bairro BA', '(41) 96789-1234', 'F', 'amanda.rodrigues@email.com'),
('Rodrigo Melo', '939.000.111-22', '1991-07-10', 'Rua BB, 361, Bairro BC', '(51) 97890-2345', 'M', 'rodrigo.melo@email.com'),
('Vanessa Souza', '040.111.222-33', '1977-08-15', 'Rua BD, 371, Bairro BE', '(61) 98901-3456', 'F', 'vanessa.souza@email.com'),
('Marcos Pinto', '111.322.333-44', '1985-09-20', 'Rua BF, 381, Bairro BG', '(71) 99012-4567', 'M', 'marcos.pinto@email.com'),
('Juliana Braga', '222.353.444-55', '1990-10-25', 'Rua BH, 391, Bairro BI', '(81) 90123-5678', 'F', 'juliana.braga@email.com'),

('Antonio Nascimento', '333.464.555-66', '1987-01-10', 'Rua BJ, 401, Bairro BK', '(91) 91234-6789', 'M', 'antonio.nascimento@email.com'),
('Renata Figueiredo', '444.575.666-77', '1984-02-15', 'Rua BL, 411, Bairro BM', '(11) 92345-7890', 'F', 'renata.figueiredo@email.com'),
('Bruno Oliveira', '555.686.777-88', '1982-03-20', 'Rua BN, 421, Bairro BO', '(21) 93456-8901', 'M', 'bruno.oliveira@email.com'),
('Carla Mendes', '666.779.888-99', '1989-04-25', 'Rua BP, 431, Bairro BQ', '(31) 94567-9012', 'F', 'carla.mendes@email.com'),
('Fábio Silva', '777.888.299-00', '1996-05-30', 'Rua BR, 441, Bairro BS', '(41) 95678-0123', 'M', 'fabio.silva@email.com'),
('Letícia Moreira', '888.939.000-11', '1981-06-05', 'Rua BT, 451, Bairro BU', '(51) 96789-1234', 'F', 'leticia.moreira@email.com'),
('André Costa', '999.000.131-22', '1985-07-10', 'Rua BV, 461, Bairro BW', '(61) 97890-2345', 'M', 'andre.costa@email.com'),
('Natália Santos', '000.311.222-33', '1994-08-15', 'Rua BX, 471, Bairro BY', '(71) 98901-3456', 'F', 'natalia.santos@email.com'),
('Fernando Rocha', '111.223.333-44', '1986-09-20', 'Rua BZ, 481, Bairro CA', '(81) 99012-4567', 'M', 'fernando.rocha@email.com'),
('Carolina Carvalho', '322.333.444-55', '1992-10-25', 'Rua CB, 491, Bairro CC', '(91) 90123-5678', 'F', 'carolina.carvalho@email.com'),

('José Cardoso', '333.444.535-66', '1980-01-10', 'Rua CD, 501, Bairro CE', '(11) 91234-6789', 'M', 'jose.cardoso@email.com'),
('Roberta Lima', '444.555.646-77', '1988-02-15', 'Rua CF, 511, Bairro CG', '(21) 92345-7890', 'F', 'roberta.lima@email.com'),
('Pedro Marques', '555.666.477-88', '1979-03-20', 'Rua CH, 521, Bairro CI', '(31) 93456-8901', 'M', 'pedro.marques@email.com'),
('Claudia Ferreira', '666.777.588-99', '1993-04-25', 'Rua CJ, 531, Bairro CK', '(41) 94567-9012', 'F', 'claudia.ferreira@email.com'),
('Daniel Souza', '777.888.399-00', '1982-05-30', 'Rua CL, 541, Bairro CM', '(51) 95678-0123', 'M', 'daniel.souza@email.com'),
('Aline Correia', '888.999.500-11', '1984-06-05', 'Rua CN, 551, Bairro CO', '(61) 96789-1234', 'F', 'aline.correia@email.com'),
('Matheus Alves', '999.000.611-22', '1991-07-10', 'Rua CP, 561, Bairro CQ', '(71) 97890-2345', 'M', 'matheus.alves@email.com'),
('Fernanda Pereira', '000.111.223-33', '1995-08-15', 'Rua CR, 571, Bairro CS', '(81) 98901-3456', 'F', 'fernanda.pereira@email.com'),
('Lucas Andrade', '111.222.633-44', '1987-09-20', 'Rua CT, 581, Bairro CU', '(91) 99012-4567', 'M', 'lucas.andrade@email.com'),
('Bianca Oliveira', '222.333.464-55', '1983-10-25', 'Rua CV, 591, Bairro CW', '(11) 90123-5678', 'F', 'bianca.oliveira@email.com'),

('Maurício Campos', '333.444.556-66', '1978-01-10', 'Rua CX, 601, Bairro CY', '(21) 91234-6789', 'M', 'mauricio.campos@email.com'),
('Simone Almeida', '444.555.676-77', '1986-02-15', 'Rua CZ, 611, Bairro DA', '(31) 92345-7890', 'F', 'simone.almeida@email.com'),
('Alexandre Melo', '555.666.787-88', '1990-03-20', 'Rua DB, 621, Bairro DC', '(41) 93456-8901', 'M', 'alexandre.melo@email.com'),
('Tatiane Barbosa', '666.777.889-99', '1997-04-25', 'Rua DD, 631, Bairro DE', '(51) 94567-9012', 'F', 'tatiane.barbosa@email.com'),
('Gustavo Ferreira', '777.888.999-10', '1981-05-30', 'Rua DF, 641, Bairro DG', '(61) 95678-0123', 'M', 'gustavo.ferreira@email.com'),
('Adriana Souza', '888.999.000-21', '1992-06-05', 'Rua DH, 651, Bairro DI', '(71) 96789-1234', 'F', 'adriana.souza@email.com'),
('Marcelo Oliveira', '999.000.111-42', '1976-07-10', 'Rua DJ, 661, Bairro DK', '(81) 97890-2345', 'M', 'marcelo.oliveira@email.com'),
('Tatiana Nunes', '000.111.222-63', '1985-08-15', 'Rua DL, 671, Bairro DM', '(91) 98901-3456', 'F', 'tatiana.nunes@email.com'),
('Roberto Costa', '111.222.333-54', '1989-09-20', 'Rua DN, 681, Bairro DO', '(11) 99012-4567', 'M', 'roberto.costa@email.com'),
('Carla Martins', '222.333.444-45', '1994-10-25', 'Rua DP, 691, Bairro DQ', '(21) 90123-5678', 'F', 'carla.martins@email.com'),

('Gustavo Ferreira', '012.345.678-91', '1982-05-30', 'Rua DR, 701, Bairro DS', '(21) 91234-6789', 'M', 'gustavoga.ferreira@email.com'),
('Natália Rodrigues', '123.456.789-02', '1994-06-10', 'Rua DT, 711, Bairro DU', '(31) 92345-7890', 'F', 'natalia.rodrigues@email.com'),
('Fábio Mendes', '234.567.890-13', '1981-07-20', 'Rua DV, 721, Bairro DW', '(41) 93456-8901', 'M', 'fabio.mendes@email.com'),
('Camila Santos', '345.678.901-24', '1986-08-30', 'Rua DX, 731, Bairro DY', '(51) 94567-9012', 'F', 'camila.santos@email.com'),
('Rafael Lima', '456.789.012-35', '1989-09-10', 'Rua DZ, 741, Bairro EA', '(61) 95678-0123', 'M', 'rafael.lima@email.com'),
('Larissa Oliveira', '567.890.123-46', '1995-10-20', 'Rua EB, 751, Bairro EC', '(71) 96789-1234', 'F', 'larissa.oliveira@email.com'),
('Thiago Martins', '678.901.234-57', '1983-11-30', 'Rua ED, 761, Bairro EE', '(81) 97890-2345', 'M', 'thiago.martins@email.com'),
('Mariana Almeida', '789.012.345-68', '1984-12-10', 'Rua EF, 771, Bairro EG', '(91) 98901-3456', 'F', 'mariana.almeida@email.com'),
('Lucas Souza', '890.123.456-79', '1992-01-20', 'Rua EH, 781, Bairro EI', '(11) 99012-4567', 'M', 'lucas.souza@email.com'),
('Renata Costa', '901.234.567-80', '1978-02-28', 'Rua EJ, 791, Bairro EK', '(21) 90123-5678', 'F', 'renata.costa@email.com'),

('Carlos Ribeiro', '012.345.678-81', '1987-03-15', 'Rua EL, 801, Bairro EM', '(31) 91234-6789', 'M', 'carlos.ribeiro@email.com'),
('Beatriz Gomes', '123.456.789-82', '1996-04-25', 'Rua EN, 811, Bairro EO', '(41) 92345-7890', 'F', 'beatriz.gomes@email.com'),
('Rodrigo Oliveira', '234.567.890-83', '1985-05-10', 'Rua EP, 821, Bairro EQ', '(51) 93456-8901', 'M', 'rodrigo.oliveira@email.com'),
('Aline Souza', '345.678.901-84', '1988-06-18', 'Rua ER, 831, Bairro ES', '(61) 94567-9012', 'F', 'aline.souza@email.com'),
('Felipe Silva', '456.789.012-85', '1980-07-22', 'Rua ET, 841, Bairro EU', '(71) 95678-0123', 'M', 'felipe.silva@email.com'),
('Juliana Santos', '567.890.123-86', '1990-08-30', 'Rua EV, 851, Bairro EW', '(81) 96789-1234', 'F', 'juliana.santos@email.com'),
('Ricardo Alves', '678.901.234-87', '1993-09-10', 'Rua EX, 861, Bairro EY', '(91) 97890-2345', 'M', 'ricardo.alves@email.com'),
('Ana Carvalho', '789.012.345-88', '1992-10-22', 'Rua EZ, 871, Bairro FA', '(11) 98901-3456', 'F', 'ana.carvalho@email.com'),
('João Silva', '890.123.456-89', '1981-11-30', 'Rua FB, 881, Bairro FC', '(21) 99012-4567', 'M', 'joao.silva@email.com'),
('Sofia Lima', '901.234.567-90', '1987-12-10', 'Rua FD, 891, Bairro FE', '(31) 90123-5678', 'F', 'sofia.lima@email.com'),

('Eduardo Souza', '012.345.678-92', '1990-01-20', 'Rua FF, 901, Bairro FG', '(41) 91234-6789', 'M', 'eduardo.souza@email.com'),
('Tatiana Oliveira', '123.456.789-93', '1982-02-28', 'Rua FH, 911, Bairro FI', '(51) 92345-7890', 'F', 'tatiana.oliveira@email.com'),
('Bruno Lima', '234.567.890-94', '1991-03-15', 'Rua FJ, 921, Bairro FK', '(61) 93456-8901', 'M', 'bruno.lima@email.com'),
('Patrícia Gomes', '345.678.901-95', '1989-04-25', 'Rua FL, 931, Bairro FM', '(71) 94567-9012', 'F', 'patricia.gomes@email.com'),
('Vinícius Martins', '456.789.012-96', '1985-05-10', 'Rua FN, 941, Bairro FO', '(81) 95678-0123', 'M', 'vinicius.martins@email.com'),
('Gabriela Alves', '567.890.123-97', '1993-06-18', 'Rua FP, 951, Bairro FQ', '(91) 96789-1234', 'F', 'gabriela.alves@email.com'),
('Pedro Souza', '678.901.234-98', '1979-07-22', 'Rua FR, 961, Bairro FS', '(11) 97890-2345', 'M', 'pedro.souza@email.com'),
('Luciana Santos', '789.012.345-99', '1994-08-30', 'Rua FT, 971, Bairro FU', '(21) 98901-3456', 'F', 'luciana.santos@email.com'),
('André Oliveira', '890.123.456-00', '1996-09-10', 'Rua FV, 981, Bairro FW', '(31) 99012-4567', 'M', 'andre.oliveira@email.com'),
('Mariana Silva', '901.234.567-01', '1995-10-22', 'Rua FX, 991, Bairro FY', '(41) 90123-5678', 'F', 'mariana.silva@email.com'),

('Henrique Souza', '012.345.678-03', '1987-11-30', 'Rua FZ, 1001, Bairro GA', '(51) 91234-6789', 'M', 'henrique.souza@email.com'),
('Daniela Costa', '123.456.789-04', '1988-12-10', 'Rua GB, 1011, Bairro GC', '(61) 92345-7890', 'F', 'daniela.costa@email.com'),
('Marcelo Lima', '234.567.890-05', '1980-01-20', 'Rua GD, 1021, Bairro GE', '(71) 93456-8901', 'M', 'marcelo.lima@email.com'),
('Vanessa Santos', '345.678.901-06', '1989-02-28', 'Rua GF, 1031, Bairro GG', '(81) 94567-9012', 'F', 'vanessa.santos@email.com'),
('Renato Oliveira', '456.789.012-07', '1978-03-15', 'Rua GH, 1041, Bairro GI', '(91) 95678-0123', 'M', 'renato.oliveira@email.com'),
('Priscila Gomes', '567.890.123-08', '1997-04-25', 'Rua GJ, 1051, Bairro GK', '(11) 96789-1234', 'F', 'priscila.gomes@email.com'),
('Carlos Almeida', '678.901.234-09', '1981-05-10', 'Rua GL, 1061, Bairro GM', '(21) 97890-2345', 'M', 'carlos.almeida@email.com');

INSERT INTO medico (nome, crm, especialidade, telefone) VALUES
('Dr. João Silva', '1234567890', 'Cardiologia', '(11) 99999-0001'),
('Dra. Maria Oliveira', '1234567891', 'Pediatria', '(11) 99999-0002'),
('Dr. Carlos Santos', '1234567892', 'Ortopedia', '(11) 99999-0003'),
('Dra. Ana Souza', '1234567893', 'Neurologia', '(11) 99999-0004'),
('Dr. Pedro Almeida', '1234567894', 'Dermatologia', '(11) 99999-0005'),
('Dra. Fernanda Lima', '1234567895', 'Ginecologia', '(11) 99999-0006'),
('Dr. Marcos Pereira', '1234567896', 'Oftalmologia', '(11) 99999-0007'),
('Dra. Laura Costa', '1234567897', 'Otorrinolaringologia', '(11) 99999-0008'),
('Dr. Rafael Martins', '1234567898', 'Gastroenterologia', '(11) 99999-0009'),
('Dra. Beatriz Carvalho', '1234567899', 'Endocrinologia', '(11) 99999-0010'),
('Dr. Gustavo Oliveira', '1234567800', 'Urologia', '(11) 99999-0011'),
('Dra. Claudia Rocha', '1234567801', 'Reumatologia', '(11) 99999-0012'),
('Dr. André Silva', '1234567802', 'Oncologia', '(11) 99999-0013'),
('Dra. Juliana Santos', '1234567803', 'Pneumologia', '(11) 99999-0014'),
('Dr. Felipe Costa', '1234567804', 'Cirurgia Geral', '(11) 99999-0015'),
('Dra. Mariana Almeida', '1234567805', 'Psiquiatria', '(11) 99999-0016'),
('Dr. Daniel Pereira', '1234567806', 'Hematologia', '(11) 99999-0017'),
('Dra. Natália Martins', '1234567807', 'Nefrologia', '(11) 99999-0018'),
('Dr. Alexandre Souza', '1234567808', 'Angiologia', '(11) 99999-0019'),
('Dra. Priscila Lima', '1234567809', 'Medicina de Família', '(11) 99999-0020'),
('Dr. Tiago Carvalho', '1234567810', 'Medicina do Trabalho', '(11) 99999-0021'),
('Dra. Camila Rocha', '1234567811', 'Cirurgia Plástica', '(11) 99999-0022'),
('Dr. Eduardo Silva', '1234567812', 'Cirurgia Cardiovascular', '(11) 99999-0023'),
('Dra. Roberta Oliveira', '1234567813', 'Geriatria', '(11) 99999-0024'),
('Dr. Igor Santos', '1234567814', 'Patologia', '(11) 99999-0025'),
('Dra. Larissa Almeida', '1234567815', 'Medicina Intensiva', '(11) 99999-0026'),
('Dr. Leandro Costa', '1234567816', 'Medicina Nuclear', '(11) 99999-0027'),
('Dra. Simone Martins', '1234567817', 'Medicina Preventiva', '(11) 99999-0028'),
('Dr. Bruno Pereira', '1234567818', 'Medicina Legal', '(11) 99999-0029'),
('Dra. Tânia Lima', '1234567819', 'Medicina Esportiva', '(11) 99999-0030'),
('Dr. Renato Carvalho', '1234567820', 'Medicina do Trânsito', '(11) 99999-0031'),
('Dra. Vanessa Rocha', '1234567821', 'Medicina de Urgência', '(11) 99999-0032'),
('Dr. Hugo Silva', '1234567822', 'Medicina do Sono', '(11) 99999-0033'),
('Dra. Fabiana Santos', '1234567823', 'Medicina Tropical', '(11) 99999-0034'),
('Dr. Marcos Almeida', '1234567824', 'Medicina Vascular', '(11) 99999-0035'),
('Dra. Patricia Costa', '1234567825', 'Medicina Intervencionista', '(11) 99999-0036'),
('Dr. Alexandre Oliveira', '1234567826', 'Medicina Cardiovascular', '(11) 99999-0037'),
('Dra. Juliana Lima', '1234567827', 'Medicina de Reabilitação', '(11) 99999-0038'),
('Dr. Fernando Rocha', '1234567828', 'Medicina de Emergência', '(11) 99999-0039'),
('Dra. Aline Pereira', '1234567829', 'Medicina Integrativa', '(11) 99999-0040'),
('Dr. Paulo Costa', '1234567830', 'Medicina de Família e Comunidade', '(11) 99999-0041'),
('Dra. Patrícia Martins', '1234567831', 'Medicina do Adolescente', '(11) 99999-0042'),
('Dr. Rafael Oliveira', '1234567832', 'Medicina do Envelhecimento', '(11) 99999-0043'),
('Dra. Viviane Almeida', '1234567833', 'Medicina de Cuidados Paliativos', '(11) 99999-0044'),
('Dr. Eduardo Costa', '1234567834', 'Medicina Reprodutiva', '(11) 99999-0045'),
('Dra. Débora Silva', '1234567835', 'Medicina Estética', '(11) 99999-0046'),
('Dr. Fábio Rocha', '1234567836', 'Medicina de Alergias', '(11) 99999-0047'),
('Dra. Gabriela Santos', '1234567837', 'Medicina de Dor', '(11) 99999-0048'),
('Dr. Marcelo Almeida', '1234567838', 'Medicina de Tuberculose', '(11) 99999-0049'),
('Dra. Larissa Oliveira', '1234567839', 'Medicina de Saúde Pública', '(11) 99999-0050');

INSERT INTO enfermagem (nome, coren, setor, telefone) VALUES
('Ana Paula Silva', '123456789', 'Pediatria', '(11) 99999-0101'),
('Carlos Eduardo Oliveira', '123456790', 'Cardiologia', '(11) 99999-0102'),
('Maria Fernanda Santos', '123456791', 'Neurologia', '(11) 99999-0103'),
('Juliana Costa', '123456792', 'Dermatologia', '(11) 99999-0104'),
('Pedro Henrique Lima', '123456793', 'Ginecologia', '(11) 99999-0105'),
('Tatiane Souza', '123456794', 'Ortopedia', '(11) 99999-0106'),
('Roberta Almeida', '123456795', 'Oftalmologia', '(11) 99999-0107'),
('Felipe Martins', '123456796', 'Otorrinolaringologia', '(11) 99999-0108'),
('Simone Rocha', '123456797', 'Gastroenterologia', '(11) 99999-0109'),
('Leonardo Silva', '123456798', 'Endocrinologia', '(11) 99999-0110'),
('Mariana Costa', '123456799', 'Urologia', '(11) 99999-0111'),
('Julio Pereira', '123456800', 'Reumatologia', '(11) 99999-0112'),
('Danielle Almeida', '123456801', 'Oncologia', '(11) 99999-0113'),
('Anderson Lima', '123456802', 'Pneumologia', '(11) 99999-0114'),
('Luciana Martins', '123456803', 'Cirurgia Geral', '(11) 99999-0115'),
('Ricardo Oliveira', '123456804', 'Psiquiatria', '(11) 99999-0116'),
('Fernanda Rocha', '123456805', 'Hematologia', '(11) 99999-0117'),
('Bruno Costa', '123456806', 'Nefrologia', '(11) 99999-0118'),
('Isabela Pereira', '123456807', 'Angiologia', '(11) 99999-0119'),
('Rodrigo Silva', '123456808', 'Medicina de Família', '(11) 99999-0120'),
('Júlia Santos', '123456809', 'Medicina do Trabalho', '(11) 99999-0121'),
('Lucas Almeida', '123456810', 'Cirurgia Plástica', '(11) 99999-0122'),
('Marcela Costa', '123456811', 'Cirurgia Cardiovascular', '(11) 99999-0123'),
('Andréia Lima', '123456812', 'Geriatria', '(11) 99999-0124'),
('Vinícius Silva', '123456813', 'Patologia', '(11) 99999-0125'),
('Sabrina Rocha', '123456814', 'Medicina Intensiva', '(11) 99999-0126'),
('Gabriel Martins', '123456815', 'Medicina Nuclear', '(11) 99999-0127'),
('Amanda Costa', '123456816', 'Medicina Preventiva', '(11) 99999-0128'),
('Tiago Pereira', '123456817', 'Medicina Legal', '(11) 99999-0129'),
('Larissa Silva', '123456818', 'Medicina Esportiva', '(11) 99999-0130'),
('Rafael Oliveira', '123456819', 'Medicina do Trânsito', '(11) 99999-0131'),
('Cláudia Almeida', '123456820', 'Medicina de Urgência', '(11) 99999-0132'),
('Henrique Costa', '123456821', 'Medicina do Sono', '(11) 99999-0133'),
('Patrícia Martins', '123456822', 'Medicina Tropical', '(11) 99999-0134'),
('Eduardo Santos', '123456823', 'Medicina Vascular', '(11) 99999-0135'),
('Aline Rocha', '123456824', 'Medicina Intervencionista', '(11) 99999-0136'),
('Matheus Pereira', '123456825', 'Medicina Cardiovascular', '(11) 99999-0137'),
('Mariana Silva', '123456826', 'Medicina de Reabilitação', '(11) 99999-0138'),
('Jorge Almeida', '123456827', 'Medicina de Emergência', '(11) 99999-0139'),
('Carolina Costa', '123456828', 'Medicina Integrativa', '(11) 99999-0140'),
('Felipe Rocha', '123456829', 'Medicina de Família e Comunidade', '(11) 99999-0141'),
('Paula Martins', '123456830', 'Medicina do Adolescente', '(11) 99999-0142'),
('Lucas Oliveira', '123456831', 'Medicina do Envelhecimento', '(11) 99999-0143'),
('Tais Santos', '123456832', 'Medicina de Cuidados Paliativos', '(11) 99999-0144'),
('Gustavo Silva', '123456833', 'Medicina Reprodutiva', '(11) 99999-0145'),
('Marina Costa', '123456834', 'Medicina Estética', '(11) 99999-0146'),
('Vitor Pereira', '123456835', 'Medicina de Alergias', '(11) 99999-0147'),
('Rafaela Almeida', '123456836', 'Medicina de Dor', '(11) 99999-0148'),
('Tiago Martins', '123456837', 'Medicina de Tuberculose', '(11) 99999-0149'),
('Juliana Silva', '123456838', 'Medicina de Saúde Pública', '(11) 99999-0150');

