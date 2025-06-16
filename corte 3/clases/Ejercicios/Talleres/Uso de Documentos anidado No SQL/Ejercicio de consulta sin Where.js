🔸 9. Consulta para mongo sin  utilizar el “where”
 
//•	Para solamente 5 elementos :
db.pokemons.find(
  {
    games: { $exists: true, $not: { $size: 5 } } 
  }
)

//Para mas de 5
db.pokemons.find(
  {
    games: { $exists: true, $type: "array" },
    $expr: {
      $gte: [{ $size: "$games" }, 5]
    }
  },
  {
    nombre: 1,
    games: 1,
    _id: 0
  }
);


•  $expr: permite usar expresiones de agregación en consultas estándar.
•  $size: obtiene el tamaño del arreglo.
•  $gte: compara si el tamaño es mayor o igual a 5.
