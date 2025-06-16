db.pokemons.insertOne({
  nombre: "Squirtle",
  tipo: ["Agua"],
  region: "Kanto",
  habitat: {
    nombre: "Orilla del río",
    clima: "Húmedo",
    ubicacion: "Ruta 24"
  },
  estadisticas: {
    hp: 44,
    ataque: 48,
    defensa: 65,
    velocidad: 43
  },
  evoluciones: [
    {
      nombre: "Wartortle",
      nivel: 16
    },
    {
      nombre: "Blastoise",
      nivel: 36
    }
  ],
  juegos: ["Red", "Blue", "Yellow", "FireRed", "LeafGreen"]
});
