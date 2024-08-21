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