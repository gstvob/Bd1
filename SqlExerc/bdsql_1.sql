CREATE DATABASE Clinica;

CREATE TABLE Ambulatorios (
	nroa INT,
	andar NUMERIC(3) NOT NULL,
	capacidade SMALLINT,
	PRIMARY KEY(nroa)
);

CREATE TABLE Medicos (
	codm INT,
	nome VARCHAR(40) NOT NULL,
	idade SMALLINT NOT NULL,
	especialidade CHAR(20),
	CPF NUMERIC(11) UNIQUE,
	cidade VARCHAR(30),
	nroa INT,
	PRIMARY KEY(codm),
	FOREIGN KEY(nroa) REFERENCES Ambulatorios(nroa)
);

CREATE TABLE Pacientes (
	codp INT,
	nome VARCHAR(40) NOT NULL,
	idade SMALLINT NOT NULL,
	cidade CHAR(30),
	CPF NUMERIC(11) UNIQUE,
	doenca VARCHAR(40) NOT NULL,
	PRIMARY KEY(codp)
);

CREATE TABLE Funcionarios (
	codf INT,
	nome varchar(40) not null,
	idade SMALLINT,
	CPF numeric(11) UNIQUE,
	cidade varchar(30),
	salario numeric(10),
	cargo varchar(20),
	primary key (codf)
);

CREATE TABLE Consultas (
	codm int,
	codp int,
	data date,
	hora time,
	primary key(codm, codp, data),
	foreign key (codm) references Medicos(codm),
	foreign key (codp) references Pacientes(codp)
);


ALTER TABLE Funcionarios ADD COLUMN nroa int;
ALTER TABLE Funcionarios ADD FOREIGN KEY (nroa) REFERENCES Ambulatorios(nroa);
CREATE UNIQUE INDEX medicos_nroa_idx ON Medicos (nroa);
CREATE INDEX pacientes_doenca_idx ON Pacientes(doenca);
DROP INDEX medicos_nroa_idx;
DROP INDEX pacientes_doenca_idx;
ALTER TABLE Funcionarios DROP COLUMN cargo;
ALTER TABLE Funcionarios DROP COLUMN nroa;