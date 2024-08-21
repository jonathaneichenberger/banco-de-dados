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


