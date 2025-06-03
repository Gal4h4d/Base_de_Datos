# Disparadores en Bases de Datos

Los **disparadores** son procedimientos almacenados que se ejecutan automáticamente en respuesta a eventos específicos en una tabla o vista de una base de datos.

---

## ¿Para qué sirven?

- Automatizan tareas repetitivas.
- Garantizan la integridad de los datos.
- Aplican reglas de negocio sin intervención manual.

---

## Ventajas

- **Automatización**: Ejecutan acciones sin necesidad de código adicional en la aplicación.  
- **Integridad de datos**: Ayudan a mantener reglas de negocio dentro de la base de datos.  
- **Eficiencia**: Reducen la necesidad de consultas adicionales para validar datos.

---

## Desventajas

- **Dificultan la depuración**: La lógica oculta puede hacer que los errores sean difíciles de rastrear.  
- **Impacto en el rendimiento**: Pueden ralentizar operaciones si no se diseñan correctamente.  
- **Complejidad**: Su uso excesivo puede hacer que la base de datos sea difícil de mantener.

---

## Sintaxis básica

```sql
CREATE TRIGGER nombre_disparador
AFTER INSERT ON nombre_tabla
FOR EACH ROW
BEGIN
    -- Acción a ejecutar
END;

