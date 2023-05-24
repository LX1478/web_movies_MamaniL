USE web_movies;
/****************************************************** VIEWS ******************************************************************************/
#Vista de generos de las peliculas
SELECT * FROM peliculas_generos;

#Vista de peliculas con mas visualizaciones en segundos
SELECT * FROM peliculas_top;

#Promedio de fechas en que mas es visualizada cada pelicula luego de su estreno
SELECT * FROM fechas_fuertes;

#Vista para ver cuantas peliculas tiene registrados cada pais y tambien el total de duracion
SELECT * FROM nacionalidad_peliculas;

#Para buscar cuantas peliculas tiene direccionadas cada director
SELECT * FROM pelis_por_director;

/****************************************************** FUNCTIONS ******************************************************************************/

#Primera funcion para saber la diferencia de dias entre el estreno de una pelicula y la fecha que tienen de parametro
SELECT fecha_diferencia(1, "2023-04-03") AS FECHA_DIFERENCIA;

#Segunda Funcion para formatear la duracion de segundos en h, min, seg
SELECT *, formatear_duracion(duracion) AS duracion_hms
FROM pelicula;

/****************************************************** STORE PROCEDURE ************************************************************************/

#Primer Store Procedure de ordenar de forma asc o desc en la tabla serie segun un campo
CALL ordenar_pelicula ("id_pelicula", "desc");

#Segundo store procedure de insertar valores en la tabla película
CALL insertar_pelicula ("Shrek", "2021-03-03", 5220, 7.7);

#Tercer store procedure para hacer un update
CALL usuario_update(1, "nombre", "Santiagos");

/******************************************************* TRIGGERS ******************************************************************************/

#Primer trigger para registrar en new_usuarios cada usuario nuevo
SELECT * FROM usuario;
SELECT * FROM new_usuarios;

INSERT INTO usuario (id_usuario, nombre, apellido, nombre_usuario, pais, email, contraseña, edad)
VALUES  (21, 'Enrique', 'Toco', 'Rickydl', 'njasdf8@gmail.com', 'Argentina', 'passwordkd', 43);


#Segundo trigger donde se registrara en log_pelis cada update de alguna pelicula
SELECT * FROM pelicula;
SELECT * FROM log_pelis;

INSERT INTO pelicula (titulo, fecha_estreno, duracion, valoracion)
VALUES ('El Gato con Botas: el último deseo', '21-12-22', 6125, 7.2);

UPDATE pelicula
SET  titulo = "el gato con c",
duracion = 8329,
valoracion = 6.7
WHERE id_pelicula = 20;

#Tercer trigger donde actualizara el campo de valoracion de la tabla pelicula con cada nueva valoracion en la tabla de valoraciones
SELECT * FROM pelicula;
SELECT * FROM valoraciones;
INSERT INTO valoraciones(id_usuario, id_pelicula, fecha, valoracion)
VALUES (4, 7, "2023-02-28", 4.3);