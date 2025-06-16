🔸 9. Consulta para mongo sin  utilizar el “where”
 
•	Para solamente 5 elementos :
db.pokemons.find(
  {
    games: { $exists: true, $not: { $size: 5 } } 
  }
)

•  $expr: permite usar expresiones de agregación en consultas estándar.
•  $size: obtiene el tamaño del arreglo.
•  $gte: compara si el tamaño es mayor o igual a 5.
