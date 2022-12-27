CREATE DATABASE jadecbamaven 
DEFAULT CHARACTER SET utf8 
DEFAULT COLLATE utf8_general_ci;

use jadecbamaven;

create table plantas(
	idPlanta int auto_increment not null primary key,
	tipo varchar(30) not null,
	nombre varchar(30) not null,
	descripcion varchar(500) not null	
);

INSERT INTO plantas(tipo, nombre, descripcion) VALUES
	("Cactaceas", "Euphorbia lactea", "Regar moderadamente ya que resisten muy bien la sequia a razon de una vez cada 10 dias en verano.
En invierno suspender los riegos si se cultivan en exterior y regar una vez al mes como mucho en interiores. Otros nombres: Cactus cresta.
Ambientes: Interior y Exterior"),
	("Apocinaceas", "Pachypodium", "Temperatura minima de aproximadamente 16 grados centigrados. Abundante agua durante el periodo de crecimiento.
Otros nombres: Palma de Madagascar - Pachypodium lamerei. Ambientes: Interior (en invierno) y Exterior"),
	("Agavaceas", "Agave potatorum", "Deben estar a pleno sol, en suelos rocosos arcillosos y/o calizos, bien drenados y pobres en nutrientes.
Tolera muy bien largos periodos de sequias. Son capaces de resistir heladas de hasta -5 grados centigrados, siempre que la tierra permanezca 
seca. Otros nombres: Agave. Ambientes: Exterior");

select * from plantas;

/*UPDATE plantas SET descripcion = REPLACE(descripcion, '\n', ' ');*/

