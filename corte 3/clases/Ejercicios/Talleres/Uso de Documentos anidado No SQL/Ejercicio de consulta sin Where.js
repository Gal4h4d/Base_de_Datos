🔸 9. Consulta para mongo sin  utilizar el “where”
 
•	Para solamente 5 elementos :
db.pokemons.find(
  {
    games: { $exists: true, $not: { $size: 5 } } 
  }
)

•	Para mas elementos game:
db.pokemons.find(
  {
    $expr: {
      $gte: [{ $size: "$games" }, 5]
    }
  },
  {
    nombre: true,
    games: true
  }
)

•  $expr: permite usar expresiones de agregación en consultas estándar.
•  $size: obtiene el tamaño del arreglo.
•  $gte: compara si el tamaño es mayor o igual a 5.
