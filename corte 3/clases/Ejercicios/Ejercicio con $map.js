//ejercicio
//todo pokemon tipo fuego los scores se multipliquen x3
db.pokemons.aggregate([
  {
    $match: {
      scores: { $exists: true },
	  elemento: 'fuego'
    }
  },
  {
    $project: {
      _id: false,
      nombre: true,
      scores: true
    }
  },
  {
    $project: {
      nombre: 1,
      newScores: {
        $map: {
          input: "$scores",
          as: "score",
          in: {
            $multiply: ["$$score", 3]
          }
        }
      }
    }
  }
])
