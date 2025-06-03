DROP TABLE IF EXISTS estadistica_encuesta;

DROP TABLE IF EXISTS voto;

DROP TABLE IF EXISTS opcion_respuesta;

DROP TABLE IF EXISTS pregunta;

DROP TABLE IF EXISTS encuesta;

DROP TABLE IF EXISTS usuario;

CREATE TABLE usuario (

id_usuario INT NOT NULL,

username VARCHAR(50) NOT NULL,

email VARCHAR(100) NOT NULL,

contraseña VARCHAR(255) NOT NULL,

fecha_registro DATE NOT NULL,

CONSTRAINT pk_usuario PRIMARY KEY (id_usuario)

);

CREATE TABLE encuesta (

id_encuesta INT NOT NULL,

id_usuario INT NOT NULL,

titulo VARCHAR(100) NOT NULL,

descripcion TEXT,

fecha_creacion DATE NOT NULL,

activa BOOLEAN DEFAULT TRUE,

CONSTRAINT pk_encuesta PRIMARY KEY (id_encuesta)

);

CREATE TABLE pregunta (

id_pregunta INT NOT NULL,

id_encuesta INT NOT NULL,

texto TEXT NOT NULL,

tipo VARCHAR(20) NOT NULL,

CONSTRAINT pk_pregunta PRIMARY KEY (id_pregunta)

);

CREATE TABLE opcion_respuesta (

id_opcion INT NOT NULL,

id_pregunta INT NOT NULL,

texto VARCHAR(255) NOT NULL,

CONSTRAINT pk_opcion PRIMARY KEY (id_opcion)

);

CREATE TABLE voto (

id_voto INT NOT NULL,

id_usuario INT NOT NULL,

id_opcion INT NOT NULL,

fecha_voto DATE NOT NULL,

CONSTRAINT pk_voto PRIMARY KEY (id_voto)

);

CREATE TABLE estadistica_encuesta (

id_estadistica INT NOT NULL,

id_encuesta INT NOT NULL,

total_votos INT DEFAULT 0,

ultima_actualizacion DATE,

CONSTRAINT pk_estadistica PRIMARY KEY (id_estadistica)

);

ALTER TABLE encuesta

ADD CONSTRAINT fk_encuesta_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);

ALTER TABLE pregunta

ADD CONSTRAINT fk_pregunta_encuesta FOREIGN KEY (id_encuesta) REFERENCES encuesta(id_encuesta);

ALTER TABLE opcion_respuesta

ADD CONSTRAINT fk_opcion_pregunta FOREIGN KEY (id_pregunta) REFERENCES pregunta(id_pregunta);

ALTER TABLE voto

ADD CONSTRAINT fk_voto_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);

ALTER TABLE voto

ADD CONSTRAINT fk_voto_opcion FOREIGN KEY (id_opcion) REFERENCES opcion_respuesta(id_opcion);

ALTER TABLE estadistica_encuesta

ADD CONSTRAINT fk_estadistica_encuesta FOREIGN KEY (id_encuesta) REFERENCES encuesta(id_encuesta);
