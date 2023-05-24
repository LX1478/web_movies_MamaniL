CREATE DATABASE web_movies;
USE web_movies;

CREATE TABLE usuario (
id_usuario 			bigint not null auto_increment primary key,
nombre				varchar(40) not null,
apellido			varchar(40) not null,
nombre_usuario		varchar(40) not null,
pais				varchar(40) not null,
email				varchar(40) not null,
contraseña			varchar(20) not null,
edad				int not null	
);

CREATE TABLE pelicula(
id_pelicula			bigint not null auto_increment primary key,
titulo				varchar(60) not null,
fecha_estreno		date not null,
duracion			int not null,
valoracion 			float not null
);

CREATE TABLE director(
id_director 		bigint not null auto_increment primary key,
nombre				varchar(40) not null,
apellido			varchar(40) not null,
nacionalidad		varchar(40)	not null
);

CREATE TABLE genero(
id_genero			bigint not null auto_increment primary key,
genero				varchar(40) not null,
descripcion			varchar(400)
);

CREATE TABLE caracteristicas(
id_pelicula			bigint not null,
constraint FK_id_pelicula_caracteristica	foreign key (id_pelicula) references pelicula (id_pelicula),
id_director			bigint not null,
constraint FK_id_director	foreign key (id_director) references director (id_director),
nacionalidad		varchar(40) not null,
idioma_original		varchar(40) not null,
productora			varchar(160) not null,
sipnosis 			varchar(600) not null
);

CREATE TABLE valoraciones(
id_usuario 			bigint not null,
constraint FK_id_usuario_valoraciones	foreign key (id_usuario) references usuario (id_usuario),
id_pelicula			bigint not null,
constraint FK_id_pelicula_valoraciones	foreign key (id_pelicula) references pelicula (id_pelicula),
fecha				date not null,
valoracion			float not null
);

CREATE TABLE pelis_vistas(
id_pelicula 		bigint not null,
constraint 	FK_id_pelicula_pv	foreign key (id_pelicula) references pelicula (id_pelicula),
id_usuario 			bigint not null,
constraint  FK_id_usuario_pv	foreign key (id_usuario) references usuario (id_usuario),
tiempo_visto 		int not null,
estado				varchar(40) not null,
fecha				date not null
);

CREATE TABLE catalogo(
id_pelicula 	bigint not null,
constraint FK_id_pelicula_catalogo foreign key (id_pelicula) references pelicula (id_pelicula),
id_genero		bigint not null,
constraint FK_id_genero_catalogo foreign key (id_genero) references genero (id_genero)
);


