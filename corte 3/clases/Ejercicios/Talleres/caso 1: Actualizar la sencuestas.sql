
              --Caso 1--
---Problema:--- 
--si por ejemplo se vota en un a encuestas se ve que pues las estadisticas 
--no se van a actualizar, se deberia hacer de manera manueal, osea consultar esto 
--de manera que se haga siempre y pues no es efectivo.

---Solucion---
--Se crea un disparador AFTER INSERT en la tabla (voto) para incrementar el contador de votos en estadistica_encuesta

CREATE OR REPLACE FUNCTION actualizar_estadisticas_func()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE estadistica_encuesta
    SET total_votos = total_votos + 1,
        ultima_actualizacion = NOW()
    WHERE id_encuesta = (
        SELECT id_encuesta FROM pregunta 
        WHERE id_pregunta = (
            SELECT id_pregunta FROM opcion_respuesta 
            WHERE id_opcion = NEW.id_opcion
        )
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--El disparador q usa la funcion --
CREATE TRIGGER actualizar_estadisticas
AFTER INSERT ON voto
FOR EACH ROW
EXECUTE FUNCTION actualizar_estadisticas_func();

--para ver si se actualiza--
SELECT * FROM estadistica_encuesta;
SELECT * FROM voto;

---Inserciones de prueba--
--Al hacer una insercion el disparador se dispara(Valga la redundancia) y aumenta en +1 el conte de votos segun la id---

INSERT INTO voto (id_voto, id_usuario, id_opcion, fecha_voto) 
VALUES (10, 3, 2, '2025-06-11');

INSERT INTO voto (id_voto, id_usuario, id_opcion, fecha_voto) 
VALUES (12, 5, 3, '2025-06-12');

INSERT INTO voto (id_voto, id_usuario, id_opcion, fecha_voto) 
VALUES (13, 5, 4, '2025-07-13');
