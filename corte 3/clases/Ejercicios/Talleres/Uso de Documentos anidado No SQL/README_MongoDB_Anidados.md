# 📘 Guía de Documentos Anidados en MongoDB

Este documento proporciona una guía práctica sobre cómo trabajar con **documentos anidados** en MongoDB utilizando una colección de ejemplo: `pokemons`.

---

## 🔹 a. ¿Qué es un documento anidado?

Un **documento anidado** en MongoDB es un documento que contiene otro documento como valor de uno de sus campos.  
Es como un objeto JSON dentro de otro JSON.

---

## 🔸 1. ¿Cómo insertar documentos anidados?

**Ejemplo**: Insertar un Pokémon con sus evoluciones y estadísticas anidadas.

```javascript
db.pokemons.insertOne({
  nombre: "Charmander",
  tipo: ["Fuego"],
  region: "Kanto",
  evoluciones: [
    { nombre: "Charmeleon", nivel: 16 },
    { nombre: "Charizard", nivel: 36 }
  ],
  estadisticas: {
    ataque: 52,
    defensa: 43,
    velocidad: 65
  }
});
```

---

## 🔸 2. ¿Cómo traer datos de documentos anidados?

**Ejemplo**: Traer el nombre del Pokémon y sus evoluciones.

```javascript
db.pokemons.find(
  { nombre: "Charmander" },
  { evoluciones: 1, nombre: 1 }
);
```

---

## 🔸 3. ¿Cómo listar documentos?

**Ejemplo**: Listar todos los Pokémon mostrando su nombre y tipo.

```javascript
db.pokemons.find(
  {},
  { nombre: 1, tipo: 1, _id: 0 }
);
```

---

## 🔸 4. ¿Cómo actualizar documentos anidados?

**Ejemplo**: Cambiar el nombre de una evolución específica.

```javascript
db.pokemons.updateOne(
  { nombre: "Charmander", "evoluciones.nombre": "Charmeleon" },
  { $set: { "evoluciones.$.nombre": "Charmeleon🔥" } }
);
```

---

## 🔸 5. ¿Cómo consultar un documento anidado?

**Ejemplo**: Buscar Pokémon que tengan una evolución llamada “Charizard”.

```javascript
db.pokemons.find({
  "evoluciones.nombre": "Charizard"
});
```

---

## 🔸 6. Ejemplo completo de documento anidado

```javascript
{
  nombre: "Bulbasaur",
  tipo: ["Planta", "Veneno"],
  region: "Kanto",
  evoluciones: [
    { nombre: "Ivysaur", nivel: 16 },
    { nombre: "Venusaur", nivel: 32 }
  ],
  estadisticas: {
    ataque: 49,
    defensa: 49,
    velocidad: 45
  }
}
```

---

## 🔸 7. ¿Cómo buscar en documentos anidados?

**Ejemplo**: Buscar Pokémon cuyo **ataque sea mayor a 50**.

```javascript
db.pokemons.find({
  "estadisticas.ataque": { $gt: 50 }
});
```

---

## 🔸 8. ¿Cómo cambiar la proyección de atributos anidados?

**Ejemplo**: Mostrar solo el nombre y el ataque del Pokémon.

```javascript
db.pokemons.find(
  {},
  { nombre: 1, "estadisticas.ataque": 1, _id: 0 }
);
```

---

> ✍️ Esta guía es útil para consultas, inserciones, proyecciones y actualizaciones sobre documentos con estructuras complejas en MongoDB.
