//agregarle a todos los pokemones tipo planta ponerle el objeto tipo semilla
//tipoSemilla : {
//semilla1: valor 1

db.pokemons.updateMany(
  { elemento: "planta" },
  { $set: 
    { tipoSemilla:{
        semilla1: 'Daño',
        semilla2: 'Curacion'
    } 
 } 
});

//coordenadas{
//latitud:
//longitud:

db.pokemons.updateMany(
    {},
    {$set:
        {coordenadas:{
            latitud:3000,
            longitud:139.689184
        }
    }
});

//usando el dot.notation listar el nombre de los pokemons que esta en una latitud mayor a 2.000
db.pokemons.find(
    {"coordenadas.latitud":{$gt:2000}},
    {nombre:true, _id:false
});



//Temas de clase

-agregate()
[{tarea1},
 {tarea2}
]

//operadores
$match
$project

//Ejercicios

db.pokemons.find(
    {
        altura_m:{
            $eq:0.5
        }
});


db.pokemons.aggregate([
  {
     $match:{
        games:{ $exists: true }
     }
     
  },
  {
     $project: {
        _id: false, nombre: true, games: true,
     }
  },
  {
    $project:{
       nombre: true,
       firtsGame: {
         $slice: ['$games', 1]
       }
    }

  }
])

db.pokemons.aggregate([
	{
		$project:{
		_id: false, nombre: true, pesoKg:true
		}
	}
])

db.pokemons.aggregate([
	{
		$project:{
		_id: false, nombre: true, pesoKg:true
		}
	},
	{
		$addFields:{
			fechaHoy: new.Date ()
		}
	}
])

db.pokemons.aggregate([
	{
		$project:{
		_id: false, nombre: true, pesoKg:true
		}
	},
	{
		$addFields:{
			fechaHoy: new Date ()
		}
	},
	{
		$set: {
			suma: { $sum: '$pesoKg'}
			}
		
	},
	{
		$set: {
			avg: { $avg: '$pesoKg'}
		}
	},
	{
		$project:{
			fulName: { 
				$concat: ['$nombre', '--', '$elemento' ]
			},
			pesoKg: true
		}
	}
])

db.pokemons.aggregate([
	{
		$project:{
		_id: false, nombre: true, pesoKg:true
		}
	},
	{
		$addFields:{
			fechaHoy: new Date ()
		}
	}
])

db.pokemons.aggregate([
	{
		$project:{
		_id: false, nombre: true, pesoKg:true
		}
	},
	{
		$set: {
			suma: { $sum: '$pesoKg'}
			}
		
	}
	
])

db.pokemons.aggregate([
	{
		$project:{
			fullName: { 
				$concat: ['$nombre', '--', '$elemento' ]
			},
			pesoKg: true
		}
	}
	
])

db.pokemons.aggregate([
   {
     $group:{
      _id: '$elemento'
     }   
   }
])


db.pokemons.aggregate([
   {
     $group:{
      _id: '$elemento',
      total: { $sum: 1 }
     }   
   },
   {
     $sort:{
       total: -1
     }
   }
  
]);

db.pokemons.aggregate([
   {
     $group:{
      _id: '$elemento',
      total: { $sum: 1 }
     }   
   },
   {
     $sort:{
       total: -1
     }
   },
   {
     $limit: 1
   }
]);
