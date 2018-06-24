CREATE DATABASE gsa_utfpr;


CREATE TABLE Cursos(
sigla char(5),
nome char(100),
PRIMARY KEY(sigla));

CREATE TABLE Eventos (
sigla char(5), 
nome char(200), 
data_inicio DATE, 
data_fim DATE, 
cursos_sigla char(5), 
PRIMARY KEY(sigla), FOREIGN KEY(cursos_sigla) REFERENCES Cursos(sigla));