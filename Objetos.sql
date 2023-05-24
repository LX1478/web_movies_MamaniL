USE web_movies;
/****************************************************** VIEWS ******************************************************************************/

CREATE OR REPLACE VIEW peliculas_generos AS
	(SELECT pelicula.titulo, genero.genero AS generos
    FROM catalogo
    INNER JOIN pelicula
    ON catalogo.id_pelicula = pelicula.id_pelicula
    INNER JOIN genero
    ON catalogo.id_genero = genero.id_genero
    ORDER BY catalogo.id_pelicula ASC)
;

CREATE OR REPLACE VIEW peliculas_top AS
	(SELECT pelis_vistas.id_pelicula, pelicula.titulo, SUM(pelis_vistas.tiempo_visto) AS mas_reproducidas
    FROM pelis_vistas
    LEFT JOIN pelicula
    ON pelicula.id_pelicula = pelis_vistas.id_pelicula
	GROUP BY id_pelicula
    HAVING mas_reproducidas > 0
    ORDER BY mas_reproducidas DESC
    LIMIT 10)
;

CREATE OR REPLACE VIEW fechas_fuertes AS
	(SELECT a.id_pelicula, a.titulo, a.fecha_estreno, DATE_FORMAT((AVG(b.fecha)), "%Y-%m-%d") AS fechas_fuertes_vistas
    FROM pelicula a
    LEFT JOIN pelis_vistas b
    ON a.id_pelicula = b.id_pelicula
    GROUP BY id_pelicula
    ORDER BY id_pelicula ASC)
;

CREATE OR REPLACE VIEW nacionalidad_peliculas AS
	(SELECT b.nacionalidad, COUNT(a.id_pelicula) AS pelicula_producidas, ROUND(SUM(a.duracion)) AS total_duracion
    FROM pelicula a
    LEFT JOIN caracteristicas b
    ON a.id_pelicula = b.id_pelicula
    GROUP BY nacionalidad
    )
;

CREATE OR REPLACE VIEW pelis_por_director AS
	(SELECT a.id_director, a.nombre, a.apellido, a.nacionalidad, COUNT(b.id_pelicula) AS peliculas_direccionadas
    FROM director a
    LEFT JOIN caracteristicas b
    ON a.id_director = b.id_director
    GROUP BY a.id_director
    ORDER BY id_director ASC)
;
/****************************************************** FUNCTIONS ******************************************************************************/

CREATE FUNCTION fecha_diferencia(id_peli int, fecha_vista date)
RETURNS varchar(50)
DETERMINISTIC
RETURN (
	SELECT
	CONCAT(DATEDIFF(fecha_vista, (SELECT fecha_estreno FROM pelicula WHERE id_pelicula = id_peli)), ' dias')
	)
;

DELIMITER //
CREATE FUNCTION formatear_duracion(duracion int)
RETURNS VARCHAR(60)
DETERMINISTIC
BEGIN
	DECLARE hora int;
    DECLARE min int;
    DECLARE seg int;
    DECLARE resultado varchar(60);
    
	SET hora = ROUND(duracion/3600),
    min = ROUND((duracion % 3600) / 60),
    seg = ((duracion % 3600) % 60),
    resultado = CONCAT(hora, ' h ', min, ' m ', seg, ' s ');
    RETURN resultado;
END; //
DELIMITER ;

/****************************************************** STORE PROCEDURE ************************************************************************/

DROP PROCEDURE IF EXISTS ordenar_pelicula;
DELIMITER //
CREATE PROCEDURE ordenar_pelicula (IN columna VARCHAR(40), IN orden VARCHAR(4))
BEGIN
    IF orden = "ASC" OR orden = "asc" THEN
		SET @ordenar = CONCAT("ORDER BY ", columna, " ASC");
    ELSEIF orden = "DESC" OR orden = "desc" THEN
		SET @ordenar = CONCAT("ORDER BY ", columna, " DESC");
    ELSE
		SET @ordenar = " ";
    END IF;
SET @select_orden = CONCAT("SELECT * FROM pelicula ", @ordenar);
    PREPARE ejecucion FROM @select_orden;
    EXECUTE ejecucion;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS insertar_pelicula;
DELIMITER //
CREATE PROCEDURE insertar_pelicula (IN ptitulo VARCHAR(50), IN pfecha_estreno date, IN pduracion INT, IN pvaloracion float)
BEGIN
	INSERT INTO pelicula (titulo, fecha_estreno, duracion, valoracion)
    VALUES(ptitulo, pfecha_estreno, pduracion, pvaloracion);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS usuario_update;
DELIMITER //
CREATE PROCEDURE  usuario_update(IN id_usuariou BIGINT, IN campo VARCHAR(15), IN nuevo_dato VARCHAR(40))
BEGIN
	SET @campo_nuevo = CONCAT(TRIM("\" "), nuevo_dato, "\" ");
	SET @updatee = CONCAT("UPDATE usuario SET ", campo, " = ", @campo_nuevo, " WHERE id_usuario = 1"); 
    PREPARE ejecucion FROM @updatee;
    EXECUTE ejecucion;
END //
DELIMITER ;

/******************************************************* TRIGGERS ******************************************************************************/

DROP TABLE IF EXISTS new_usuarios;
CREATE TABLE new_usuarios(
id_usuario			bigint not null primary key,
nombre_usuario		varchar(60) not null,
fecha_creacion		date not null
);

DROP TRIGGER IF EXISTS new_usuarios;
DELIMITER $$
CREATE TRIGGER new_usuarios
BEFORE INSERT ON usuario
FOR EACH ROW 
BEGIN 
	DECLARE nu VARCHAR (60);
    DECLARE fecha date;
    set nu = (SELECT nombre_usuario from usuario where nombre_usuario = NEW.nombre_usuario),
    fecha = (SELECT CURRENT_DATE());
    
	IF NEW.nombre_usuario = nu THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nombre de Usuario ya en uso. Intente con otro';
    ELSE 
    INSERT INTO new_usuarios (id_usuario, nombre_usuario, fecha_creacion) VALUES (NEW.id_usuario, NEW.nombre_usuario, fecha);
    END IF;
END $$
DELIMITER ;

DROP TABLE IF EXISTS log_pelis;
CREATE TABLE log_pelis(
id_pelicula			bigint not null,
titulo				int not null,
fecha_estreno		int not null,
duracion			int not null,
valoracion			float not null,
fecha_mod			date not null,
hora_mod			time not null
);

DROP TRIGGER IF EXISTS pelis_update;
DELIMITER $$
CREATE TRIGGER pelis_update
AFTER UPDATE ON pelicula
FOR EACH ROW 
BEGIN 
	DECLARE col_titulo int;
    DECLARE col_fecha_estreno int;
    DECLARE col_duracion int;
    DECLARE col_valoracion int;
    DECLARE col_fecha_mod int; 
    DECLARE col_hora_mod int;
	SET col_titulo = 0, col_fecha_estreno = 0, col_duracion = 0, col_valoracion = 0,
    col_fecha_mod = (SELECT CURRENT_DATE()),
	col_hora_mod = (SELECT CURRENT_TIME());
    IF NEW.titulo != OLD.titulo THEN 
    SET col_titulo = 1;
    END IF;
    IF NEW.fecha_estreno != OLD.fecha_estreno THEN 
    SET col_fecha_estreno = 1;
    END IF;
    IF NEW.duracion != OLD.duracion THEN 
    SET col_duracion = 1;
    END IF;
    IF NEW.valoracion != OLD.valoracion THEN
    SET col_valoracion = 1;
    END IF;
    
    INSERT INTO log_pelis (id_pelicula, titulo, fecha_estreno, duracion, valoracion,fecha_mod, hora_mod)
    VALUES (NEW.id_pelicula, col_titulo, col_fecha_estreno, col_duracion, col_valoracion, col_fecha_mod, col_hora_mod);
    
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS valoracion_Insert;
DELIMITER $$
CREATE TRIGGER valoracion_insert
AFTER INSERT ON valoraciones
FOR EACH ROW
BEGIN 
	DECLARE promedio FLOAT;
    SET promedio = (SELECT ROUND(AVG(valoracion), 1) FROM valoraciones WHERE id_pelicula = NEW.id_pelicula GROUP BY id_pelicula);
    UPDATE pelicula
    SET valoracion = promedio
    WHERE id_pelicula = NEW.id_pelicula;
END $$
DELIMITER ;
