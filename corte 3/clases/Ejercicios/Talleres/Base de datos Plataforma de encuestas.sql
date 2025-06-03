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

-- Insertar usuarios en la base de datos 
--(se me olvido el nombre de la pagina de donde genera los datos para las tablas)

INSERT INTO usuario (id_usuario, username, email, contraseña, fecha_registro) VALUES
(1, 'jgarcia', 'jgarcia@email.com', 'password123', '2025-06-01'),
(2, 'mlopez', 'mlopez@email.com', 'securepass', '2025-06-02'),
(3, 'cruiz', 'cruiz@email.com', 'hashkey!', '2025-06-03'),
(4, 'apatino', 'apatino@email.com', 'encryptme', '2025-06-04'),
(5, 'bfernandez', 'bfernandez@email.com', 'secretcode', '2025-06-05');

-- Insertar encuestas
INSERT INTO encuesta (id_encuesta, id_usuario, titulo, descripcion, fecha_creacion, activa) VALUES
(1, 1, 'Preferencias de Redes Sociales', 'Encuesta sobre las redes sociales más populares.', '2025-06-01', TRUE),
(2, 2, 'Hábitos de Consumo', 'Estudio sobre hábitos de compra en línea.', '2025-06-02', TRUE),
(3, 3, 'Ejercicio Diario', 'Frecuencia y tipo de ejercicio realizado.', '2025-06-03', TRUE),
(4, 4, 'Tecnología en la Educación', 'Impacto de la tecnología en el aprendizaje.', '2025-06-04', TRUE),
(5, 5, 'Comida Favorita', 'Preferencias gastronómicas de la población.', '2025-06-05', TRUE);

-- Insertar preguntas
INSERT INTO pregunta (id_pregunta, id_encuesta, texto, tipo) VALUES
(1, 1, '¿Cuál es tu red social favorita?', 'selección única'),
(2, 2, '¿Cuántas veces compras en línea al mes?', 'numérico'),
(3, 3, '¿Cuánto tiempo dedicas al ejercicio diario?', 'texto'),
(4, 4, '¿Crees que la tecnología mejora el aprendizaje?', 'booleano'),
(5, 5, '¿Cuál es tu tipo de comida favorita?', 'selección única');

-- Insertar opciones de respuesta
INSERT INTO opcion_respuesta (id_opcion, id_pregunta, texto) VALUES
(1, 1, 'Facebook'),
(2, 1, 'Instagram'),
(3, 1, 'Twitter'),
(4, 1, 'TikTok'),
(5, 5, 'Italiana'),
(6, 5, 'Mexicana'),
(7, 5, 'Japonesa'),
(8, 5, 'Vegetariana');

-- Insertar votos
INSERT INTO voto (id_voto, id_usuario, id_opcion, fecha_voto) VALUES
(1, 1, 2, '2025-06-02'), 
(2, 2, 5, '2025-06-03'), 
(3, 3, 4, '2025-06-04'), 
(4, 4, 3, '2025-06-05'), 
(5, 5, 7, '2025-06-06'); 



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
