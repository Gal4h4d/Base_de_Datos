              --Caso 2--
---Problema:--- 
-- Cuando el usuario vota tambien deberia actualizar la fecha de actividad a la hora del sistema 

---Solucion---
--Creamos un a funcion bien simple que solo actualiza la tabla de usuario 
--y actualiza la columna donde est ala fecha de registro del usaurio cuando voto y pone la actual del voto


CREATE OR REPLACE FUNCTION actualizar_actividad_usuario_func()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE usuario
    SET fecha_registro = CURRENT_DATE 
    WHERE id_usuario = NEW.id_usuario;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER actualizar_actividad_usuario
AFTER INSERT ON voto
FOR EACH ROW
EXECUTE FUNCTION actualizar_actividad_usuario_func();

--Inserta estos valores o los que necesite (en mi codigo meti mas de 10 por errores)
INSERT INTO voto (id_voto, id_usuario, id_opcion, fecha_voto) 
VALUES (17, 2, 4, '2025-06-13');

--Copnsultar si cambio la fecha a la actual de cuando se actualizo osea el  CURRENT_DATE --
SELECT fecha_registro FROM usuario WHERE id_usuario = 2;
SELECT fecha_registro FROM usuario;
