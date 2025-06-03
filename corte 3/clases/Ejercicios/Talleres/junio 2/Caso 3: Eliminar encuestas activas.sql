              --Caso 3--
---Problema:--- 
-- Si un una encuesta esta activa osea si Activa == True 
-- No se deberia dejar eliminar la encuesta
-- Pero si es Actica== False entonces si deberia

---Solucion---
-- Crear una funcion que valide si la columna activa es False para dejar eliminar la encuesta 
-- y True para que no lo deje hacer y que tenga su texto de error


--Solo VAlida que active este en True para eliminar y si no pue smanda error --
CREATE OR REPLACE FUNCTION prevenir_eliminacion_encuesta_func()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.activa = TRUE THEN
        RAISE EXCEPTION 'No se puede eliminar una encuesta activa.';
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

--Disoarador--
CREATE TRIGGER prevenir_eliminacion_encuesta
BEFORE DELETE ON encuesta
FOR EACH ROW
EXECUTE FUNCTION prevenir_eliminacion_encuesta_func();

--Pureba--
DELETE FROM encuesta WHERE id_encuesta = 1;

--Para ver el estado--
SELECT activa FROM encuesta;

--Para cambiar y probar de manera diferente--
UPDATE encuesta
SET activa = FALSE
WHERE id_encuesta = 1; 




