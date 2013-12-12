/* Create Database */

CREATE DATABASE "Tarea06"
  WITH ENCODING='UTF8'
       CONNECTION LIMIT=-1;





/* Create Tables */

CREATE TABLE regiones
(
	pk serial NOT NULL,
	nombre varchar(255) NOT NULL UNIQUE,
	corfo varchar(255) NOT NULL,
	codigo varchar(5) NOT NULL UNIQUE,
	numero int NOT NULL UNIQUE,
	paises_fk int NOT NULL,
	PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE provincias
(
	pk serial NOT NULL,
	nombre varchar(255) NOT NULL UNIQUE,
	regiones_fk int NOT NULL,
	PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE facultades
(
	pk serial NOT NULL,
	facultad varchar(255) NOT NULL UNIQUE,
	descripcion text,
	PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE asignatura
(
	codigo varchar(8) NOT NULL UNIQUE,
	nombre varchar(255) NOT NULL UNIQUE,
	descripcion text,
	PRIMARY KEY (codigo)
) WITHOUT OIDS;


CREATE TABLE Semana
(
	pk serial NOT NULL UNIQUE,
	semana_anual int NOT NULL,
	semana_planificada char(15),
	PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE Contenido
(
	clasificacion_fk int NOT NULL,
	Semana serial NOT NULL,
	Objetivo text,
	Contenido text,
	Evaluacion text,
	PRIMARY KEY (clasificacion_fk)
) WITHOUT OIDS;


CREATE TABLE Contenido_Semana
(
	pk int NOT NULL,
	clasificacion_fk int NOT NULL
) WITHOUT OIDS;


CREATE TABLE carrera_asignatura
(
	codigo_carrera int NOT NULL,
	codigo_asignatura varchar(8) NOT NULL
) WITHOUT OIDS;


CREATE TABLE escuela
(
	pk serial NOT NULL,
	departamento_fk int NOT NULL,
	escuela varchar(255) NOT NULL,
	descripcion text,
	PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE JefeCarrera
(
	docente_fk int NOT NULL UNIQUE,
	escuela_fk int NOT NULL,
	PRIMARY KEY (docente_fk)
) WITHOUT OIDS;


CREATE TABLE Planificacion
(
	Cod_Clasificacion serial NOT NULL UNIQUE,
	Rut varchar(12) NOT NULL,
	Facultad int NOT NULL,
	Departamento int NOT NULL,
	Escuela int NOT NULL,
	Objetivo text,
	Asignatura varchar(8) NOT NULL,
	Semestre int,
	Fecha date,
	Estrategia text,
	PRIMARY KEY (Cod_Clasificacion)
) WITHOUT OIDS;


CREATE TABLE Decano
(
	Rut varchar(12) NOT NULL UNIQUE,
	facultad_fk int NOT NULL UNIQUE,
	PRIMARY KEY (Rut)
) WITHOUT OIDS;


CREATE TABLE Carrera
(
	Codigo int NOT NULL UNIQUE,
	nombre varchar(255),
	escuela_fk int NOT NULL,
	jefecarrera_fk int NOT NULL UNIQUE,
	PRIMARY KEY (Codigo)
) WITHOUT OIDS;


CREATE TABLE comuna
(
	pk serial NOT NULL,
	nombre varchar(255) NOT NULL UNIQUE,
	provincia_fk int NOT NULL,
	PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE docentes
(
	pk serial NOT NULL,
	nombre varchar(255) NOT NULL,
	Apellidos varchar(255) NOT NULL,
	rut varchar(12) NOT NULL UNIQUE,
	fecha_nacimiento date,
	genero char(1),
	direccion varchar(255) NOT NULL,
	comuna_fk int NOT NULL,
	telefono varchar(255),
	celular varchar(255),
	email varchar(255) NOT NULL,
	departamento_fk int NOT NULL,
	jerarquia varchar(255) NOT NULL,
	contrato varchar(255) NOT NULL,
	jornada varchar(255) NOT NULL,
	grado int NOT NULL,
	funcion varchar(255) NOT NULL,
	eliminado int NOT NULL,
	PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE departamentos
(
	pk serial NOT NULL,
	facultad_fk int NOT NULL,
	departamento varchar(255) NOT NULL UNIQUE,
	descripcion text,
	PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE cursos
(
	pk serial NOT NULL,
	semestre int NOT NULL UNIQUE,
	anio int NOT NULL UNIQUE,
	docente_fk int NOT NULL UNIQUE,
	seccion int NOT NULL,
	codigo varchar(8) NOT NULL UNIQUE,
	PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE DirectorDepartamento
(
	Rut varchar(12) NOT NULL UNIQUE,
	departamento_fk int NOT NULL UNIQUE,
	PRIMARY KEY (Rut)
) WITHOUT OIDS;


CREATE TABLE Paises
(
	pk serial NOT NULL,
	cod_num int NOT NULL UNIQUE,
	alfa_tres varchar(3) NOT NULL UNIQUE,
	alfa_dos varchar(2) NOT NULL UNIQUE,
	nombre varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY (pk)
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE provincias
	ADD FOREIGN KEY (regiones_fk)
	REFERENCES regiones (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comuna
	ADD FOREIGN KEY (provincia_fk)
	REFERENCES provincias (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE departamentos
	ADD FOREIGN KEY (facultad_fk)
	REFERENCES facultades (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Decano
	ADD FOREIGN KEY (facultad_fk)
	REFERENCES facultades (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Planificacion
	ADD FOREIGN KEY (Facultad)
	REFERENCES facultades (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE carrera_asignatura
	ADD FOREIGN KEY (codigo_asignatura)
	REFERENCES asignatura (codigo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cursos
	ADD FOREIGN KEY (codigo)
	REFERENCES asignatura (codigo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Contenido_Semana
	ADD FOREIGN KEY (pk)
	REFERENCES Semana (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Contenido_Semana
	ADD FOREIGN KEY (clasificacion_fk)
	REFERENCES Contenido (clasificacion_fk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Planificacion
	ADD FOREIGN KEY (Escuela)
	REFERENCES escuela (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE JefeCarrera
	ADD FOREIGN KEY (escuela_fk)
	REFERENCES escuela (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Carrera
	ADD FOREIGN KEY (escuela_fk)
	REFERENCES escuela (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Carrera
	ADD FOREIGN KEY (jefecarrera_fk)
	REFERENCES JefeCarrera (docente_fk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Contenido
	ADD FOREIGN KEY (clasificacion_fk)
	REFERENCES Planificacion (Cod_Clasificacion)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE carrera_asignatura
	ADD FOREIGN KEY (codigo_carrera)
	REFERENCES Carrera (Codigo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE docentes
	ADD FOREIGN KEY (comuna_fk)
	REFERENCES comuna (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE JefeCarrera
	ADD FOREIGN KEY (docente_fk)
	REFERENCES docentes (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Decano
	ADD FOREIGN KEY (Rut)
	REFERENCES docentes (rut)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cursos
	ADD FOREIGN KEY (docente_fk)
	REFERENCES docentes (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Planificacion
	ADD FOREIGN KEY (Rut)
	REFERENCES docentes (rut)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DirectorDepartamento
	ADD FOREIGN KEY (Rut)
	REFERENCES docentes (rut)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE escuela
	ADD FOREIGN KEY (departamento_fk)
	REFERENCES departamentos (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DirectorDepartamento
	ADD FOREIGN KEY (departamento_fk)
	REFERENCES departamentos (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE docentes
	ADD FOREIGN KEY (departamento_fk)
	REFERENCES departamentos (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Planificacion
	ADD FOREIGN KEY (Departamento)
	REFERENCES departamentos (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Planificacion
	ADD FOREIGN KEY (Asignatura)
	REFERENCES cursos (codigo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE regiones
	ADD FOREIGN KEY (paises_fk)
	REFERENCES Paises (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



