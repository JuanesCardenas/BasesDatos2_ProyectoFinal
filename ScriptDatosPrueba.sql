/*
SCRIPT
Inserción de Datos de Prueba
*/


-----------------------------------------------
-- Tablas Base
-----------------------------------------------
---------------------------------
-- CIUDADES (3)
---------------------------------
INSERT INTO Ciudad VALUES (1, 'Bogotá');
INSERT INTO Ciudad VALUES (2, 'Medellín');
INSERT INTO Ciudad VALUES (3, 'Cali');

---------------------------------
-- CLASIFICACIONES (5)
---------------------------------
INSERT INTO ContenidoClasificacion VALUES (1, 'TP');
INSERT INTO ContenidoClasificacion VALUES (2, '+7');
INSERT INTO ContenidoClasificacion VALUES (3, '+13');
INSERT INTO ContenidoClasificacion VALUES (4, '+16');
INSERT INTO ContenidoClasificacion VALUES (5, '+18');

---------------------------------
-- GENEROS (8)
---------------------------------
INSERT INTO Genero VALUES (1, 'Acción');
INSERT INTO Genero VALUES (2, 'Comedia');
INSERT INTO Genero VALUES (3, 'Drama');
INSERT INTO Genero VALUES (4, 'Suspenso');
INSERT INTO Genero VALUES (5, 'Romance');
INSERT INTO Genero VALUES (6, 'Ciencia Ficción');
INSERT INTO Genero VALUES (7, 'Terror');
INSERT INTO Genero VALUES (8, 'Infantil');

---------------------------------
-- SUSCRIPCIONES (3)
---------------------------------
INSERT INTO Plan VALUES (1, 'Basico', 1, 'SD', 14900);
INSERT INTO Plan VALUES (2, 'Estandar', 2, 'HD', 24900);
INSERT INTO Plan VALUES (3, 'Premium', 4, '4K', 34900);

-----------------------------------------------
-- Tablas Empleados, Departamentos y Usuarios
-----------------------------------------------
---------------------------------
-- DEPARTAMENTOS (5)
---------------------------------
INSERT INTO Departamento VALUES (1, 'Tecnología', NULL);
INSERT INTO Departamento VALUES (2, 'Contenido', NULL);
INSERT INTO Departamento VALUES (3, 'Marketing', NULL);
INSERT INTO Departamento VALUES (4, 'Soporte', NULL);
INSERT INTO Departamento VALUES (5, 'Finanzas', NULL);

---------------------------------
-- EMPLEADOS (25)
---------------------------------
-- TECNOLOGÍA
INSERT INTO Empleado VALUES (1, 'Ana Torres', 'ana.torres@mail.com', 1, NULL); -- JEFE
INSERT INTO Empleado VALUES (2, 'Luis Gómez', 'luis.gomez@mail.com', 1, 1);
INSERT INTO Empleado VALUES (3, 'Carlos Ruiz', 'carlos.ruiz@mail.com', 1, 1);
INSERT INTO Empleado VALUES (4, 'Sofía Herrera', 'sofia.herrera@mail.com', 1, 2);
INSERT INTO Empleado VALUES (5, 'Mateo Castro', 'mateo.castro@mail.com', 1, 2);

-- CONTENIDO
INSERT INTO Empleado VALUES (6, 'Valentina Ríos', 'valentina.rios@mail.com', 2, NULL); -- JEFE
INSERT INTO Empleado VALUES (7, 'Andrés Mejía', 'andres.mejia@mail.com', 2, 6);
INSERT INTO Empleado VALUES (8, 'Camila Ortiz', 'camila.ortiz@mail.com', 2, 6);
INSERT INTO Empleado VALUES (9, 'Juan Pérez', 'juan.perez@mail.com', 2, 7);
INSERT INTO Empleado VALUES (10, 'Laura Sánchez', 'laura.sanchez@mail.com', 2, 7);

-- MARKETING
INSERT INTO Empleado VALUES (11, 'Diego Morales', 'diego.morales@mail.com', 3, NULL); -- JEFE
INSERT INTO Empleado VALUES (12, 'Paula Vega', 'paula.vega@mail.com', 3, 11);
INSERT INTO Empleado VALUES (13, 'Daniel León', 'daniel.leon@mail.com', 3, 11);
INSERT INTO Empleado VALUES (14, 'Natalia Cruz', 'natalia.cruz@mail.com', 3, 12);
INSERT INTO Empleado VALUES (15, 'Felipe Arias', 'felipe.arias@mail.com', 3, 12);

-- SOPORTE
INSERT INTO Empleado VALUES (16, 'Jorge Ramírez', 'jorge.ramirez@mail.com', 4, NULL); -- JEFE
INSERT INTO Empleado VALUES (17, 'Diana López', 'diana.lopez@mail.com', 4, 16);
INSERT INTO Empleado VALUES (18, 'Sebastián Torres', 'sebastian.torres@mail.com', 4, 16);
INSERT INTO Empleado VALUES (19, 'Mariana Gil', 'mariana.gil@mail.com', 4, 17);
INSERT INTO Empleado VALUES (20, 'Kevin Rojas', 'kevin.rojas@mail.com', 4, 17);

-- FINANZAS
INSERT INTO Empleado VALUES (21, 'Ricardo Núñez', 'ricardo.nunez@mail.com', 5, NULL); -- JEFE
INSERT INTO Empleado VALUES (22, 'Tatiana Vargas', 'tatiana.vargas@mail.com', 5, 21);
INSERT INTO Empleado VALUES (23, 'Oscar Medina', 'oscar.medina@mail.com', 5, 21);
INSERT INTO Empleado VALUES (24, 'Juliana Pardo', 'juliana.pardo@mail.com', 5, 22);
INSERT INTO Empleado VALUES (25, 'Hugo Salazar', 'hugo.salazar@mail.com', 5, 22);

UPDATE Departamento SET id_Jefe = 1 WHERE id_Departamento = 1;
UPDATE Departamento SET id_Jefe = 6 WHERE id_Departamento = 2;
UPDATE Departamento SET id_Jefe = 11 WHERE id_Departamento = 3;
UPDATE Departamento SET id_Jefe = 16 WHERE id_Departamento = 4;
UPDATE Departamento SET id_Jefe = 21 WHERE id_Departamento = 5;

---------------------------------
-- USUARIOS (30)
---------------------------------
INSERT INTO Usuario VALUES (1,'Juan Perez','juan1@mail.com','3001',DATE '2000-01-01',DATE '2024-01-10',DATE '2024-02-10','ACTIVO',1,1,NULL,'N');
INSERT INTO Usuario VALUES (2,'Maria Lopez','maria2@mail.com','3002',DATE '1998-05-10',DATE '2024-02-15',DATE '2024-03-15','ACTIVO',2,1,1,'S');
INSERT INTO Usuario VALUES (3,'Carlos Ruiz','carlos3@mail.com','3003',DATE '1995-03-03',DATE '2024-03-01',DATE '2024-04-01','ACTIVO',3,1,NULL,'N');
INSERT INTO Usuario VALUES (4,'Ana Torres','ana4@mail.com','3004',DATE '2001-07-20',DATE '2024-01-05',DATE '2024-01-30','INACTIVO',1,1,NULL,'N');
INSERT INTO Usuario VALUES (5,'Mark Grayson','mark5@mail.com','3005',DATE '1990-11-11',DATE '2024-02-01',DATE '2024-02-28','ACTIVO',2,1,2,'S');
INSERT INTO Usuario VALUES (6,'Sofia Herrera','sofia6@mail.com','3006',DATE '2002-09-09',DATE '2024-03-10',DATE '2024-04-10','ACTIVO',3,1,NULL,'N');
INSERT INTO Usuario VALUES (7,'Mateo Castro','mateo7@mail.com','3007',DATE '1999-04-04',DATE '2024-02-20',DATE '2024-03-20','INACTIVO',1,1,NULL,'N');
INSERT INTO Usuario VALUES (8,'Camila Ortiz','camila8@mail.com','3008',DATE '1997-06-15',DATE '2024-01-25',DATE '2024-02-25','ACTIVO',2,1,3,'S');
INSERT INTO Usuario VALUES (9,'Andres Mejia','andres9@mail.com','3009',DATE '1993-08-18',DATE '2024-03-05',DATE '2024-04-05','ACTIVO',3,1,NULL,'N');
INSERT INTO Usuario VALUES (10,'Laura Sanchez','laura10@mail.com','3010',DATE '2000-12-12',DATE '2024-02-28',DATE '2024-03-28','ACTIVO',1,1,NULL,'N');
INSERT INTO Usuario VALUES (11,'Nolan Grayson','nolan11@mail.com','3011',DATE '1996-10-10',DATE '2024-01-15',DATE '2024-02-15','ACTIVO',2,1,5,'S');
INSERT INTO Usuario VALUES (12,'Paula Vega','paula12@mail.com','3012',DATE '1994-03-30',DATE '2024-03-12',DATE '2024-04-12','INACTIVO',3,1,NULL,'N');
INSERT INTO Usuario VALUES (13,'Daniel Leon','daniel13@mail.com','3013',DATE '1998-02-02',DATE '2024-01-20',DATE '2026-02-20','ACTIVO',1,2,NULL,'N');
INSERT INTO Usuario VALUES (14,'Natalia Cruz','natalia14@mail.com','3014',DATE '2001-01-01',DATE '2024-02-10',DATE '2026-03-10','ACTIVO',2,2,13,'S');
INSERT INTO Usuario VALUES (15,'Felipe Arias','felipe15@mail.com','3015',DATE '1992-07-07',DATE '2024-03-18',DATE '2026-04-18','ACTIVO',3,2,NULL,'N');
INSERT INTO Usuario VALUES (16,'Frederick Fazbear','fnaf16@mail.com','3016',DATE '1990-05-05',DATE '2024-01-08',DATE '2026-02-08','INACTIVO',3,2,NULL,'N');
INSERT INTO Usuario VALUES (17,'Diana Lopez','diana17@mail.com','3017',DATE '1999-09-09',DATE '2024-02-14',DATE '2026-03-14','ACTIVO',2,2,15,'S');
INSERT INTO Usuario VALUES (18,'Sebastian Torres','sebastian18@mail.com','3018',DATE '2003-03-03',DATE '2024-03-22',DATE '2026-04-22','ACTIVO',3,2,NULL,'N');
INSERT INTO Usuario VALUES (19,'Silent Gil','g19@mail.com','3019',DATE '1997-12-12',DATE '2024-02-05',DATE '2026-03-05','ACTIVO',1,2,NULL,'N');
INSERT INTO Usuario VALUES (20,'Kevin Rojas','kevin20@mail.com','3020',DATE '1995-06-06',DATE '2024-01-30',DATE '2026-02-28','INACTIVO',2,2,NULL,'N');
INSERT INTO Usuario VALUES (21,'Ricardo Nunez','ricardo21@mail.com','3021',DATE '1991-04-04',DATE '2024-01-12',DATE '2026-02-12','ACTIVO',3,3,NULL,'N');
INSERT INTO Usuario VALUES (22,'Tatiana Vargas','tatiana22@mail.com','3022',DATE '1998-08-08',DATE '2024-02-18',DATE '2026-04-18','ACTIVO',1,3,21,'S');
INSERT INTO Usuario VALUES (23,'Oscar Medina','oscar23@mail.com','3023',DATE '1993-11-11',DATE '2024-03-25',DATE '2026-04-25','ACTIVO',2,3,NULL,'N');
INSERT INTO Usuario VALUES (24,'Tung Tung Sahur','triplet24@mail.com','3024',DATE '2000-10-10',DATE '2024-02-02',DATE '2026-03-02','INACTIVO',3,3,NULL,'N');
INSERT INTO Usuario VALUES (25,'Hugo Salazar','hugo25@mail.com','3025',DATE '1996-09-09',DATE '2024-01-28',DATE '2026-02-28','ACTIVO',1,3,NULL,'N');
INSERT INTO Usuario VALUES (26,'Andrea Rios','andrea26@mail.com','3026',DATE '2002-02-02',DATE '2024-03-08',DATE '2026-04-08','ACTIVO',2,3,23,'S');
INSERT INTO Usuario VALUES (27,'Brayan Diaz','brayan27@mail.com','3027',DATE '1999-01-01',DATE '2024-02-11',DATE '2026-04-11','ACTIVO',3,3,NULL,'N');
INSERT INTO Usuario VALUES (28,'Valeria Mendez','valeria28@mail.com','3028',DATE '2001-06-06',DATE '2024-01-18',DATE '2026-04-18','INACTIVO',1,3,NULL,'N');
INSERT INTO Usuario VALUES (29,'Robert Lox','roblox29@mail.com','3029',DATE '1994-05-05',DATE '2024-02-27',DATE '2026-04-27','ACTIVO',2,3,NULL,'N');
INSERT INTO Usuario VALUES (30,'Luisa Fernandez','luisa30@mail.com','3030',DATE '1997-07-07',DATE '2024-03-30',DATE '2026-04-30','ACTIVO',3,3,26,'S');

---------------------------------
-- PERFILES (50)
---------------------------------
INSERT INTO Perfil VALUES (1,'Perfil A1','img1.png','ADULTO',16);
INSERT INTO Perfil VALUES (2,'Perfil A2','img2.png','ADULTO',16);
INSERT INTO Perfil VALUES (3,'Perfil A3','img3.png','ADULTO',16);
INSERT INTO Perfil VALUES (4,'Perfil A4','img4.png','ADULTO',16);
INSERT INTO Perfil VALUES (5,'Perfil A5','img5.png','ADULTO',16);

INSERT INTO Perfil VALUES (6,'Perfil B1','img6.png','ADULTO',24);
INSERT INTO Perfil VALUES (7,'Perfil B2','img7.png','INFANTIL',24);
INSERT INTO Perfil VALUES (8,'Perfil B3','img8.png','ADULTO',24);
INSERT INTO Perfil VALUES (9,'Perfil B4','img9.png','INFANTIL',24);
INSERT INTO Perfil VALUES (10,'Perfil B5','img10.png','ADULTO',24);

INSERT INTO Perfil VALUES (11,'Perfil 11','img11.png','ADULTO',1);
INSERT INTO Perfil VALUES (12,'Perfil 12','img12.png','INFANTIL',1);
INSERT INTO Perfil VALUES (13,'Perfil 13','img13.png','ADULTO',2);
INSERT INTO Perfil VALUES (14,'Perfil 14','img14.png','ADULTO',2);
INSERT INTO Perfil VALUES (15,'Perfil 15','img15.png','INFANTIL',3);
INSERT INTO Perfil VALUES (16,'Perfil 16','img16.png','ADULTO',4);
INSERT INTO Perfil VALUES (17,'Perfil 17','img17.png','ADULTO',4);
INSERT INTO Perfil VALUES (18,'Perfil 18','img18.png','ADULTO',5);
INSERT INTO Perfil VALUES (19,'Perfil 19','img19.png','ADULTO',6);
INSERT INTO Perfil VALUES (20,'Perfil 20','img20.png','INFANTIL',6);
INSERT INTO Perfil VALUES (21,'Perfil 21','img21.png','ADULTO',7);
INSERT INTO Perfil VALUES (22,'Perfil 22','img22.png','ADULTO',8);
INSERT INTO Perfil VALUES (23,'Perfil 23','img23.png','ADULTO',8);
INSERT INTO Perfil VALUES (24,'Perfil 24','img24.png','ADULTO',9);
INSERT INTO Perfil VALUES (25,'Perfil 25','img25.png','ADULTO',10);
INSERT INTO Perfil VALUES (26,'Perfil 26','img26.png','INFANTIL',11);
INSERT INTO Perfil VALUES (27,'Perfil 27','img27.png','ADULTO',12);
INSERT INTO Perfil VALUES (28,'Perfil 28','img28.png','ADULTO',13);
INSERT INTO Perfil VALUES (29,'Perfil 29','img29.png','INFANTIL',14);
INSERT INTO Perfil VALUES (30,'Perfil 30','img30.png','ADULTO',15);
INSERT INTO Perfil VALUES (31,'Perfil 31','img31.png','ADULTO',17);
INSERT INTO Perfil VALUES (32,'Perfil 32','img32.png','INFANTIL',17);
INSERT INTO Perfil VALUES (33,'Perfil 33','img33.png','ADULTO',18);
INSERT INTO Perfil VALUES (34,'Perfil 34','img34.png','ADULTO',19);
INSERT INTO Perfil VALUES (35,'Perfil 35','img35.png','INFANTIL',19);
INSERT INTO Perfil VALUES (36,'Perfil 36','img36.png','ADULTO',20);
INSERT INTO Perfil VALUES (37,'Perfil 37','img37.png','ADULTO',21);
INSERT INTO Perfil VALUES (38,'Perfil 38','img38.png','ADULTO',22);
INSERT INTO Perfil VALUES (39,'Perfil 39','img39.png','ADULTO',23);
INSERT INTO Perfil VALUES (40,'Perfil 40','img40.png','ADULTO',25);
INSERT INTO Perfil VALUES (41,'Perfil 41','img41.png','INFANTIL',26);
INSERT INTO Perfil VALUES (42,'Perfil 42','img42.png','ADULTO',27);
INSERT INTO Perfil VALUES (43,'Perfil 43','img43.png','ADULTO',28);
INSERT INTO Perfil VALUES (44,'Perfil 44','img44.png','INFANTIL',29);
INSERT INTO Perfil VALUES (45,'Perfil 45','img45.png','ADULTO',30);
INSERT INTO Perfil VALUES (46,'Perfil 46','img46.png','ADULTO',3);
INSERT INTO Perfil VALUES (47,'Perfil 47','img47.png','ADULTO',5);
INSERT INTO Perfil VALUES (48,'Perfil 48','img48.png','ADULTO',7);
INSERT INTO Perfil VALUES (49,'Perfil 49','img49.png','ADULTO',9);
INSERT INTO Perfil VALUES (50,'Perfil 50','img50.png','INFANTIL',10);

-----------------------------------------------
-- Tablas Contenido y Relacionados
-----------------------------------------------
---------------------------------
-- CONTENIDOS (40)
---------------------------------
INSERT INTO Contenido VALUES (1,'FNAF 1','PELICULA',DATE '2023-01-01',110,'Terror animatrónico',SYSDATE,80,4,'N',6);
INSERT INTO Contenido VALUES (2,'FNAF 2','PELICULA',DATE '2024-01-01',115,'Secuela terror',SYSDATE,90,4,'N',6);
INSERT INTO Contenido VALUES (3,'Mega Man I','PELICULA',DATE '2018-01-01',120,'Sci-fi',SYSDATE,70,3,'S',7);
INSERT INTO Contenido VALUES (4,'Mega Man II','PELICULA',DATE '2020-01-01',125,'Sci-fi secuela',SYSDATE,85,3,'S',7);
INSERT INTO Contenido VALUES (5,'Mega Man III','PELICULA',DATE '2022-01-01',130,'Final saga',SYSDATE,95,3,'S',7);
INSERT INTO Contenido VALUES (6,'Love in Paris','PELICULA',DATE '2019-01-01',100,'Romance',SYSDATE,60,2,'N',8);
INSERT INTO Contenido VALUES (7,'Love in Paris 2','PELICULA',DATE '2021-01-01',105,'Romance secuela',SYSDATE,65,2,'N',8);
INSERT INTO Contenido VALUES (8,'Invencible','SERIE',DATE '2021-01-01',45,'Superhéroes',SYSDATE,100,5,'S',6);
INSERT INTO Contenido VALUES (9,'Detectives X','SERIE',DATE '2020-01-01',50,'Crimen',SYSDATE,75,4,'N',7);
INSERT INTO Contenido VALUES (10,'Detectives X: Reloaded','SERIE',DATE '2022-01-01',50,'Crimen secuela',SYSDATE,80,4,'N',7);
INSERT INTO Contenido VALUES (11,'Planeta Tierra','DOCUMENTAL',DATE '2015-01-01',90,'Naturaleza',SYSDATE,70,1,'N',6);
INSERT INTO Contenido VALUES (12,'Planeta Tierra II','DOCUMENTAL',DATE '2018-01-01',95,'Naturaleza secuela',SYSDATE,75,1,'N',6);
INSERT INTO Contenido VALUES (13,'TechTalk','PODCAST',DATE '2022-01-01',30,'Tecnología',SYSDATE,50,1,'N',6);
INSERT INTO Contenido VALUES (14,'TechTalk Pro','PODCAST',DATE '2023-01-01',35,'Tecnología avanzada',SYSDATE,60,1,'N',6);
INSERT INTO Contenido VALUES (15,'Top Hits 2023','MUSICA',DATE '2023-01-01',60,'Música',SYSDATE,85,1,'N',7);
INSERT INTO Contenido VALUES (16,'Horror Night','PELICULA',DATE '2017-01-01',100,'Terror',SYSDATE,55,5,'N',8);
INSERT INTO Contenido VALUES (17,'Comedy Club','PELICULA',DATE '2016-01-01',90,'Comedia',SYSDATE,40,2,'N',7);
INSERT INTO Contenido VALUES (18,'Drama Total','SERIE',DATE '2019-01-01',45,'Drama',SYSDATE,65,3,'N',6);
INSERT INTO Contenido VALUES (19,'Drama Total 2','SERIE',DATE '2021-01-01',45,'Drama secuela',SYSDATE,70,3,'N',6);
INSERT INTO Contenido VALUES (20,'Super Mario Bros','PELICULA',DATE '2023-04-01',95,'Aventura del Reino Champiñón',SYSDATE,95,1,'S',6);
INSERT INTO Contenido VALUES (21,'Mario Galaxy','PELICULA',DATE '2025-06-01',110,'Aventura espacial de Mario',SYSDATE,98,1,'S',6);
INSERT INTO Contenido VALUES (22,'Minecraft: La Pelicula','PELICULA',DATE '2024-05-01',100,'Mundo de bloques',SYSDATE,97,1,'N',7);
INSERT INTO Contenido VALUES (23,'Cyber Future','SERIE',DATE '2022-01-01',50,'Futuro distópico',SYSDATE,85,3,'S',8);
INSERT INTO Contenido VALUES (24,'Cyber Future 2','SERIE',DATE '2024-01-01',50,'Secuela futurista',SYSDATE,88,3,'S',8);
INSERT INTO Contenido VALUES (25,'Océanos Profundos','DOCUMENTAL',DATE '2017-01-01',80,'Vida marina',SYSDATE,60,1,'N',6);
INSERT INTO Contenido VALUES (26,'Historia del Gaming','DOCUMENTAL',DATE '2020-01-01',85,'Videojuegos',SYSDATE,75,1,'N',7);
INSERT INTO Contenido VALUES (27,'Mundo Cripto','PODCAST',DATE '2023-01-01',40,'Economía digital',SYSDATE,65,1,'N',6);
INSERT INTO Contenido VALUES (28,'Mundo Cripto Pro','PODCAST',DATE '2024-01-01',45,'Inversiones',SYSDATE,70,1,'N',6);
INSERT INTO Contenido VALUES (29,'Rock Legends','MUSICA',DATE '2015-01-01',70,'Rock clásico',SYSDATE,80,1,'N',7);
INSERT INTO Contenido VALUES (30,'Pop Hits 2024','MUSICA',DATE '2024-01-01',65,'Pop moderno',SYSDATE,90,1,'N',7);
INSERT INTO Contenido VALUES (31,'Zombie Attack','PELICULA',DATE '2018-01-01',105,'Apocalipsis zombie',SYSDATE,72,4,'N',8);
INSERT INTO Contenido VALUES (32,'Zombie Attack 2','PELICULA',DATE '2021-01-01',110,'Secuela zombie',SYSDATE,78,4,'N',8);
INSERT INTO Contenido VALUES (33,'Space Journey','PELICULA',DATE '2019-01-01',115,'Viaje espacial',SYSDATE,82,3,'S',6);
INSERT INTO Contenido VALUES (34,'Space Journey 2','PELICULA',DATE '2022-01-01',120,'Continuación espacial',SYSDATE,88,3,'S',6);
INSERT INTO Contenido VALUES (35,'Hospital Central','SERIE',DATE '2016-01-01',50,'Drama médico',SYSDATE,68,2,'N',7);
INSERT INTO Contenido VALUES (36,'Hospital Central 2','SERIE',DATE '2019-01-01',50,'Drama médico secuela',SYSDATE,72,2,'N',7);
INSERT INTO Contenido VALUES (37,'Misterios Ocultos','SERIE',DATE '2021-01-01',45,'Suspenso',SYSDATE,77,4,'N',8);
INSERT INTO Contenido VALUES (38,'Universo Expandido','DOCUMENTAL',DATE '2018-01-01',90,'Espacio',SYSDATE,83,1,'N',6);
INSERT INTO Contenido VALUES (39,'Historias Nocturnas','PODCAST',DATE '2022-01-01',35,'Relatos de terror',SYSDATE,66,5,'N',8);
INSERT INTO Contenido VALUES (40,'Indie Mix','MUSICA',DATE '2020-01-01',55,'Música independiente',SYSDATE,58,1,'N',7);

---------------------------------
-- TEMPORADAS (15)
---------------------------------
INSERT INTO Temporada VALUES (1,'T1',8);
INSERT INTO Temporada VALUES (2,'T2',8);
INSERT INTO Temporada VALUES (3,'T3',8);
INSERT INTO Temporada VALUES (4,'T4',8);
INSERT INTO Temporada VALUES (5,'T1',9);
INSERT INTO Temporada VALUES (6,'T2',9);
INSERT INTO Temporada VALUES (7,'T1',10);
INSERT INTO Temporada VALUES (8,'T1',18);
INSERT INTO Temporada VALUES (9,'T2',18);
INSERT INTO Temporada VALUES (10,'T1',13);
INSERT INTO Temporada VALUES (11,'T2',13);
INSERT INTO Temporada VALUES (12,'T1',14);
INSERT INTO Temporada VALUES (13,'T1',19);
INSERT INTO Temporada VALUES (14,'T2',19);
INSERT INTO Temporada VALUES (15,'T1',13);

---------------------------------
-- EPISODIOS (50)
---------------------------------
INSERT INTO Episodio VALUES (1,'E1',1);
INSERT INTO Episodio VALUES (2,'E2',1);
INSERT INTO Episodio VALUES (3,'E3',1);
INSERT INTO Episodio VALUES (4,'E4',1);
INSERT INTO Episodio VALUES (5,'E5',1);
INSERT INTO Episodio VALUES (6,'E6',1);
INSERT INTO Episodio VALUES (7,'E7',1);
INSERT INTO Episodio VALUES (8,'E8',1);
INSERT INTO Episodio VALUES (9,'E1',2);
INSERT INTO Episodio VALUES (10,'E2',2);
INSERT INTO Episodio VALUES (11,'E3',2);
INSERT INTO Episodio VALUES (12,'E4',2);
INSERT INTO Episodio VALUES (13,'E5',2);
INSERT INTO Episodio VALUES (14,'E6',2);
INSERT INTO Episodio VALUES (15,'E7',2);
INSERT INTO Episodio VALUES (16,'E8',2);
INSERT INTO Episodio VALUES (17,'E1',3);
INSERT INTO Episodio VALUES (18,'E2',3);
INSERT INTO Episodio VALUES (19,'E3',3);
INSERT INTO Episodio VALUES (20,'E4',3);
INSERT INTO Episodio VALUES (21,'E5',3);
INSERT INTO Episodio VALUES (22,'E6',3);
INSERT INTO Episodio VALUES (23,'E7',3);
INSERT INTO Episodio VALUES (24,'E8',3);
INSERT INTO Episodio VALUES (25,'E1',4);
INSERT INTO Episodio VALUES (26,'E2',4);
INSERT INTO Episodio VALUES (27,'E3',4);
INSERT INTO Episodio VALUES (28,'E4',4);
INSERT INTO Episodio VALUES (29,'E5',4);
INSERT INTO Episodio VALUES (30,'E6',4);
INSERT INTO Episodio VALUES (31,'E7',4);
INSERT INTO Episodio VALUES (32,'E8',4);
INSERT INTO Episodio VALUES (33,'E1',5);
INSERT INTO Episodio VALUES (34,'E2',5);
INSERT INTO Episodio VALUES (35,'E3',6);
INSERT INTO Episodio VALUES (36,'E1',7);
INSERT INTO Episodio VALUES (37,'E1',8);
INSERT INTO Episodio VALUES (38,'E2',8);
INSERT INTO Episodio VALUES (39,'E1',9);
INSERT INTO Episodio VALUES (40,'E2',9);
INSERT INTO Episodio VALUES (41,'E1',10);
INSERT INTO Episodio VALUES (42,'E2',10);
INSERT INTO Episodio VALUES (43,'E1',11);
INSERT INTO Episodio VALUES (44,'E2',11);
INSERT INTO Episodio VALUES (45,'E1',12);
INSERT INTO Episodio VALUES (46,'E1',13);
INSERT INTO Episodio VALUES (47,'E2',13);
INSERT INTO Episodio VALUES (48,'E1',14);
INSERT INTO Episodio VALUES (49,'E2',14);
INSERT INTO Episodio VALUES (50,'E1',15);

---------------------------------
-- CONTENIDO ASOCIADO (40)
---------------------------------
INSERT INTO ContenidoAsociado VALUES (1,2,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (2,1,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (3,4,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (4,5,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (3,5,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (4,3,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (5,3,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (5,4,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (6,7,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (7,6,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (9,10,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (10,9,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (18,19,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (19,18,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (11,12,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (12,11,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (13,14,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (14,13,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (20,21,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (21,20,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (23,24,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (24,23,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (27,28,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (28,27,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (31,32,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (32,31,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (33,34,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (34,33,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (35,36,'SECUELA');
INSERT INTO ContenidoAsociado VALUES (36,35,'PRECUELA');
INSERT INTO ContenidoAsociado VALUES (1,16,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (16,1,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (31,16,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (16,31,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (3,33,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (33,3,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (4,34,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (34,4,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (8,3,'RELACIONADO'); 
INSERT INTO ContenidoAsociado VALUES (3,8,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (8,23,'RELACIONADO'); 
INSERT INTO ContenidoAsociado VALUES (23,8,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (20,22,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (22,20,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (21,22,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (22,21,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (15,29,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (29,15,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (15,30,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (30,15,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (25,11,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (11,25,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (26,13,'RELACIONADO');
INSERT INTO ContenidoAsociado VALUES (13,26,'RELACIONADO');

---------------------------------
-- CONTENIDO GENEROS (62)
---------------------------------
INSERT INTO ContenidoGenero VALUES (1,7);
INSERT INTO ContenidoGenero VALUES (1,4);
INSERT INTO ContenidoGenero VALUES (2,7);
INSERT INTO ContenidoGenero VALUES (2,4);
INSERT INTO ContenidoGenero VALUES (3,1);
INSERT INTO ContenidoGenero VALUES (3,6);
INSERT INTO ContenidoGenero VALUES (4,1);
INSERT INTO ContenidoGenero VALUES (4,6);
INSERT INTO ContenidoGenero VALUES (5,1);
INSERT INTO ContenidoGenero VALUES (5,6);
INSERT INTO ContenidoGenero VALUES (6,5);
INSERT INTO ContenidoGenero VALUES (6,3);
INSERT INTO ContenidoGenero VALUES (7,5);
INSERT INTO ContenidoGenero VALUES (7,3);
INSERT INTO ContenidoGenero VALUES (8,1);
INSERT INTO ContenidoGenero VALUES (8,6);
INSERT INTO ContenidoGenero VALUES (9,4);
INSERT INTO ContenidoGenero VALUES (9,3);
INSERT INTO ContenidoGenero VALUES (10,4);
INSERT INTO ContenidoGenero VALUES (10,3);
INSERT INTO ContenidoGenero VALUES (11,3);
INSERT INTO ContenidoGenero VALUES (12,3);
INSERT INTO ContenidoGenero VALUES (13,6);
INSERT INTO ContenidoGenero VALUES (14,6);
INSERT INTO ContenidoGenero VALUES (15,2);
INSERT INTO ContenidoGenero VALUES (16,7);
INSERT INTO ContenidoGenero VALUES (16,4);
INSERT INTO ContenidoGenero VALUES (17,2);
INSERT INTO ContenidoGenero VALUES (18,3);
INSERT INTO ContenidoGenero VALUES (19,3);
INSERT INTO ContenidoGenero VALUES (20,8);
INSERT INTO ContenidoGenero VALUES (20,1);
INSERT INTO ContenidoGenero VALUES (21,8);
INSERT INTO ContenidoGenero VALUES (21,1);
INSERT INTO ContenidoGenero VALUES (22,8);
INSERT INTO ContenidoGenero VALUES (22,1);
INSERT INTO ContenidoGenero VALUES (23,6);
INSERT INTO ContenidoGenero VALUES (23,3);
INSERT INTO ContenidoGenero VALUES (24,6);
INSERT INTO ContenidoGenero VALUES (24,3);
INSERT INTO ContenidoGenero VALUES (25,3);
INSERT INTO ContenidoGenero VALUES (26,3);
INSERT INTO ContenidoGenero VALUES (27,6);
INSERT INTO ContenidoGenero VALUES (28,6);
INSERT INTO ContenidoGenero VALUES (29,2);
INSERT INTO ContenidoGenero VALUES (30,2);
INSERT INTO ContenidoGenero VALUES (31,7);
INSERT INTO ContenidoGenero VALUES (31,1);
INSERT INTO ContenidoGenero VALUES (32,7);
INSERT INTO ContenidoGenero VALUES (32,1);
INSERT INTO ContenidoGenero VALUES (33,6);
INSERT INTO ContenidoGenero VALUES (33,1);
INSERT INTO ContenidoGenero VALUES (34,6);
INSERT INTO ContenidoGenero VALUES (34,1);
INSERT INTO ContenidoGenero VALUES (35,3);
INSERT INTO ContenidoGenero VALUES (36,3);
INSERT INTO ContenidoGenero VALUES (37,4);
INSERT INTO ContenidoGenero VALUES (37,7);
INSERT INTO ContenidoGenero VALUES (38,6);
INSERT INTO ContenidoGenero VALUES (38,3);
INSERT INTO ContenidoGenero VALUES (39,7);
INSERT INTO ContenidoGenero VALUES (40,2);

---------------------------------
-- FAVORITOS (40)
---------------------------------
INSERT INTO PerfilFavoritos VALUES (1,3);
INSERT INTO PerfilFavoritos VALUES (1,4);
INSERT INTO PerfilFavoritos VALUES (1,8);
INSERT INTO PerfilFavoritos VALUES (1,33);
INSERT INTO PerfilFavoritos VALUES (2,1);
INSERT INTO PerfilFavoritos VALUES (2,2);
INSERT INTO PerfilFavoritos VALUES (2,16);
INSERT INTO PerfilFavoritos VALUES (2,31);
INSERT INTO PerfilFavoritos VALUES (3,6);
INSERT INTO PerfilFavoritos VALUES (3,7);
INSERT INTO PerfilFavoritos VALUES (3,18);
INSERT INTO PerfilFavoritos VALUES (4,20);
INSERT INTO PerfilFavoritos VALUES (4,21);
INSERT INTO PerfilFavoritos VALUES (4,22);
INSERT INTO PerfilFavoritos VALUES (5,11);
INSERT INTO PerfilFavoritos VALUES (5,12);
INSERT INTO PerfilFavoritos VALUES (5,25);
INSERT INTO PerfilFavoritos VALUES (5,38);
INSERT INTO PerfilFavoritos VALUES (6,13);
INSERT INTO PerfilFavoritos VALUES (6,14);
INSERT INTO PerfilFavoritos VALUES (6,26);
INSERT INTO PerfilFavoritos VALUES (7,15);
INSERT INTO PerfilFavoritos VALUES (7,29);
INSERT INTO PerfilFavoritos VALUES (7,30);
INSERT INTO PerfilFavoritos VALUES (7,40);
INSERT INTO PerfilFavoritos VALUES (8,9);
INSERT INTO PerfilFavoritos VALUES (8,10);
INSERT INTO PerfilFavoritos VALUES (8,23);
INSERT INTO PerfilFavoritos VALUES (8,24);
INSERT INTO PerfilFavoritos VALUES (9,37);
INSERT INTO PerfilFavoritos VALUES (9,39);
INSERT INTO PerfilFavoritos VALUES (10,5);
INSERT INTO PerfilFavoritos VALUES (10,32);
INSERT INTO PerfilFavoritos VALUES (10,34);
INSERT INTO PerfilFavoritos VALUES (11,35);
INSERT INTO PerfilFavoritos VALUES (11,36);
INSERT INTO PerfilFavoritos VALUES (12,17);
INSERT INTO PerfilFavoritos VALUES (12,19);
INSERT INTO PerfilFavoritos VALUES (13,17);
INSERT INTO PerfilFavoritos VALUES (13,19);

---------------------------------
-- CALIFICACIONES (60)
---------------------------------
INSERT INTO Calificacion VALUES (1,1,3,5,'Excelente pelicula',DATE '2024-01-01');
INSERT INTO Calificacion VALUES (2,1,4,4,'Muy buena',DATE '2024-01-02');
INSERT INTO Calificacion VALUES (3,2,1,5,'Me encanto',DATE '2024-01-03');
INSERT INTO Calificacion VALUES (4,2,2,4,'Buena secuela',DATE '2024-01-04');
INSERT INTO Calificacion VALUES (5,3,6,3,'Regular',DATE '2024-01-05');
INSERT INTO Calificacion VALUES (6,3,7,4,'Bonita historia',DATE '2024-01-06');
INSERT INTO Calificacion VALUES (7,4,20,5,'Muy divertida',DATE '2024-01-07');
INSERT INTO Calificacion VALUES (8,4,21,4,'Entretenida',DATE '2024-01-08');
INSERT INTO Calificacion VALUES (9,5,11,5,'Increible documental',DATE '2024-01-09');
INSERT INTO Calificacion VALUES (10,5,12,4,'Muy interesante',DATE '2024-01-10');
INSERT INTO Calificacion VALUES (11,6,13,3,'Normal',DATE '2024-01-11');
INSERT INTO Calificacion VALUES (12,6,14,4,'Informativo',DATE '2024-01-12');
INSERT INTO Calificacion VALUES (13,7,15,5,'Excelente musica',DATE '2024-01-13');
INSERT INTO Calificacion VALUES (14,7,29,4,'Clasicos buenos',DATE '2024-01-14');
INSERT INTO Calificacion VALUES (15,8,9,4,'Buen suspenso',DATE '2024-01-15');
INSERT INTO Calificacion VALUES (16,8,10,3,'Aceptable',DATE '2024-01-16');
INSERT INTO Calificacion VALUES (17,9,37,5,'Muy intrigante',DATE '2024-01-17');
INSERT INTO Calificacion VALUES (18,9,39,4,'Interesante',DATE '2024-01-18');
INSERT INTO Calificacion VALUES (19,10,5,5,'Gran final',DATE '2024-01-19');
INSERT INTO Calificacion VALUES (20,10,32,4,'Buena',DATE '2024-01-20');
INSERT INTO Calificacion VALUES (21,11,35,3,'Regular serie',DATE '2024-01-21');
INSERT INTO Calificacion VALUES (22,11,36,4,'Mejoro',DATE '2024-01-22');
INSERT INTO Calificacion VALUES (23,12,17,2,'No me gusto',DATE '2024-01-23');
INSERT INTO Calificacion VALUES (24,12,19,3,'Normal',DATE '2024-01-24');
INSERT INTO Calificacion VALUES (25,1,8,5,'Excelente serie',DATE '2024-01-25');
INSERT INTO Calificacion VALUES (26,2,16,4,'Buen terror',DATE '2024-01-26');
INSERT INTO Calificacion VALUES (27,3,18,3,'Drama ok',DATE '2024-01-27');
INSERT INTO Calificacion VALUES (28,4,22,5,'Muy creativa',DATE '2024-01-28');
INSERT INTO Calificacion VALUES (29,5,25,4,'Buen docu',DATE '2024-01-29');
INSERT INTO Calificacion VALUES (30,6,26,5,'Muy bueno',DATE '2024-01-30');
INSERT INTO Calificacion VALUES (31,7,30,4,'Buen pop',DATE '2024-02-01');
INSERT INTO Calificacion VALUES (32,8,23,5,'Gran serie',DATE '2024-02-02');
INSERT INTO Calificacion VALUES (33,9,31,4,'Entretenido',DATE '2024-02-03');
INSERT INTO Calificacion VALUES (34,10,34,5,'Excelente',DATE '2024-02-04');
INSERT INTO Calificacion VALUES (35,11,36,3,'Regular',DATE '2024-02-05');
INSERT INTO Calificacion VALUES (36,12,40,4,'Buen mix',DATE '2024-02-06');
INSERT INTO Calificacion VALUES (37,1,33,5,'Increible',DATE '2024-02-07');
INSERT INTO Calificacion VALUES (38,2,31,3,'Normal',DATE '2024-02-08');
INSERT INTO Calificacion VALUES (39,3,7,4,'Bonita',DATE '2024-02-09');
INSERT INTO Calificacion VALUES (40,4,20,5,'Muy buena',DATE '2024-02-10');
INSERT INTO Calificacion VALUES (41,5,38,4,'Interesante',DATE '2024-02-11');
INSERT INTO Calificacion VALUES (42,6,14,3,'Ok',DATE '2024-02-12');
INSERT INTO Calificacion VALUES (43,7,29,5,'Excelente',DATE '2024-02-13');
INSERT INTO Calificacion VALUES (44,8,24,4,'Buena',DATE '2024-02-14');
INSERT INTO Calificacion VALUES (45,9,37,5,'Me encanto',DATE '2024-02-15');
INSERT INTO Calificacion VALUES (46,10,32,2,'Floja',DATE '2024-02-16');
INSERT INTO Calificacion VALUES (47,11,35,3,'Aceptable',DATE '2024-02-17');
INSERT INTO Calificacion VALUES (48,12,17,1,'Muy mala',DATE '2024-02-18');
INSERT INTO Calificacion VALUES (49,1,4,5,'Top',DATE '2024-02-19');
INSERT INTO Calificacion VALUES (50,2,2,4,'Buena',DATE '2024-02-20');
INSERT INTO Calificacion VALUES (51,3,6,3,'Normal',DATE '2024-02-21');
INSERT INTO Calificacion VALUES (52,4,21,5,'Genial',DATE '2024-02-22');
INSERT INTO Calificacion VALUES (53,5,11,4,'Muy buena',DATE '2024-02-23');
INSERT INTO Calificacion VALUES (54,6,13,2,'Aburrido',DATE '2024-02-24');
INSERT INTO Calificacion VALUES (55,7,15,5,'Perfecto',DATE '2024-02-25');
INSERT INTO Calificacion VALUES (56,8,9,4,'Buenisimo',DATE '2024-02-26');
INSERT INTO Calificacion VALUES (57,9,39,3,'Normal',DATE '2024-02-27');
INSERT INTO Calificacion VALUES (58,10,5,5,'Excelente',DATE '2024-02-28');
INSERT INTO Calificacion VALUES (59,11,36,4,'Me gusto',DATE '2024-03-01');
INSERT INTO Calificacion VALUES (60,12,40,3,'Regular',DATE '2024-03-02');

---------------------------------
-- PAGOS (80)
---------------------------------
INSERT INTO Pago VALUES (1,DATE '2024-01-10',14900,'Tarjeta de credito','PAGADO',1);
INSERT INTO Pago VALUES (2,DATE '2024-02-10',14900,'PSE','PAGADO',1);
INSERT INTO Pago VALUES (3,DATE '2024-03-10',14900,'Nequi','PAGADO',1);
INSERT INTO Pago VALUES (4,DATE '2024-02-15',24900,'Tarjeta debito','PAGADO',2);
INSERT INTO Pago VALUES (5,DATE '2024-03-15',24900,'Daviplata','FALLIDO',2);
INSERT INTO Pago VALUES (6,DATE '2024-04-15',24900,'Tarjeta de credito','PAGADO',2);
INSERT INTO Pago VALUES (7,DATE '2024-03-01',34900,'PSE','PAGADO',3);
INSERT INTO Pago VALUES (8,DATE '2024-04-01',34900,'Nequi','PENDIENTE',3);
INSERT INTO Pago VALUES (9,DATE '2024-01-05',14900,'Daviplata','FALLIDO',4);
INSERT INTO Pago VALUES (10,DATE '2024-02-01',24900,'Tarjeta de credito','PAGADO',5);
INSERT INTO Pago VALUES (11,DATE '2024-02-28',24900,'PSE','PAGADO',5);
INSERT INTO Pago VALUES (12,DATE '2024-03-28',24900,'Nequi','FALLIDO',5);
INSERT INTO Pago VALUES (13,DATE '2024-03-10',34900,'Tarjeta debito','PAGADO',6);
INSERT INTO Pago VALUES (14,DATE '2024-04-10',34900,'PSE','PAGADO',6);
INSERT INTO Pago VALUES (15,DATE '2024-02-20',14900,'Daviplata','FALLIDO',7);
INSERT INTO Pago VALUES (16,DATE '2024-01-25',24900,'Tarjeta de credito','PAGADO',8);
INSERT INTO Pago VALUES (17,DATE '2024-02-25',24900,'Nequi','PAGADO',8);
INSERT INTO Pago VALUES (18,DATE '2024-03-25',24900,'PSE','PENDIENTE',8);
INSERT INTO Pago VALUES (19,DATE '2024-03-05',34900,'Tarjeta debito','PAGADO',9);
INSERT INTO Pago VALUES (20,DATE '2024-04-05',34900,'Daviplata','PAGADO',9);
INSERT INTO Pago VALUES (21,DATE '2024-02-28',14900,'PSE','PAGADO',10);
INSERT INTO Pago VALUES (22,DATE '2024-03-28',14900,'Nequi','FALLIDO',10);
INSERT INTO Pago VALUES (23,DATE '2024-04-28',14900,'Tarjeta de credito','PAGADO',10);
INSERT INTO Pago VALUES (24,DATE '2024-01-15',24900,'Tarjeta debito','PAGADO',11);
INSERT INTO Pago VALUES (25,DATE '2024-02-15',24900,'PSE','PAGADO',11);
INSERT INTO Pago VALUES (26,DATE '2024-03-15',24900,'Nequi','FALLIDO',11);
INSERT INTO Pago VALUES (27,DATE '2024-03-12',34900,'Daviplata','FALLIDO',12);
INSERT INTO Pago VALUES (28,DATE '2024-01-20',14900,'Tarjeta de credito','PAGADO',13);
INSERT INTO Pago VALUES (29,DATE '2024-02-20',14900,'PSE','PAGADO',13);
INSERT INTO Pago VALUES (30,DATE '2024-03-20',14900,'Nequi','PAGADO',13);
INSERT INTO Pago VALUES (31,DATE '2024-02-10',24900,'Tarjeta debito','PAGADO',14);
INSERT INTO Pago VALUES (32,DATE '2024-03-10',24900,'Daviplata','PENDIENTE',14);
INSERT INTO Pago VALUES (33,DATE '2024-04-10',24900,'Tarjeta de credito','PAGADO',14);
INSERT INTO Pago VALUES (34,DATE '2024-03-18',34900,'PSE','PAGADO',15);
INSERT INTO Pago VALUES (35,DATE '2025-04-18',34900,'Nequi','PAGADO',15);
INSERT INTO Pago VALUES (36,DATE '2025-01-08',14900,'Daviplata','FALLIDO',16);
INSERT INTO Pago VALUES (37,DATE '2025-02-14',24900,'Tarjeta de credito','PAGADO',17);
INSERT INTO Pago VALUES (38,DATE '2025-03-14',24900,'PSE','PAGADO',17);
INSERT INTO Pago VALUES (39,DATE '2025-04-14',24900,'Nequi','PENDIENTE',17);
INSERT INTO Pago VALUES (40,DATE '2025-03-22',34900,'Tarjeta debito','PAGADO',18);
INSERT INTO Pago VALUES (41,DATE '2025-04-22',34900,'Daviplata','PAGADO',18);
INSERT INTO Pago VALUES (42,DATE '2025-02-05',14900,'PSE','PAGADO',19);
INSERT INTO Pago VALUES (43,DATE '2025-03-05',14900,'Nequi','FALLIDO',19);
INSERT INTO Pago VALUES (44,DATE '2025-04-05',14900,'Tarjeta de credito','PAGADO',19);
INSERT INTO Pago VALUES (45,DATE '2025-01-30',24900,'Tarjeta debito','FALLIDO',20);
INSERT INTO Pago VALUES (46,DATE '2025-01-12',34900,'PSE','PAGADO',21);
INSERT INTO Pago VALUES (47,DATE '2025-02-12',34900,'Nequi','PAGADO',21);
INSERT INTO Pago VALUES (48,DATE '2025-03-12',34900,'Daviplata','FALLIDO',21);
INSERT INTO Pago VALUES (49,DATE '2025-02-18',14900,'Tarjeta de credito','PAGADO',22);
INSERT INTO Pago VALUES (50,DATE '2025-03-18',14900,'PSE','PAGADO',22);
INSERT INTO Pago VALUES (51,DATE '2025-04-18',14900,'Nequi','PENDIENTE',22);
INSERT INTO Pago VALUES (52,DATE '2025-03-25',24900,'Tarjeta debito','PAGADO',23);
INSERT INTO Pago VALUES (53,DATE '2025-04-25',24900,'Daviplata','PAGADO',23);
INSERT INTO Pago VALUES (54,DATE '2025-02-02',34900,'PSE','FALLIDO',24);
INSERT INTO Pago VALUES (55,DATE '2025-01-28',14900,'Tarjeta de credito','PAGADO',25);
INSERT INTO Pago VALUES (56,DATE '2025-02-28',14900,'Nequi','PAGADO',25);
INSERT INTO Pago VALUES (57,DATE '2025-03-28',14900,'PSE','PAGADO',25);
INSERT INTO Pago VALUES (58,DATE '2025-03-08',24900,'Tarjeta debito','PAGADO',26);
INSERT INTO Pago VALUES (59,DATE '2025-04-08',24900,'Daviplata','PENDIENTE',26);
INSERT INTO Pago VALUES (60,DATE '2026-02-11',34900,'Tarjeta de credito','PAGADO',27);
INSERT INTO Pago VALUES (61,DATE '2026-03-11',34900,'PSE','PAGADO',27);
INSERT INTO Pago VALUES (62,DATE '2026-04-11',34900,'Nequi','PAGADO',27);
INSERT INTO Pago VALUES (63,DATE '2026-01-18',14900,'Daviplata','FALLIDO',28);
INSERT INTO Pago VALUES (64,DATE '2026-02-27',24900,'Tarjeta de credito','PAGADO',29);
INSERT INTO Pago VALUES (65,DATE '2026-03-27',24900,'PSE','PAGADO',29);
INSERT INTO Pago VALUES (66,DATE '2026-04-27',24900,'Nequi','PENDIENTE',29);
INSERT INTO Pago VALUES (67,DATE '2026-03-30',34900,'Tarjeta debito','PAGADO',30);
INSERT INTO Pago VALUES (68,DATE '2026-04-30',34900,'Daviplata','PAGADO',30);
INSERT INTO Pago VALUES (69,DATE '2026-05-10',14900,'PSE','PAGADO',1);
INSERT INTO Pago VALUES (70,DATE '2026-05-15',24900,'Tarjeta de credito','PAGADO',2);
INSERT INTO Pago VALUES (71,DATE '2026-05-01',34900,'Nequi','PENDIENTE',3);
INSERT INTO Pago VALUES (72,DATE '2026-05-28',24900,'Daviplata','PAGADO',5);
INSERT INTO Pago VALUES (73,DATE '2026-05-10',34900,'Tarjeta debito','PAGADO',6);
INSERT INTO Pago VALUES (74,DATE '2026-05-25',24900,'PSE','PAGADO',8);
INSERT INTO Pago VALUES (75,DATE '2026-05-05',34900,'Nequi','PAGADO',9);
INSERT INTO Pago VALUES (76,DATE '2026-05-28',14900,'Tarjeta de credito','FALLIDO',10);
INSERT INTO Pago VALUES (77,DATE '2026-05-15',24900,'PSE','PAGADO',11);
INSERT INTO Pago VALUES (78,DATE '2026-05-20',14900,'Nequi','PAGADO',13);
INSERT INTO Pago VALUES (79,DATE '2026-05-10',24900,'Daviplata','PENDIENTE',14);
INSERT INTO Pago VALUES (80,DATE '2026-05-18',34900,'Tarjeta debito','PAGADO',15);

---------------------------------
-- REPRODUCCIONES (200)
---------------------------------
INSERT INTO Reproduccion VALUES (1,TO_DATE('2025-01-01 10:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-01 11:45:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,1,1,NULL);
INSERT INTO Reproduccion VALUES (2,TO_DATE('2025-01-02 14:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-02 15:20:00','YYYY-MM-DD HH24:MI:SS'),'celular',80,8,2,1);
INSERT INTO Reproduccion VALUES (3,TO_DATE('2025-01-03 16:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-03 16:50:00','YYYY-MM-DD HH24:MI:SS'),'tablet',60,9,3,2);
INSERT INTO Reproduccion VALUES (4,TO_DATE('2025-01-04 09:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-04 11:10:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,2,4,NULL);
INSERT INTO Reproduccion VALUES (5,TO_DATE('2025-01-05 20:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-05 21:30:00','YYYY-MM-DD HH24:MI:SS'),'TV',90,10,5,9);
INSERT INTO Reproduccion VALUES (6,TO_DATE('2025-01-06 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-06 14:10:00','YYYY-MM-DD HH24:MI:SS'),'celular',70,13,6,41);
INSERT INTO Reproduccion VALUES (7,TO_DATE('2025-01-07 18:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-07 18:45:00','YYYY-MM-DD HH24:MI:SS'),'tablet',50,14,7,43);
INSERT INTO Reproduccion VALUES (8,TO_DATE('2026-01-08 21:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-08 22:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,3,8,NULL);
INSERT INTO Reproduccion VALUES (9,TO_DATE('2025-01-09 19:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-09 20:50:00','YYYY-MM-DD HH24:MI:SS'),'TV',85,18,9,37);
INSERT INTO Reproduccion VALUES (10,TO_DATE('2026-01-10 11:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-10 12:30:00','YYYY-MM-DD HH24:MI:SS'),'celular',95,19,10,46);
INSERT INTO Reproduccion VALUES (11,TO_DATE('2025-01-11 08:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-11 09:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,4,1,NULL);
INSERT INTO Reproduccion VALUES (12,TO_DATE('2026-01-12 15:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-12 16:05:00','YYYY-MM-DD HH24:MI:SS'),'PC',65,23,2,41);
INSERT INTO Reproduccion VALUES (13,TO_DATE('2025-01-13 17:20:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-13 18:35:00','YYYY-MM-DD HH24:MI:SS'),'TV',75,24,3,42);
INSERT INTO Reproduccion VALUES (14,TO_DATE('2025-01-14 12:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-14 13:50:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,5,4,NULL);
INSERT INTO Reproduccion VALUES (15,TO_DATE('2026-01-15 10:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-15 11:05:00','YYYY-MM-DD HH24:MI:SS'),'tablet',55,37,5,37);
INSERT INTO Reproduccion VALUES (16,TO_DATE('2026-01-16 14:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-16 15:00:00','YYYY-MM-DD HH24:MI:SS'),'PC',60,39,6,43);
INSERT INTO Reproduccion VALUES (17,TO_DATE('2026-01-17 20:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-17 22:00:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,6,7,NULL);
INSERT INTO Reproduccion VALUES (18,TO_DATE('2026-01-18 09:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-18 10:20:00','YYYY-MM-DD HH24:MI:SS'),'celular',85,8,8,2);
INSERT INTO Reproduccion VALUES (19,TO_DATE('2025-01-19 16:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-19 18:05:00','YYYY-MM-DD HH24:MI:SS'),'tablet',95,6,9,3);
INSERT INTO Reproduccion VALUES (20,TO_DATE('2026-06-20 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-06-20 14:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,7,10,NULL);
INSERT INTO Reproduccion VALUES (21,TO_DATE('2025-01-12 11:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-12 12:05:00','YYYY-MM-DD HH24:MI:SS'),'TV',88,20,1,NULL);
INSERT INTO Reproduccion VALUES (22,TO_DATE('2025-03-28 14:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-03-28 15:45:00','YYYY-MM-DD HH24:MI:SS'),'celular',77,23,2,44);
INSERT INTO Reproduccion VALUES (23,TO_DATE('2025-07-03 18:20:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-07-03 19:10:00','YYYY-MM-DD HH24:MI:SS'),'tablet',66,24,3,45);
INSERT INTO Reproduccion VALUES (24,TO_DATE('2025-02-17 09:05:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-02-17 10:55:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,21,4,NULL);
INSERT INTO Reproduccion VALUES (25,TO_DATE('2025-05-30 20:15:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-05-30 21:10:00','YYYY-MM-DD HH24:MI:SS'),'TV',91,35,5,37);
INSERT INTO Reproduccion VALUES (26,TO_DATE('2025-12-01 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-12-01 14:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',73,36,6,39);
INSERT INTO Reproduccion VALUES (27,TO_DATE('2025-04-22 17:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-04-22 18:05:00','YYYY-MM-DD HH24:MI:SS'),'tablet',84,20,7,40);
INSERT INTO Reproduccion VALUES (28,TO_DATE('2025-09-09 08:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-09-09 09:50:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,22,8,NULL);
INSERT INTO Reproduccion VALUES (29,TO_DATE('2025-11-14 19:25:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-11-14 20:00:00','YYYY-MM-DD HH24:MI:SS'),'TV',62,13,9,41);
INSERT INTO Reproduccion VALUES (30,TO_DATE('2025-06-06 12:40:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-06-06 13:20:00','YYYY-MM-DD HH24:MI:SS'),'celular',58,14,10,43);
INSERT INTO Reproduccion VALUES (31,TO_DATE('2025-08-18 07:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-18 08:25:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,11,1,NULL);
INSERT INTO Reproduccion VALUES (32,TO_DATE('2025-10-27 15:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-10-27 16:00:00','YYYY-MM-DD HH24:MI:SS'),'PC',79,18,2,38);
INSERT INTO Reproduccion VALUES (33,TO_DATE('2025-01-03 21:15:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-03 22:30:00','YYYY-MM-DD HH24:MI:SS'),'TV',68,19,3,46);
INSERT INTO Reproduccion VALUES (34,TO_DATE('2025-03-11 10:05:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-03-11 11:25:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,12,4,NULL);
INSERT INTO Reproduccion VALUES (35,TO_DATE('2025-07-25 13:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-07-25 14:00:00','YYYY-MM-DD HH24:MI:SS'),'tablet',83,8,5,3);
INSERT INTO Reproduccion VALUES (36,TO_DATE('2025-02-02 18:45:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-02-02 19:30:00','YYYY-MM-DD HH24:MI:SS'),'PC',72,9,6,4);
INSERT INTO Reproduccion VALUES (37,TO_DATE('2025-05-08 20:05:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-05-08 21:55:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,25,7,NULL);
INSERT INTO Reproduccion VALUES (38,TO_DATE('2025-12-19 11:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-12-19 12:10:00','YYYY-MM-DD HH24:MI:SS'),'celular',67,26,8,NULL);
INSERT INTO Reproduccion VALUES (39,TO_DATE('2025-04-05 16:20:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-04-05 17:00:00','YYYY-MM-DD HH24:MI:SS'),'tablet',94,27,9,41);
INSERT INTO Reproduccion VALUES (40,TO_DATE('2025-09-30 09:35:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-09-30 10:20:00','YYYY-MM-DD HH24:MI:SS'),'PC',88,28,10,42);
INSERT INTO Reproduccion VALUES (41,TO_DATE('2025-01-15 20:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-15 21:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,29,1,NULL);
INSERT INTO Reproduccion VALUES (42,TO_DATE('2025-01-22 14:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-22 15:16:00','YYYY-MM-DD HH24:MI:SS'),'celular',76,30,2,NULL);
INSERT INTO Reproduccion VALUES (43,TO_DATE('2025-02-05 17:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-02-05 18:05:00','YYYY-MM-DD HH24:MI:SS'),'tablet',65,31,3,NULL);
INSERT INTO Reproduccion VALUES (44,TO_DATE('2025-02-18 08:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-02-18 10:10:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,32,4,NULL);
INSERT INTO Reproduccion VALUES (45,TO_DATE('2025-03-07 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-03-07 20:22:00','YYYY-MM-DD HH24:MI:SS'),'TV',82,33,5,NULL);
INSERT INTO Reproduccion VALUES (46,TO_DATE('2025-03-14 12:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-03-14 13:11:00','YYYY-MM-DD HH24:MI:SS'),'celular',71,34,6,NULL);
INSERT INTO Reproduccion VALUES (47,TO_DATE('2025-03-21 18:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-03-21 19:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,35,7,37);
INSERT INTO Reproduccion VALUES (48,TO_DATE('2025-03-28 09:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-03-28 10:09:00','YYYY-MM-DD HH24:MI:SS'),'PC',69,36,8,39);
INSERT INTO Reproduccion VALUES (49,TO_DATE('2025-04-03 20:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-04-03 21:33:00','YYYY-MM-DD HH24:MI:SS'),'TV',93,20,9,40);
INSERT INTO Reproduccion VALUES (50,TO_DATE('2025-04-11 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-04-11 14:27:00','YYYY-MM-DD HH24:MI:SS'),'celular',87,38,10,NULL);
INSERT INTO Reproduccion VALUES (51,TO_DATE('2025-04-19 08:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-04-19 09:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,1,1,NULL);
INSERT INTO Reproduccion VALUES (52,TO_DATE('2025-04-26 14:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-04-26 15:18:00','YYYY-MM-DD HH24:MI:SS'),'PC',78,8,2,5);
INSERT INTO Reproduccion VALUES (53,TO_DATE('2025-05-02 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-05-02 20:07:00','YYYY-MM-DD HH24:MI:SS'),'TV',67,9,3,6);
INSERT INTO Reproduccion VALUES (54,TO_DATE('2025-05-09 10:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-05-09 11:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,2,4,NULL);
INSERT INTO Reproduccion VALUES (55,TO_DATE('2025-05-16 21:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-05-16 22:32:00','YYYY-MM-DD HH24:MI:SS'),'tablet',92,10,5,10);
INSERT INTO Reproduccion VALUES (56,TO_DATE('2025-05-23 13:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-05-23 14:44:00','YYYY-MM-DD HH24:MI:SS'),'PC',74,13,6,44);
INSERT INTO Reproduccion VALUES (57,TO_DATE('2025-05-30 17:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-05-30 18:03:00','YYYY-MM-DD HH24:MI:SS'),'TV',63,14,7,45);
INSERT INTO Reproduccion VALUES (58,TO_DATE('2025-06-04 09:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-06-04 10:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,3,8,NULL);
INSERT INTO Reproduccion VALUES (59,TO_DATE('2025-06-12 18:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-06-12 19:26:00','YYYY-MM-DD HH24:MI:SS'),'tablet',86,18,9,38);
INSERT INTO Reproduccion VALUES (60,TO_DATE('2025-06-20 11:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-06-20 12:37:00','YYYY-MM-DD HH24:MI:SS'),'PC',97,19,10,47);
INSERT INTO Reproduccion VALUES (61,TO_DATE('2025-07-03 08:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-07-03 10:10:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,4,1,NULL);
INSERT INTO Reproduccion VALUES (62,TO_DATE('2025-07-11 14:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-07-11 15:09:00','YYYY-MM-DD HH24:MI:SS'),'celular',69,23,2,41);
INSERT INTO Reproduccion VALUES (63,TO_DATE('2025-07-18 16:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-07-18 17:45:00','YYYY-MM-DD HH24:MI:SS'),'tablet',75,24,3,42);
INSERT INTO Reproduccion VALUES (64,TO_DATE('2025-07-25 09:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-07-25 10:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,5,4,NULL);
INSERT INTO Reproduccion VALUES (65,TO_DATE('2025-08-01 20:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-01 20:58:00','YYYY-MM-DD HH24:MI:SS'),'TV',58,37,5,37);
INSERT INTO Reproduccion VALUES (66,TO_DATE('2025-08-08 12:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-08 13:01:00','YYYY-MM-DD HH24:MI:SS'),'celular',61,39,6,43);
INSERT INTO Reproduccion VALUES (67,TO_DATE('2025-08-15 18:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-15 20:10:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,6,7,NULL);
INSERT INTO Reproduccion VALUES (68,TO_DATE('2025-08-22 10:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-22 11:24:00','YYYY-MM-DD HH24:MI:SS'),'PC',84,8,8,3);
INSERT INTO Reproduccion VALUES (69,TO_DATE('2025-08-29 19:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-29 21:03:00','YYYY-MM-DD HH24:MI:SS'),'TV',93,20,9,4);
INSERT INTO Reproduccion VALUES (70,TO_DATE('2025-09-05 08:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-09-05 09:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,7,10,NULL);
INSERT INTO Reproduccion VALUES (71,TO_DATE('2025-09-12 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-09-12 14:29:00','YYYY-MM-DD HH24:MI:SS'),'tablet',89,20,1,NULL);
INSERT INTO Reproduccion VALUES (72,TO_DATE('2025-10-07 15:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-10-07 16:17:00','YYYY-MM-DD HH24:MI:SS'),'PC',77,23,2,44);
INSERT INTO Reproduccion VALUES (73,TO_DATE('2025-10-14 18:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-10-14 19:06:00','YYYY-MM-DD HH24:MI:SS'),'TV',66,24,3,45);
INSERT INTO Reproduccion VALUES (74,TO_DATE('2025-11-02 11:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-11-02 12:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,21,4,NULL);
INSERT INTO Reproduccion VALUES (75,TO_DATE('2025-11-09 20:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-11-09 21:31:00','YYYY-MM-DD HH24:MI:SS'),'tablet',91,35,5,37);
INSERT INTO Reproduccion VALUES (76,TO_DATE('2025-11-16 14:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-11-16 15:13:00','YYYY-MM-DD HH24:MI:SS'),'PC',73,36,6,39);
INSERT INTO Reproduccion VALUES (77,TO_DATE('2025-12-05 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-12-05 20:22:00','YYYY-MM-DD HH24:MI:SS'),'TV',82,20,7,40);
INSERT INTO Reproduccion VALUES (78,TO_DATE('2025-12-12 09:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-12-12 11:10:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,22,8,NULL);
INSERT INTO Reproduccion VALUES (79,TO_DATE('2025-12-19 16:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-12-19 17:04:00','YYYY-MM-DD HH24:MI:SS'),'tablet',64,13,9,41);
INSERT INTO Reproduccion VALUES (80,TO_DATE('2024-01-20 10:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-20 10:59:00','YYYY-MM-DD HH24:MI:SS'),'PC',59,14,35,43);
INSERT INTO Reproduccion VALUES (81,TO_DATE('2024-01-21 20:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-21 21:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,11,36,NULL);
INSERT INTO Reproduccion VALUES (82,TO_DATE('2024-01-22 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-22 14:19:00','YYYY-MM-DD HH24:MI:SS'),'celular',79,18,37,38);
INSERT INTO Reproduccion VALUES (83,TO_DATE('2024-01-23 18:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-23 19:08:00','YYYY-MM-DD HH24:MI:SS'),'tablet',68,19,38,47);
INSERT INTO Reproduccion VALUES (84,TO_DATE('2024-01-24 09:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-24 10:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,12,39,NULL);
INSERT INTO Reproduccion VALUES (85,TO_DATE('2024-01-25 21:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-25 22:23:00','YYYY-MM-DD HH24:MI:SS'),'TV',83,8,40,5);
INSERT INTO Reproduccion VALUES (86,TO_DATE('2024-01-26 14:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-26 15:12:00','YYYY-MM-DD HH24:MI:SS'),'celular',72,20,41,6);
INSERT INTO Reproduccion VALUES (87,TO_DATE('2024-01-27 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-27 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,25,42,NULL);
INSERT INTO Reproduccion VALUES (88,TO_DATE('2024-01-28 11:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-28 12:07:00','YYYY-MM-DD HH24:MI:SS'),'PC',67,26,43,NULL);
INSERT INTO Reproduccion VALUES (89,TO_DATE('2024-01-29 20:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-29 21:34:00','YYYY-MM-DD HH24:MI:SS'),'TV',94,27,44,41);
INSERT INTO Reproduccion VALUES (90,TO_DATE('2024-01-30 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-30 14:28:00','YYYY-MM-DD HH24:MI:SS'),'celular',88,28,45,42);
INSERT INTO Reproduccion VALUES (91,TO_DATE('2024-01-01 08:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-01 09:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,29,46,NULL);
INSERT INTO Reproduccion VALUES (92,TO_DATE('2024-01-02 10:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-02 11:16:00','YYYY-MM-DD HH24:MI:SS'),'PC',76,30,47,NULL);
INSERT INTO Reproduccion VALUES (93,TO_DATE('2024-01-03 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-03 20:05:00','YYYY-MM-DD HH24:MI:SS'),'TV',65,31,48,NULL);
INSERT INTO Reproduccion VALUES (94,TO_DATE('2024-01-04 09:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-04 11:10:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,32,49,NULL);
INSERT INTO Reproduccion VALUES (95,TO_DATE('2024-01-05 14:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-05 15:22:00','YYYY-MM-DD HH24:MI:SS'),'tablet',82,33,50,NULL);
INSERT INTO Reproduccion VALUES (96,TO_DATE('2024-01-06 18:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-06 19:11:00','YYYY-MM-DD HH24:MI:SS'),'PC',71,34,35,NULL);
INSERT INTO Reproduccion VALUES (97,TO_DATE('2024-01-07 20:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-07 21:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,35,36,37);
INSERT INTO Reproduccion VALUES (98,TO_DATE('2024-01-08 12:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-08 13:09:00','YYYY-MM-DD HH24:MI:SS'),'celular',69,36,37,39);
INSERT INTO Reproduccion VALUES (99,TO_DATE('2024-01-09 17:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-01-09 18:33:00','YYYY-MM-DD HH24:MI:SS'),'tablet',93,37,38,40);
INSERT INTO Reproduccion VALUES (100,TO_DATE('2025-01-10 09:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-10 10:27:00','YYYY-MM-DD HH24:MI:SS'),'PC',87,38,39,NULL);
INSERT INTO Reproduccion VALUES (101,TO_DATE('2025-01-18 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-18 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,1,40,NULL);
INSERT INTO Reproduccion VALUES (102,TO_DATE('2025-02-05 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-02-05 20:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',79,20,41,6);
INSERT INTO Reproduccion VALUES (103,TO_DATE('2025-02-14 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-02-14 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',68,9,42,7);
INSERT INTO Reproduccion VALUES (104,TO_DATE('2025-02-22 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-02-22 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,2,43,NULL);
INSERT INTO Reproduccion VALUES (105,TO_DATE('2025-03-03 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-03-03 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',91,20,44,11);
INSERT INTO Reproduccion VALUES (106,TO_DATE('2025-03-11 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-03-11 20:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',73,13,45,45);
INSERT INTO Reproduccion VALUES (107,TO_DATE('2025-03-19 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-03-19 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',62,14,46,46);
INSERT INTO Reproduccion VALUES (108,TO_DATE('2025-03-27 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-03-27 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,3,47,NULL);
INSERT INTO Reproduccion VALUES (109,TO_DATE('2025-04-02 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-04-02 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',87,18,48,39);
INSERT INTO Reproduccion VALUES (110,TO_DATE('2025-04-10 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-04-10 20:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',96,19,49,48);
INSERT INTO Reproduccion VALUES (111,TO_DATE('2025-04-18 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-04-18 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,4,50,NULL);
INSERT INTO Reproduccion VALUES (112,TO_DATE('2025-04-26 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-04-26 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',70,23,35,41);
INSERT INTO Reproduccion VALUES (113,TO_DATE('2025-05-04 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-05-04 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',76,24,36,42);
INSERT INTO Reproduccion VALUES (114,TO_DATE('2025-05-12 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-05-12 20:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,5,37,NULL);
INSERT INTO Reproduccion VALUES (115,TO_DATE('2025-05-20 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-05-20 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',59,37,38,37);
INSERT INTO Reproduccion VALUES (116,TO_DATE('2025-05-28 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-05-28 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',63,39,39,43);
INSERT INTO Reproduccion VALUES (117,TO_DATE('2025-06-05 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-06-05 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,6,40,NULL);
INSERT INTO Reproduccion VALUES (118,TO_DATE('2025-06-13 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-06-13 20:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',85,20,41,4);
INSERT INTO Reproduccion VALUES (119,TO_DATE('2025-06-21 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-06-21 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',94,9,42,5);
INSERT INTO Reproduccion VALUES (120,TO_DATE('2025-06-29 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-06-29 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,7,43,NULL);
INSERT INTO Reproduccion VALUES (121,TO_DATE('2025-07-07 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-07-07 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',90,20,44,NULL);
INSERT INTO Reproduccion VALUES (122,TO_DATE('2025-07-15 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-07-15 20:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',78,23,45,44);
INSERT INTO Reproduccion VALUES (123,TO_DATE('2025-07-23 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-07-23 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',67,24,46,45);
INSERT INTO Reproduccion VALUES (124,TO_DATE('2025-07-31 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-07-31 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,21,47,NULL);
INSERT INTO Reproduccion VALUES (125,TO_DATE('2025-08-08 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-08 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',92,35,48,37);
INSERT INTO Reproduccion VALUES (126,TO_DATE('2026-01-08 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-08 20:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',74,36,49,39);
INSERT INTO Reproduccion VALUES (127,TO_DATE('2026-01-16 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-16 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',83,20,50,40);
INSERT INTO Reproduccion VALUES (128,TO_DATE('2026-02-03 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-02-03 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,22,35,NULL);
INSERT INTO Reproduccion VALUES (129,TO_DATE('2026-02-11 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-02-11 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',65,13,9,41);
INSERT INTO Reproduccion VALUES (130,TO_DATE('2026-02-19 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-02-19 20:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',60,14,10,43);
INSERT INTO Reproduccion VALUES (131,TO_DATE('2026-03-02 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-03-02 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,11,1,NULL);
INSERT INTO Reproduccion VALUES (132,TO_DATE('2026-03-10 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-03-10 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',80,18,2,38);
INSERT INTO Reproduccion VALUES (133,TO_DATE('2026-03-18 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-03-18 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',69,19,3,48);
INSERT INTO Reproduccion VALUES (134,TO_DATE('2026-03-26 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-03-26 20:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,12,4,NULL);
INSERT INTO Reproduccion VALUES (135,TO_DATE('2026-04-03 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-04-03 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',84,8,5,6);
INSERT INTO Reproduccion VALUES (136,TO_DATE('2026-04-11 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-04-11 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',73,9,6,7);
INSERT INTO Reproduccion VALUES (137,TO_DATE('2026-04-19 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-04-19 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,25,7,NULL);
INSERT INTO Reproduccion VALUES (138,TO_DATE('2026-04-27 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-04-27 20:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',68,26,8,NULL);
INSERT INTO Reproduccion VALUES (139,TO_DATE('2026-05-05 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-05-05 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',95,27,9,41);
INSERT INTO Reproduccion VALUES (140,TO_DATE('2026-05-13 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-05-13 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',89,28,10,42);
INSERT INTO Reproduccion VALUES (141,TO_DATE('2026-05-21 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-05-21 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,29,1,NULL);
INSERT INTO Reproduccion VALUES (142,TO_DATE('2026-05-29 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-05-29 20:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',77,30,2,NULL);
INSERT INTO Reproduccion VALUES (143,TO_DATE('2026-06-06 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-06-06 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',66,31,3,NULL);
INSERT INTO Reproduccion VALUES (144,TO_DATE('2026-06-14 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-06-14 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,32,4,NULL);
INSERT INTO Reproduccion VALUES (145,TO_DATE('2026-06-22 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-06-22 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',83,33,5,NULL);
INSERT INTO Reproduccion VALUES (146,TO_DATE('2026-06-30 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-06-30 20:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',72,34,6,NULL);
INSERT INTO Reproduccion VALUES (147,TO_DATE('2026-07-08 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-07-08 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,35,7,37);
INSERT INTO Reproduccion VALUES (148,TO_DATE('2026-07-16 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-07-16 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',70,36,8,39);
INSERT INTO Reproduccion VALUES (149,TO_DATE('2026-07-24 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-07-24 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',94,20,9,40);
INSERT INTO Reproduccion VALUES (150,TO_DATE('2026-08-01 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-08-01 20:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',88,38,10,NULL);
INSERT INTO Reproduccion VALUES (151,TO_DATE('2026-08-09 18:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-08-09 20:25:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,16,1,NULL);
INSERT INTO Reproduccion VALUES (152,TO_DATE('2026-08-17 20:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-08-17 21:35:00','YYYY-MM-DD HH24:MI:SS'),'TV',82,8,2,7);
INSERT INTO Reproduccion VALUES (153,TO_DATE('2026-08-25 17:50:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-08-25 18:55:00','YYYY-MM-DD HH24:MI:SS'),'celular',74,9,3,8);
INSERT INTO Reproduccion VALUES (154,TO_DATE('2026-09-02 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-09-02 21:00:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,17,4,NULL);
INSERT INTO Reproduccion VALUES (155,TO_DATE('2026-09-10 21:15:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-09-10 22:45:00','YYYY-MM-DD HH24:MI:SS'),'PC',91,10,5,12);
INSERT INTO Reproduccion VALUES (156,TO_DATE('2026-09-18 18:40:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-09-18 19:35:00','YYYY-MM-DD HH24:MI:SS'),'TV',69,13,6,46);
INSERT INTO Reproduccion VALUES (157,TO_DATE('2026-09-26 16:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-09-26 17:15:00','YYYY-MM-DD HH24:MI:SS'),'celular',58,14,7,47);
INSERT INTO Reproduccion VALUES (158,TO_DATE('2026-10-04 20:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-10-04 22:05:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,22,8,NULL);
INSERT INTO Reproduccion VALUES (159,TO_DATE('2026-10-12 19:20:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-10-12 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',86,18,9,40);
INSERT INTO Reproduccion VALUES (160,TO_DATE('2026-10-20 21:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-10-20 22:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',95,19,10,49);
INSERT INTO Reproduccion VALUES (161,TO_DATE('2026-10-28 18:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-10-28 20:00:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,20,1,NULL);
INSERT INTO Reproduccion VALUES (162,TO_DATE('2026-11-05 17:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-11-05 18:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',73,23,2,41);
INSERT INTO Reproduccion VALUES (163,TO_DATE('2026-11-13 19:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-11-13 20:05:00','YYYY-MM-DD HH24:MI:SS'),'PC',68,24,3,42);
INSERT INTO Reproduccion VALUES (164,TO_DATE('2026-11-21 20:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-11-21 22:20:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,21,4,NULL);
INSERT INTO Reproduccion VALUES (165,TO_DATE('2026-11-29 16:50:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-11-29 17:40:00','YYYY-MM-DD HH24:MI:SS'),'celular',62,37,5,37);
INSERT INTO Reproduccion VALUES (166,TO_DATE('2026-12-07 18:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-12-07 19:00:00','YYYY-MM-DD HH24:MI:SS'),'tablet',66,39,6,43);
INSERT INTO Reproduccion VALUES (167,TO_DATE('2026-12-15 19:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-12-15 21:25:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,25,7,NULL);
INSERT INTO Reproduccion VALUES (168,TO_DATE('2026-12-23 20:15:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-12-23 21:35:00','YYYY-MM-DD HH24:MI:SS'),'TV',84,8,8,5);
INSERT INTO Reproduccion VALUES (169,TO_DATE('2026-01-02 18:45:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-02 20:10:00','YYYY-MM-DD HH24:MI:SS'),'celular',92,20,9,6);
INSERT INTO Reproduccion VALUES (170,TO_DATE('2026-01-24 21:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-24 23:00:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,26,10,NULL);
INSERT INTO Reproduccion VALUES (171,TO_DATE('2026-02-07 19:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-02-07 20:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',89,27,1,41);
INSERT INTO Reproduccion VALUES (172,TO_DATE('2026-02-27 17:40:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-02-27 18:50:00','YYYY-MM-DD HH24:MI:SS'),'TV',77,28,2,42);
INSERT INTO Reproduccion VALUES (173,TO_DATE('2026-03-07 16:20:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-03-07 17:10:00','YYYY-MM-DD HH24:MI:SS'),'celular',65,29,3,NULL);
INSERT INTO Reproduccion VALUES (174,TO_DATE('2026-03-22 20:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-03-22 22:05:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,30,4,NULL);
INSERT INTO Reproduccion VALUES (175,TO_DATE('2026-04-05 19:25:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-04-05 20:45:00','YYYY-MM-DD HH24:MI:SS'),'PC',83,31,5,NULL);
INSERT INTO Reproduccion VALUES (176,TO_DATE('2026-04-23 18:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-04-23 19:05:00','YYYY-MM-DD HH24:MI:SS'),'TV',71,32,6,NULL);
INSERT INTO Reproduccion VALUES (177,TO_DATE('2026-05-08 21:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-05-08 23:05:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,33,7,NULL);
INSERT INTO Reproduccion VALUES (178,TO_DATE('2026-05-25 17:50:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-05-25 18:50:00','YYYY-MM-DD HH24:MI:SS'),'tablet',69,34,8,NULL);
INSERT INTO Reproduccion VALUES (179,TO_DATE('2026-06-09 19:40:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-06-09 21:10:00','YYYY-MM-DD HH24:MI:SS'),'PC',94,35,9,37);
INSERT INTO Reproduccion VALUES (180,TO_DATE('2026-06-26 20:20:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-06-26 21:45:00','YYYY-MM-DD HH24:MI:SS'),'TV',88,36,10,39);
INSERT INTO Reproduccion VALUES (181,TO_DATE('2026-07-10 18:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-07-10 20:30:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,37,1,40);
INSERT INTO Reproduccion VALUES (182,TO_DATE('2026-07-28 17:15:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-07-28 18:30:00','YYYY-MM-DD HH24:MI:SS'),'tablet',78,38,2,NULL);
INSERT INTO Reproduccion VALUES (183,TO_DATE('2026-08-11 16:40:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-08-11 17:30:00','YYYY-MM-DD HH24:MI:SS'),'PC',67,1,3,NULL);
INSERT INTO Reproduccion VALUES (184,TO_DATE('2026-08-29 20:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-08-29 22:05:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,2,4,NULL);
INSERT INTO Reproduccion VALUES (185,TO_DATE('2026-09-12 19:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-09-12 20:25:00','YYYY-MM-DD HH24:MI:SS'),'celular',85,3,5,NULL);
INSERT INTO Reproduccion VALUES (186,TO_DATE('2026-09-30 17:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-09-30 18:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',74,4,6,NULL);
INSERT INTO Reproduccion VALUES (187,TO_DATE('2026-10-14 21:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-10-14 23:05:00','YYYY-MM-DD HH24:MI:SS'),'PC',100,5,7,NULL);
INSERT INTO Reproduccion VALUES (188,TO_DATE('2026-11-01 19:20:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-11-01 20:40:00','YYYY-MM-DD HH24:MI:SS'),'TV',82,6,8,NULL);
INSERT INTO Reproduccion VALUES (189,TO_DATE('2026-11-19 18:50:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-11-19 20:20:00','YYYY-MM-DD HH24:MI:SS'),'celular',91,7,9,NULL);
INSERT INTO Reproduccion VALUES (190,TO_DATE('2026-12-03 20:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-12-03 22:05:00','YYYY-MM-DD HH24:MI:SS'),'tablet',100,8,10,6);
INSERT INTO Reproduccion VALUES (191,TO_DATE('2026-12-21 17:40:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-12-21 18:55:00','YYYY-MM-DD HH24:MI:SS'),'PC',79,9,1,7);
INSERT INTO Reproduccion VALUES (192,TO_DATE('2026-01-10 16:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-01-10 17:35:00','YYYY-MM-DD HH24:MI:SS'),'TV',68,10,2,12);
INSERT INTO Reproduccion VALUES (193,TO_DATE('2026-02-15 20:20:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-02-15 22:20:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,11,3,NULL);
INSERT INTO Reproduccion VALUES (194,TO_DATE('2026-03-14 19:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-03-14 20:40:00','YYYY-MM-DD HH24:MI:SS'),'tablet',86,12,4,NULL);
INSERT INTO Reproduccion VALUES (195,TO_DATE('2026-04-15 18:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-04-15 19:15:00','YYYY-MM-DD HH24:MI:SS'),'PC',75,13,5,41);
INSERT INTO Reproduccion VALUES (196,TO_DATE('2026-05-17 17:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-05-17 18:05:00','YYYY-MM-DD HH24:MI:SS'),'TV',64,14,6,42);
INSERT INTO Reproduccion VALUES (197,TO_DATE('2026-06-18 21:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-06-18 23:05:00','YYYY-MM-DD HH24:MI:SS'),'celular',100,15,7,NULL);
INSERT INTO Reproduccion VALUES (198,TO_DATE('2026-07-20 19:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-07-20 20:50:00','YYYY-MM-DD HH24:MI:SS'),'tablet',83,16,8,NULL);
INSERT INTO Reproduccion VALUES (199,TO_DATE('2026-08-21 20:10:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-08-21 21:40:00','YYYY-MM-DD HH24:MI:SS'),'PC',92,17,9,NULL);
INSERT INTO Reproduccion VALUES (200,TO_DATE('2026-10-23 18:20:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-10-23 20:25:00','YYYY-MM-DD HH24:MI:SS'),'TV',100,18,10,39);

---------------------------------
-- REPORTES (25)
---------------------------------
INSERT INTO Reporte VALUES (1,'Error de audio','CERRADO',DATE '2025-05-01',DATE '2025-05-02',5,3,16);
INSERT INTO Reporte VALUES (2,'Subtitulos desincronizados','EN_PROCESO',DATE '2025-05-02',NULL,8,7,17);
INSERT INTO Reporte VALUES (3,'Pantalla en negro','CERRADO',DATE '2025-05-03',DATE '2025-05-04',12,2,18);
INSERT INTO Reporte VALUES (4,'No carga contenido','ABIERTO',DATE '2025-05-04',NULL,3,9,19);
INSERT INTO Reporte VALUES (5,'Error de idioma','CERRADO',DATE '2025-05-05',DATE '2025-05-06',15,4,20);
INSERT INTO Reporte VALUES (6,'Audio muy bajo','EN_PROCESO',DATE '2025-05-06',NULL,6,1,16);
INSERT INTO Reporte VALUES (7,'Problema de buffer','CERRADO',DATE '2025-05-07',DATE '2025-05-08',9,5,17);
INSERT INTO Reporte VALUES (8,'Falla al reproducir','ABIERTO',DATE '2025-05-08',NULL,20,6,18);
INSERT INTO Reporte VALUES (9,'Imagen pixelada','CERRADO',DATE '2025-05-09',DATE '2025-05-10',11,8,19);
INSERT INTO Reporte VALUES (10,'Error de conexion','EN_PROCESO',DATE '2025-05-10',NULL,2,10,20);
INSERT INTO Reporte VALUES (11,'Contenido incorrecto','CERRADO',DATE '2025-05-11',DATE '2025-05-12',18,11,16);
INSERT INTO Reporte VALUES (12,'No guarda progreso','ABIERTO',DATE '2025-05-12',NULL,7,12,17);
INSERT INTO Reporte VALUES (13,'App se cierra','CERRADO',DATE '2025-05-13',DATE '2025-05-14',4,13,18);
INSERT INTO Reporte VALUES (14,'Error en subtitulos','EN_PROCESO',DATE '2025-05-14',NULL,10,14,19);
INSERT INTO Reporte VALUES (15,'Audio adelantado','CERRADO',DATE '2025-05-15',DATE '2025-05-16',13,15,20);
INSERT INTO Reporte VALUES (16,'Video congelado','EN_PROCESO',DATE '2025-05-16',NULL,16,16,16);
INSERT INTO Reporte VALUES (17,'No inicia reproduccion','CERRADO',DATE '2025-05-17',DATE '2025-05-18',1,17,17);
INSERT INTO Reporte VALUES (18,'Error al pausar','ABIERTO',DATE '2025-05-18',NULL,14,18,18);
INSERT INTO Reporte VALUES (19,'Problema de calidad','CERRADO',DATE '2025-05-19',DATE '2025-05-20',19,19,19);
INSERT INTO Reporte VALUES (20,'Desfase audio video','EN_PROCESO',DATE '2025-05-20',NULL,17,20,20);
INSERT INTO Reporte VALUES (21,'No aparece contenido','ABIERTO',DATE '2025-05-21',NULL,21,21,16);
INSERT INTO Reporte VALUES (22,'Error de carga','CERRADO',DATE '2025-05-22',DATE '2025-05-23',22,22,17);
INSERT INTO Reporte VALUES (23,'Falla en streaming','EN_PROCESO',DATE '2025-05-23',NULL,23,23,18);
INSERT INTO Reporte VALUES (24,'Audio en otro idioma','CERRADO',DATE '2025-05-24',DATE '2025-05-25',24,24,19);
INSERT INTO Reporte VALUES (25,'Problema general','ABIERTO',DATE '2025-05-25',NULL,25,25,20);

COMMIT;