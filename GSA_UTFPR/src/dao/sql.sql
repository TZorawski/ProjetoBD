CREATE DATABASE gsa_utfpr;


CREATE TABLE Cursos(
sigla char(5),
nome char(100),
PRIMARY KEY(sigla));

CREATE TABLE Evento (
sigla char(5), 
nome char(200), 
dataInicio DATE, 
dataFim DATE, 
curso char(5), 
PRIMARY KEY(sigla), FOREIGN KEY(curso) REFERENCES Cursos(sigla));