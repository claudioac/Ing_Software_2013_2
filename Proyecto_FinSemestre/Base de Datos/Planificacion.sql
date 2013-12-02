
/* Create Database */





CREATE DATABASE "Planificacion"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'es_ES.UTF-8'
       LC_CTYPE = 'es_ES.UTF-8'
       CONNECTION LIMIT = -1;



/* Create Tables */

CREATE TABLE Escuela
(
	Id_Escuela int NOT NULL UNIQUE,
	Nombre char(20),
	Id_Departamento int NOT NULL,
	PRIMARY KEY (Id_Escuela)
) WITHOUT OIDS;


CREATE TABLE Facultad
(
	Id_Facultad int NOT NULL UNIQUE,
	Nombre char(20),
	PRIMARY KEY (Id_Facultad)
) WITHOUT OIDS;


CREATE TABLE Planificacion
(
	Cod_Clasificacion int NOT NULL UNIQUE,
	Rut varchar NOT NULL,
	Facultad char(40),
	Departamento char(40),
	Escuela char(40),
	Objetivo text,
	Asignatura varchar,
	Semestre int,
	Fecha date,
	Estrategia text,
	PRIMARY KEY (Cod_Clasificacion)
) WITHOUT OIDS;


CREATE TABLE Departamento
(
	Id_Departamento int NOT NULL UNIQUE,
	Nombre char(20),
	Id_Facultad int NOT NULL,
	PRIMARY KEY (Id_Departamento)
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


CREATE TABLE Profesor
(
	Rut varchar NOT NULL UNIQUE,
	Nombre char(20),
	Apellido_Paterno char(20),
	Apellido_Materno char(20),
	Id_Departamento int NOT NULL,
	PRIMARY KEY (Rut)
) WITHOUT OIDS;


CREATE TABLE Semana
(
	Numero_Semana int NOT NULL UNIQUE,
	Año int,
	Mes char(15),
	PRIMARY KEY (Numero_Semana)
) WITHOUT OIDS;


CREATE TABLE Contenido_Semana
(
	Numero_Semana int NOT NULL,
	Codigo int NOT NULL
) WITHOUT OIDS;


CREATE TABLE JefeCarrera
(
	Rut varchar NOT NULL UNIQUE,
	Id_Escuela int NOT NULL UNIQUE,
	PRIMARY KEY (Rut)
) WITHOUT OIDS;


CREATE TABLE Carrera
(
	Codigo int NOT NULL UNIQUE,
	Nombre char(20),
	Id_Escuela int NOT NULL,
	jefecarrera varchar NOT NULL UNIQUE,
	PRIMARY KEY (Codigo)
) WITHOUT OIDS;


CREATE TABLE DirectorDepartamento
(
	Rut varchar NOT NULL UNIQUE,
	Id_Departamento int NOT NULL UNIQUE,
	PRIMARY KEY (Rut)
) WITHOUT OIDS;


CREATE TABLE Decano
(
	Rut varchar NOT NULL UNIQUE,
	Id_Facultad int NOT NULL UNIQUE,
	PRIMARY KEY (Rut)
) WITHOUT OIDS;


CREATE TABLE Ramo
(
	Cod_Ramo varchar NOT NULL UNIQUE,
	Nombre char(20),
	Semestre int,
	PRIMARY KEY (Cod_Ramo)
) WITHOUT OIDS;


CREATE TABLE Ramo_Carrera
(
	Cod_Ramo varchar NOT NULL,
	Codigo int NOT NULL
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE Carrera
	ADD FOREIGN KEY (Id_Escuela)
	REFERENCES Escuela (Id_Escuela)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE JefeCarrera
	ADD FOREIGN KEY (Id_Escuela)
	REFERENCES Escuela (Id_Escuela)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Decano
	ADD FOREIGN KEY (Id_Facultad)
	REFERENCES Facultad (Id_Facultad)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Departamento
	ADD FOREIGN KEY (Id_Facultad)
	REFERENCES Facultad (Id_Facultad)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Contenido
	ADD FOREIGN KEY (Codigo)
	REFERENCES Planificacion (Cod_Clasificacion)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DirectorDepartamento
	ADD FOREIGN KEY (Id_Departamento)
	REFERENCES Departamento (Id_Departamento)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Profesor
	ADD FOREIGN KEY (Id_Departamento)
	REFERENCES Departamento (Id_Departamento)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Escuela
	ADD FOREIGN KEY (Id_Departamento)
	REFERENCES Departamento (Id_Departamento)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Contenido_Semana
	ADD FOREIGN KEY (Codigo)
	REFERENCES Contenido (Codigo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE JefeCarrera
	ADD FOREIGN KEY (Rut)
	REFERENCES Profesor (Rut)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DirectorDepartamento
	ADD FOREIGN KEY (Rut)
	REFERENCES Profesor (Rut)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Decano
	ADD FOREIGN KEY (Rut)
	REFERENCES Profesor (Rut)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Planificacion
	ADD FOREIGN KEY (Rut)
	REFERENCES Profesor (Rut)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Contenido_Semana
	ADD FOREIGN KEY (Numero_Semana)
	REFERENCES Semana (Numero_Semana)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Carrera
	ADD FOREIGN KEY (jefecarrera)
	REFERENCES JefeCarrera (Rut)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Ramo_Carrera
	ADD FOREIGN KEY (Codigo)
	REFERENCES Carrera (Codigo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Ramo_Carrera
	ADD FOREIGN KEY (Cod_Ramo)
	REFERENCES Ramo (Cod_Ramo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



