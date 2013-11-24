
/* Drop Tables */

DROP TABLE IF EXISTS Contenido;
DROP TABLE IF EXISTS Planificacion;
DROP TABLE IF EXISTS Profesor;
DROP TABLE IF EXISTS new_table;
DROP TABLE IF EXISTS Carrera;
DROP TABLE IF EXISTS Escuela;
DROP TABLE IF EXISTS Departamento;
DROP TABLE IF EXISTS Facultad;
DROP TABLE IF EXISTS Ramo;




/* Create Tables */

CREATE TABLE Facultad
(
	Id_Facultad int NOT NULL UNIQUE,
	Nombre char,
	PRIMARY KEY (Id_Facultad)
) WITHOUT OIDS;


CREATE TABLE Departamento
(
	Id_Departamento int NOT NULL UNIQUE,
	Nombre char,
	Id_Facultad int NOT NULL UNIQUE,
	PRIMARY KEY (Id_Departamento)
) WITHOUT OIDS;


CREATE TABLE Escuela
(
	Id_Escuela int NOT NULL UNIQUE,
	Nombre char,
	Id_Departamento int NOT NULL UNIQUE,
	PRIMARY KEY (Id_Escuela)
) WITHOUT OIDS;


CREATE TABLE Carrera
(
	Codigo int NOT NULL UNIQUE,
	Nombre char,
	Id_Escuela int NOT NULL UNIQUE,
	PRIMARY KEY (Codigo)
) WITHOUT OIDS;


CREATE TABLE Ramo
(
	Cod_Ramo int NOT NULL UNIQUE,
	Nombre char,
	Semestre int,
	PRIMARY KEY (Cod_Ramo)
) WITHOUT OIDS;


CREATE TABLE Profesor
(
	Rut varchar NOT NULL UNIQUE,
	Nombre char,
	Apellido_Paterno char,
	Apellido_Materno char,
	Id_Escuela int NOT NULL UNIQUE,
	PRIMARY KEY (Rut)
) WITHOUT OIDS;


CREATE TABLE Planificacion
(
	Cod_Clasificacion int NOT NULL UNIQUE,
	Rut varchar NOT NULL UNIQUE,
	Objetivo text,
	Estrategia text,
	Fecha date,
	Semestre int,
	PRIMARY KEY (Cod_Clasificacion)
) WITHOUT OIDS;


CREATE TABLE new_table
(
	Cod_Ramo int NOT NULL UNIQUE,
	Codigo int NOT NULL UNIQUE
) WITHOUT OIDS;


CREATE TABLE Contenido
(
	Codigo int NOT NULL UNIQUE,
	Semana serial NOT NULL,
	Objetivo text,
	Contenido text,
	Evaluacion text,
	PRIMARY KEY (Codigo)
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE Departamento
	ADD FOREIGN KEY (Id_Facultad)
	REFERENCES Facultad (Id_Facultad)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Escuela
	ADD FOREIGN KEY (Id_Departamento)
	REFERENCES Departamento (Id_Departamento)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Profesor
	ADD FOREIGN KEY (Id_Escuela)
	REFERENCES Escuela (Id_Escuela)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Carrera
	ADD FOREIGN KEY (Id_Escuela)
	REFERENCES Escuela (Id_Escuela)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE new_table
	ADD FOREIGN KEY (Codigo)
	REFERENCES Carrera (Codigo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE new_table
	ADD FOREIGN KEY (Cod_Ramo)
	REFERENCES Ramo (Cod_Ramo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Planificacion
	ADD FOREIGN KEY (Rut)
	REFERENCES Profesor (Rut)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Contenido
	ADD FOREIGN KEY (Codigo)
	REFERENCES Planificacion (Cod_Clasificacion)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



