
Aquí tienes un ejemplo de contenido para un archivo `README.md` que explica el uso del operador `$map` en MongoDB junto con otros operadores útiles que se pueden combinar con `$map`, ideal para documentar tu proyecto en GitHub:

---

# Uso de `$map` y otros operadores en MongoDB

Este documento explica cómo utilizar el operador `$map` de MongoDB y cómo combinarlo con otros operadores de agregación para transformar documentos dentro de un pipeline.

## ¿Qué es `$map`?

El operador `$map` aplica una expresión a cada elemento de un array y devuelve un nuevo array con los resultados. Es útil para transformar datos dentro de una colección sin modificar los documentos originales.

### Sintaxis

```js
{
  $map: {
    input: <array>,
    as: <variable>,
    in: <expression>
  }
}
```

* `input`: el array que quieres transformar.
* `as`: nombre de la variable para cada elemento.
* `in`: la transformación a aplicar.

---

## Ejemplo básico

```js
db.pokemones.aggregate([
  {
    $project: {
      nombre: 1,
      ataques: {
        $map: {
          input: "$movimientos",
          as: "mov",
          in: {
            nombre: "$$mov.nombre",
            poder: "$$mov.poder"
          }
        }
      }
    }
  }
])
```

---

## Combinación con otros operadores

### `$filter`

Filtra elementos de un array según una condición.

```js
$filter: {
  input: <array>,
  as: <variable>,
  cond: <boolean expression>
}
```

**Ejemplo con `$map` y `$filter`:**

```js
{
  $map: {
    input: {
      $filter: {
        input: "$movimientos",
        as: "m",
        cond: { $gt: ["$$m.poder", 50] }
      }
    },
    as: "mov",
    in: "$$mov.nombre"
  }
}
```

---

### `$reduce`

Reduce un array a un solo valor, útil para acumulaciones.

```js
$reduce: {
  input: <array>,
  initialValue: <value>,
  in: <expression>
}
```

**Ejemplo:**

```js
{
  $reduce: {
    input: "$scores",
    initialValue: 0,
    in: { $add: ["$$value", "$$this"] }
  }
}
```

---

### `$zip`

Combina arrays elemento por elemento.

```js
$zip: {
  inputs: [<array1>, <array2>],
  useLongestLength: true | false
}
```

**Ejemplo:**

```js
{
  $map: {
    input: {
      $zip: {
        inputs: ["$nombres", "$valores"]
      }
    },
    as: "par",
    in: {
      nombre: { $arrayElemAt: ["$$par", 0] },
      valor: { $arrayElemAt: ["$$par", 1] }
    }
  }
}
```

---

### `$let`

Permite definir variables temporales dentro de una expresión.

```js
$let: {
  vars: { <var1>: <expr1>, <var2>: <expr2> },
  in: <expression>
}
```

**Ejemplo con `$map`:**

```js
$map: {
  input: "$stats",
  as: "stat",
  in: {
    $let: {
      vars: { puntos: "$$stat.valor" },
      in: { $multiply: ["$$puntos", 2] }
    }
  }
}
```


---

## `$unwind` – Descomponer Arrays en Documentos

El operador `$unwind` en MongoDB se utiliza dentro de una **pipeline de agregación** para **convertir cada elemento de un array en un documento individual**. Es útil cuando necesitas analizar, contar o transformar elementos dentro de arrays.

---

### ¿Cómo funciona?

Dado un documento como este:

```json
{
  "_id": 1,
  "nombre": "Pikachu",
  "tipos": ["eléctrico", "rápido"]
}
```

Si aplicamos `$unwind`:

```js
db.pokemones.aggregate([
  { $unwind: "$tipos" }
])
```

Obtendremos:

```json
{ "_id": 1, "nombre": "Pikachu", "tipos": "eléctrico" }
{ "_id": 1, "nombre": "Pikachu", "tipos": "rápido" }
```

---

### 🛠Sintaxis con opciones

```js
{
  $unwind: {
    path: "$<campo_array>",
    includeArrayIndex: "<nombre_campo_indice>", // Opcional
    preserveNullAndEmptyArrays: <true|false>    // Opcional
  }
}
```

#### Ejemplo con índice

```js
db.pokemones.aggregate([
  {
    $unwind: {
      path: "$tipos",
      includeArrayIndex: "indice"
    }
  }
])
```

Resultado:

```json
{ "_id": 1, "nombre": "Pikachu", "tipos": "eléctrico", "indice": 0 }
{ "_id": 1, "nombre": "Pikachu", "tipos": "rápido", "indice": 1 }
```

---

### Opción: `preserveNullAndEmptyArrays`

Permite mantener los documentos que tienen un array vacío o que no tienen el campo especificado.

```js
{
  $unwind: {
    path: "$tipos",
    preserveNullAndEmptyArrays: true
  }
}
```

---

### Casos de uso

* **Contar** cuántas veces aparece un tipo de Pokémon en una colección.
* **Filtrar** solo los tipos de interés (por ejemplo, solo "fuego").
* **Agrupar** por elementos individuales del array para estadísticas.

---

