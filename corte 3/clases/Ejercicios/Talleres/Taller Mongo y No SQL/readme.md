# Tutorial: Uso de Operadores Relacionales y Lógicos en MongoDB

---

## Base de datos 

### Nombre: `operadoresDB`  
### Colección: `usuarios`

##Relacionales

| Operador | Uso                    | Ejemplo                                       |
| -------- | ---------------------- | --------------------------------------------- |
| `$eq`    | Igual a                | `{ "edad": { "$eq": 30 } }`                   |
| `$ne`    | Distinto de            | `{ "ciudad": { "$ne": "Cali" } }`             |
| `$gt`    | Mayor que              | `{ "puntos": { "$gt": 70 } }`                 |
| `$gte`   | Mayor o igual que      | `{ "edad": { "$gte": 25 } }`                  |
| `$lt`    | Menor que              | `{ "edad": { "$lt": 35 } }`                   |
| `$lte`   | Menor o igual que      | `{ "edad": { "$lte": 30 } }`                  |
| `$in`    | Está en un conjunto    | `{ "ciudad": { "$in": ["Bogotá", "Cali"] } }` |
| `$nin`   | No está en un conjunto | `{ "edad": { "$nin": [22, 35] } }`            |

##Logicos
| Operador | Uso                                   | Ejemplo                                                         |
| -------- | ------------------------------------- | --------------------------------------------------------------- |
| `$and`   | Todas las condiciones deben cumplirse | `{ "$and": [ { "edad": { "$gt": 25 } }, { "activo": true } ] }` |
| `$or`    | Al menos una condición debe cumplirse | `{ "$or": [ { "ciudad": "Bogotá" }, { "ciudad": "Cali" } ] }`   |
| `$not`   | Niega una condición                   | `{ "puntos": { "$not": { "$gt": 80 } } }`                       |
| `$nor`   | Ninguna condición debe cumplirse      | `{ "$nor": [ { "activo": true }, { "ciudad": "Medellín" } ] }`  |
