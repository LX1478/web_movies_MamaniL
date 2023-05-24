USE web_movies2;
SELECT * FROM director;
INSERT INTO usuario(nombre, apellido, nombre_usuario, pais, email, contraseña, edad)
	VALUES ("Santiago","Tejera","SantiagoTejera","Argentina","santiagoffffff@gmail.com","contrasenia",33),
    ("Marcelo","Guillen","MarceloGuillen","Argentina","marceloGui323@gmail.com","jiefjinfii",43),
    ("Eduardo","Villaverde Rey","EduardoVillaRey","Uruguay","eduardoJ234@gmail.com","WVjnJJVT",18),
    ("Alfonso","Ribera","AlfonsoRivera","Uruguay","alfonso1489@gmail.com","TPKsa^jO",71),
    ("Emilio","Heredia","EmilioHeredia","Argentina","emilio708@gmail.com","b^KSVeWx",36),
    ("Mónica","Sáez","MónicaSáez","Paraguay","monicaseven@gmail.com","cgawtvlS",23),
    ("Ximena","Segovia","XimenaSegovia","Chile","ximenaconx@gmail.com","CkQYCVUe",51),
    ("Miguel","Barranco","MiguelBarranco","Chile","miguelmartin9@gmail.com","uTsCGJEl",61),
    ("Andrea","Figuerola","AndreaFiguerola","Uruguay","andreeightj@gmail.com","lJfaraBF",24),
    ("Elena","Bayo","ElenaBayo","Argentina","elena320@gmail.com","duXGFNpD",38),
    ("Natalia","Galvan","NataliaGalvan","Argentina","natalisjd148@gmail.com","qwerty123",37),
    ("Leonel","Farfán","LeonelFe","Paraguay","LeonelFArfan39@gmail.com","NGQ[SbKu",28),
    ("Diego","Julian","DiegoJulian","Uruguay","DiegoJulian32@gmail.com","V[I]iNJq",33),
    ("Emilia","González","EmiliaGe","Brasil","EmiliaGonzale1s2@gmail.com","iYdLOIJgz",54),
    ("Luciano","Rodriguez","LuCianoRODriguez","Chile","LuacianoRodriguez332@gmail.com","]rJXIlap",59),
    ("Mateo","Gómez","MateoGo","Argentina","MateoGómeze33@gmail.com","ia^buZft",18),
    ("Antonella","Martínez","AntoMarti","Argentina","AntonellaMartiadnez@gmail.com","tNwRyKgx",18),
    ("Daniel","Díaz","DanielDi","Ecuador","DanielDiaz322j@gmail.com","dOskAxk]",18),
    ("Agustín","García","AgustinGari","Peru","AgustinGarciawq2@gmail.com","aVQxVnt^",37),
    ("Mariano","Sánchez","Franchesco","Peru","MarianoSancheez3@gmail.com","OeWiXCJQ",47)
;
    
INSERT INTO pelicula(titulo, fecha_estreno, duracion, valoracion)
	VALUES ("El gato con botas: El último deseo","2022-12-21",6135,7.9),
    ("Sin novedad en el frente","2022-9-12",8823,7.8),
    ("Dragon Ball Super: Super Hero","2022-9-2",6012,7.1),
    ("Avatar: El sentido del agua","2022-12-16",11520,7.7),
    ("Jurassic World: Dominion","2022-6-10",8760,5.6),
    ("Pinocho de Guillermo del Toro","2022-11-25",7020,7.6),
    ("Avengers: Endgame","2019-4-22",10868,8.4),
    ("Spider-Man: Homecoming","2017-7-7",7980,7.4),
    ("Spider-Man: Far From Home","2019-7-2",7748,7.4),
    ("Spider-Man: No Way Home","2021-12-17",8888,8.2),
    ("Argentina, 1985","2022-9-21",8439,7.6),
    ("Lightyear","2022-6-17",6329,5.8),
    ("Doctor Strange","2016-10-13",6912,6.5),
    ("Doctor Strange in the multiverse of Madness","2022-5-6",7564,6.4),
    ("Dragon Ball Super: Broly","2018-12-14",6023,6.6),
    ("Way Down","2021-9-24",7821,5.4),
    ("Godzilla vs. Kong","2021-3-31",6780,5.3),
    ("Venom: Let There Be Carnage","2021-10-7",6055,4.6),
    ("Tom and Jerry","2021-2-26",6064,4.4)
;
    
INSERT INTO director(nombre, apellido, Nacionalidad)
	VALUES ("Joel","Crawford","Estados Unidos"),
    ("Edward","Berger","Alemania"),
    ("Tetsuro","Kodama","Japón"),
    ("James","Cameron","Canadá"),
    ("Colin","Trevorrow","Estados Unidos"),
    ("Guillermo","Del Toro Gómez","México"),
    ("Anthony, Joseph","Russo","Estados Unidos"),
    ("Jon","Watts","Estados Unidos"),
    ("Santiago","Mitre","Argentina"),
    ("Angus", "MacLane", "Estados Unidos"),
	("Scott", "Derrickson", "Estados Unidos"), #Director de doctor strange
	("Sam", "Raimi", "Estados Unidos"), #Director de doctor strange 2
	("Tatsuya", "Nagamine", "Japón"), #Director de DBS broly
    ("Jaume", "Balagueró", "España"), #Director de way down
	("Adam", "Wingard", "Estados Unidos"), #Directo de Godzilla vs kong
	("Andy", "Serkis", "Reino Unido"), #Director de Venom Carnage
	("Tim", "Story", "Estados Unidos") #Director de Tom y Jerry
;


INSERT INTO genero (genero, descripcion)
	VALUES ("Ciencia ficción","Se basa en un futur0 cercano o muy lejano, donde se logra ver el avance de la tecnologÃ­a y como ejecuta este en la historia."),
	("Acción","Cuyo argumento implica una interacciÃ³n moral entre el \"bien\" y el \"mal\" llevada a su fin por el Ã­mpetu o la fuerza fÃ­sica."),
	("Comedia","PelÃ­culas realizadas con la intenciÃ³n de provocar humor, divertimento, entretenimiento y/o risa en el espectador."),
	("Drama","En le cine, pelÃ­culas que se centran principalmente en el desarrollo de una lid entre los protagonistas, o del protagonista con su entorno o consigo mismo."),
	("Fantasía","Acerca de un tiempo pasado donde la magia, los animales mitolÃ³gicos o sucesos sin una explicaciÃ³n lÃ³gica forman parte de este mundo."),
	("Melodrama","Tiene una carga emocional o moral muy fuerte o emotiva, atendiendo al gusto de cada persona."),
	("Musical","Contienen interrupciones en su desarrollo, para dar un breve receso por medio de un fragmento musical cantado o acompaÃ±ados de una coreografÃ­a."),
	("Romance","Un desenvolvimiento romÃ¡ntico, cariÃ±oso o amoroso entre dos personas."),
	("Suspenso","Realizadas con la intenciÃ³n de provocar tensiÃ³n en el espectador. TambiÃ©n suele utilizarse la palabra thriller para designar pelÃ­culas de este tipo, aunque hay sutiles diferencias."),
	("Terror","Realizadas con la intenciÃ³n de provocar pavor, tensiÃ³n, miedo y/o el sobresalto en la audiencia."),
	("Documental","Hace referencia a temas de interÃ©s cientÃ­fico, social o cultural, entre otros."),
	("Bélico","En el que el nÃºcleo de la trama es la guerra, con unos personajes principales involucrados directamente en el conflicto armado o en el contexto de una sociedad que se encuentra sumida en una guerra."),
	("Biográfico","La trama se basa en la vida de una persona real, con mayor o menor adherencia a la realidad."),
	("Animación","Es aquel que no estÃ¡ rodado con personajes reales, sino a travÃ©s de fotogramas con dibujos hechos a mano (como en los orÃ­genes del cine) o, como sucede ahora, con programas de ediciÃ³n 3D, creando historias tanto para adultos como para niÃ±os."),
	("Histórico","Se narra un suceso del pasado de importancia histÃ³rica. Son pelÃ­culas basadas (o, al menos, inspiradas) en acontecimientos reales que sucedieron en el pasado."),
	("Aventura","Es un gÃ©nero cinematogrÃ¡fico, parecido al de acciÃ³n, pero que se centra en los combates y aventuras de los protagonistas.")
;

INSERT INTO caracteristicas(id_pelicula, id_director, nacionalidad, idioma_original, productora, sipnosis)
	VALUES (1,1,"Estados Unidos","Inglés","DreamWorks Animation","El Gato con Botas descubre que su pasiÃ³n por la aventura le ha pasado factura: Ha agotado ocho de sus nueve vidas. El Gato con Botas se embarca en un viaje Ã©pico para encontrar al mÃ­tico Ãšltimo Deseo y recuperar sus nueve vidas."),
    (2,2,"Alemania","Alemán","Amusement Park Films, Rocket Science, Sliding Down Rainbows Entertainment","Las aterradoras experiencias y la angustia de un joven soldado alemÃ¡n en el frente occidental durante la Primera Guerra Mundial."),
    (3,3,"Japón","japonés","Toei Animation","El EjÃ©rcito de la Cinta Roja del pasado de Goku ha regresado con dos nuevos androides para desafiarlo a Ã©l y a sus amigos."),
    (4,4,"Estados Unidos","Inglés","20th Century Studios, Lightstorm Entertainment, TSG Entertainment","Jake Sully vive con su nueva familia en el planeta de Pandora. Cuando una amenaza conocida regresa, Jake debe trabajar con Neytiri y el ejÃ©rcito de la raza na'vi para proteger su planeta."),
    (5,5,"Estados Unidos","Inglés","Amblin Entertainment Legendary Entertainment","AÃ±os despuÃ©s de la destrucciÃ³n de Isla Nublar, los dinosaurios viven y cazan junto a los humanos. Este equilibrio determinarÃ¡, si los humanos seguirÃ¡n siendo los depredadores mÃ¡ximos en un planeta que comparten con las criaturas temibles."),
    (6,6,"Estados Unidos","Inglés","Netflix Animation, The Jim Henson Company, PathÃ©1, ShadowMachine,Double Dare You Productions, Necropia Entertainment, El Taller de Chucho","Una versiÃ³n mÃ¡s oscura del clÃ¡sico cuento infantil de una marioneta de madera que se transforma en un niÃ±o vivo de verdad."),
    (7,7,"Estados Unidos","Inglés","Marvel Studios","DespuÃ©s de que Thanos haya aniquilado a la mitad del universo, los Vengadores supervivientes deben hacer todo lo posible por deshacer tal atrocidad."),
    (8,8,"Estados Unidos","Inglés","Marvel Studios","Peter Parker compagina su vida de estudiante ordinario de instituto en Queens con su alter ego de superhÃ©roe, Spider-Man, y se encuentra tras la pista de una nueva amenaza que merodea por los cielos de Nueva York."),
    (9,8,"Estados Unidos","Inglés","Marvel Studios","Tras los acontecimientos de ""Vengadores: Endgame"", Spider-Man debe enfrentarse a nuevas amenazas en un mundo que ha cambiado para siempre."),
    (10,8,"Estados Unidos","Inglés","Marvel Studios","Con la identidad de Spider-Man ahora revelada, Peter recurre al Doctor Strange en busca de ayuda. Algo sale mal y el multiverso se convierte en la mayor amenaza. Ahora Peter debe descubrir quÃ© significa realmente ser Spider-Man."),
    (11,9,"Argentina","Español","La UniÃ³n de los RÃ­os, Kenya Films, Infinity Hill","Un equipo de abogados se enfrenta a la sangrienta dictadura militar de Argentina durante la dÃ©cada de 1980 en una batalla contra viento y marea."),
    (12,10,"Estados Unidos","Inglés","Walt Disney Pictures, Pixar Animation Studios","La historia de Buzz Lightyear y sus aventuras hasta el infinito y más allá."),
    (13,11,"Estados Unidos","Inglés","Marvel Studios","Durante un viaje de curación física y espiritual, un brillante neurocirujano se adentra en el mundo de las artes místicas."),
    (14,12,"Estados Unidos","Inglés","Marel Studios","Viaja a lo desconocido con el Doctor Strange, quien, con la ayuda de tanto antiguos como nuevos aliados místicos, recorre las complejas y peligrosas realidades alternativas del multiverso para enfrentarse a un nuevo y misterioso adversario."),
    (15,13,"Japón","Japonés","Toei Animation","Goku y Vegeta se enfrentan a Broly, un guerrero Saiyan como ninguno al que se hayan enfrentado."),
    (16,14,"España","Español","Telecinco Cinema, Think Studio, Mediaset España, Movistar+","Un ingeniero y un marchante de arte traman un atraco al Banco de España para robar un tesoro legendario que será depositado en sus arcas durante solo 10 días."),
    (17,15,"Estados Unidos","Inglés","Legendary Pictures, Warner Bros. Pictures","El gigantesco Kong se encuentra con el imparable Godzilla. El mundo mira para ver cuál se convierte en el rey de todos los monstruos."),
    (18,16,"Estados Unidos","Inglés","Columbia Pictures, Marvel Entertainment","Eddie Brock intenta relanzar su carrera entrevistando al asesino en serie Cletus Kasady, que se convierte en el huésped del simbionte Carnage y escapa de la cárcel tras una ejecución fallida."),
    (19,17,"Estados Unidos","Inglés","Warner Animation Group, Turner Entertainment, The Story Company, Hanna-Barbera","Adaptación del clásico propiedad de Hanna-Barbera, que revela cómo Tom y Jerry se conocieron y se desató su rivalidad.")
;

INSERT INTO valoraciones(id_usuario, id_pelicula, fecha, valoracion)
	VALUES (4,17,"2023-02-12",3.2),
	(15,1,"2023-03-27",6.7),
	(18,17,"2023-04-16",9.4),
	(15,9,"2023-01-24",2.9),
	(7,1,"2023-02-01",5.1),
	(13,14,"2023-04-05",8.6),
	(6,16,"2023-03-20",4.3),
	(16,8,"2023-01-18",7.8),
	(18,16,"2023-05-02",1.5),
	(3,17,"2023-03-01",9.2),
	(6,13,"2023-02-06",2.7),
	(13,12,"2023-04-25",6.3),
	(4,13,"2023-02-25",4.8),
	(16,10,"2023-03-13",7.1),
	(11,3,"2023-04-29",1.9),
	(16,17,"2023-02-20",3.6),
	(4,4,"2023-01-10",8.2),
	(8,9,"2023-05-05",5.7),
	(7,7,"2023-03-17",2.4)
;

INSERT INTO pelis_vistas(id_pelicula, id_usuario, tiempo_visto, estado, fecha)
	VALUES (6,7,547,"POCO_VISTO","2023-03-01"),
	(15,6,4350,"MEDIO_VISTO","2023-04-29"),
	(14,14,775,"POCO_VISTO","2023-02-13"),
	(15,7,4274,"MEDIO_VISTO","2023-05-05"),
	(10,7,1568,"POCO_VISTO","2023-01-21"),
	(18,18,2021,"POCO_VISTO","2023-02-28"),
	(12,10,3023,"MEDIO_VISTO","2023-04-06"),
	(6,15,604,"POCO_VISTO","2023-03-18"),
	(6,13,2283,"POCO_VISTO","2023-01-07"),
	(17,15,2222,"POCO_VISTO","2023-02-11"),
	(6,14,7020,"VISTO","2023-04-22"),
	(6,10,7020,"VISTO","2023-02-02"),
	(17,3,6780,"MUY_VISTO","2023-03-30"),
	(18,13,6055,"VISTO","2023-04-13"),
	(10,8,5566,"MEDIO_VISTO","2023-02-05"),
	(1,19,6135,"VISTO","2023-05-02"),
	(16,17,5834,"MEDIO_VISTO","2023-01-14"),
	(16,10,4006,"MEDIO_VISTO","2023-03-05"),
	(6,6,1824,"POCO_VISTO","2023-04-08"),
	(19,6,6064,"VISTO","2023-02-17"),
	(12,15,698,"MEDIO_VISTO","2023-05-08"),
	(13,16,2789,"MEDIO_VISTO","2023-01-30"),
	(11,4,6969,"MUY_VISTO","2023-03-15"),
	(13,13,5266,"MEDIO_VISTO","2023-04-01"),
	(16,5,7821,"MUY_VISTO","2023-02-26"),
	(18,2,449,"POCO_VISTO","2023-05-03"),
	(14,16,5886,"MEDIO_VISTO","2023-01-19"),
	(3,3,6012,"VISTO","2023-04-24"),
	(3,20,6012,"VISTO","2023-03-07"),
	(3,16,6012,"VISTO","2023-02-08")
;

INSERT INTO catalogo(id_pelicula, id_genero)
	VALUES (9,1),
    (9,2),
    (9,3),
    (10,1),
    (10,2),
    (10,3),
    (11,4),
    (11,13),
    (12,14),
    (12,2),
    (12,16),
    (13,2),
    (13,16),
    (13,5),
    (14,2),
    (14,16),
    (14,5),
    (15,14),
    (15,16),
    (15,2),
    (16,9),
    (16,2),
    (16,16),
    (17,2),
    (17,1),
    (17,9),
    (18,1),
    (18,2),
    (18,9),
    (19,14),
    (19,16),
    (19,3)
;
