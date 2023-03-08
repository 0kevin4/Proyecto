
insert into categoria 
values(1,1,'Peluches'),
      (2,1,'Afiches'),
      (3,1,'Dulces'),
      (4,1,'Bolsos'),
      (5,1,'Maquillaje'),
      (6,1,'Globos'),
      (7,1,'Perfumes'),
      (8,1,'Calzado'),
      (9,1,'Relojes'),
      (10,1,'Vajilla'),
      (11,1,'Cajas sorpresa'),
      (12,1,'Habladores'),
      (13,1,'Joyas'),
      (14,1,'Licores');

insert into subcategoria 
values (1,'Emojis',1,1),
       (2,'Peluche hablante',1,1), 
       (3,'Peluche no hablante',1,1),
       (4,'leones',1,1),
       (5,'chimuelos',1,1),
       (6,'Cumpleaños',1,2),
       (7,'Navidad',1,2),
       (8,'Amistad',1,2),
       (9,'Amor',1,2),
       (10,'Chocolatinas',1,3),
       (11,'Bombones',1,3),
       (12,'Masmelos',1,3),
       (13,'Galletas',1,3),
       (14,'Gomitas',1,3),
       (15,'Bolso cuero',1,4),
       (16,'Bolso peluche',1,4),   
       (17,'Maleta',1,4),
       (18,'Labial',1,5),
       (19,'Pestañina',1,5),
       (20,'Sombras',1,5),
       (21,'Iluminadores',1,5),
       (22,'Pestañas postizas',1,5),
       (23,'Globo metalizado',1,6),
       (24,'Globo corazon',1,6),
       (25,'Globo helio',1,6),
       (26,'Globo transparente',1,6),
       (27,'Perfume dama',1,7),
       (28,'Perfume caballero',1,7),
       (29,'Zapatillas',1,8),
       (30,'Pantuflas',1,8),
       (31,'Reloj pulso goma',1,9),
       (32,'Reloj pulso normal',1,9),
       (33,'Posillos personalizados',1,10),
       (34,'Copas personalizadas',1,10),
       (35,'Cajas de madera',1,11),
       (36,'Cajas de carton',1,11),
       (37,'Caja decorativa',1,11),
       (38,'Cumpleaños',1,12),
       (39,'Navidad',1,12),
       (40,'Amor',1,12),
       (41,'Amistad',1,12),
       (42,'Hallowen',1,12),
       (43,'Cadenas',1,13),
       (44,'Aretes',1,13),
       (45,'Anillos',1,13),
       (47,'Balacas',1,13),
       (48,'Corona',1,14),
       (49,'Budweiser',1,14),
       (50,'Duff',1,14),
       (51,'Artesanal',1,14),
       (52,'Polar',1,14);


insert into marca    
values (1,'Bavaria',1),
       (2,'Colombina',1),
       (3,'Bimar',1),
       (4,'Casio',1),
       (5,'Jumbo',1),
       (6,'Waffer',1),
       (7,'Festival',1),
       (8,'Trululu',1),
       (9,'Mate',1),
       (10,'maybelline',1),
       (11,'Urban decay',1),
       (12,'Winner sport',1),
       (13,'Musk',1),
       (14,'Dancing',1),
       (15,'Celos',1),
       (16,'black opium',1),
       (17,'Puma',1),
       (18,'Nike',1),
       (19,'Tissot',1),
       (20,'diesel',1),
       (21,'NM',1);

insert into producto 
values (1,'Stich grande','Muñeco',1,3,3,150,250,50),
       (2,'Oso mediano','Muñeco',1,3,3,150,250,50),
       (3,'Peluche corazon','Muñeco',1,1,3,150,250,50),
       (4,'Pokemon pequeño','Muñeco',1,3,3,150,250,50),
       (5,'Mico mediano','Muñeco',1,5,3,150,250,50),
       (6,'Afiche de amor grande','Cartel',1,9,21,150,250,50),
       (7,'Afiche de cumpleaños pequeño','Cartel',1,6,21,150,250,50),
       (8,'Afiches de amistad medianos','Cartel',1,8,21,150,250,50),
       (9,'Afiches de navidad pequeño','Cartel',1,7,21,150,250,50),
       (10,'Chocolatinas jumbo grandes','Dulce',1,10,5,150,250,50),
       (11,'Chocolatinas wafer pequeño','Dulce',1,13,6,150,250,50),
       (12,'bombones pequeños','Dulce',1,11,2,150,250,50),
       (13,'Paquete de masmelos grande','Dulce',1,12,2,150,250,50),
       (14,'Galletas festival','Dulce',1,13,7,150,250,50),
       (15,'Paquete de gomitas trululu aro pequeño','Dulce',1,14,8,150,250,50),
       (16,'Bolso de cuero pequeño','Bolso',1,15,21,150,250,50),
       (17,'Bolso de cuero grande','Bolso',1,15,21,150,250,50),
       (18,'Bolso de cuero mediano','Bolso',1,15,21,150,250,50),
       (19,'Bolso de peluche grande','Bolso',1,16,21,150,250,50),
       (20,'Bolso de peluche pequeño','Bolso',1,16,21,150,250,50),
       (21,'Labial mate pequeño','Maquillaje',1,18,9,150,250,50),
       (22,'Pestañina maybelline pequeña','Maquillaje',1,19,10,150,250,50),
       (23,'Sombras urban decay Grande','Maquillaje',1,20,11,150,250,50),
       (24,'Iluminadores medianos','Maquillaje',1,21,21,150,250,50),
       (25,'Pestañas postizas grande','Maquillaje',1,22,21,150,250,50),
       (26,'Globos metalizados grandes','Decoracion',1,23,21,150,250,50),
       (27,'Globo corazon mediano','Decoracion',1,24,21,150,250,50),
       (28,'Globo con helio grande','Decoracion',1,25,21,150,250,50),
       (29,'Globo trasparente pequeño','Decoracion',1,26,21,150,250,50),
       (30,'Globo trasparante grande','Decoracion',1,26,21,150,250,50),
       (31,'Perfume winner sport mediano','Aroma',1,28,12,150,250,50),
       (32,'Perfume musk pequeño','Aroma',1,28,13,150,250,50),
       (33,'Perfume dancing mediano','Aroma',1,27,14,150,250,50),
       (34,'Perfume celos mediana','Aroma',1,27,15,150,250,50),
       (35,'Perfume black opium mediano','Aroma',1,27,16,150,250,50),
       (36,'Zapatillas puma','Calazado',1,29,17,150,250,50),
       (37,'Zapatillas nike','Calazado',1,29,18,150,250,50),
       (38,'Pantuflas de osos','Calazado',1,30,21,150,250,50),
       (39,'Pantuflas de gatos','Calazado',1,30,21,150,250,50),
       (40,'Pantuflas de micos','Calazado',1,30,21,150,250,50),
       (41,'Reloj pulso de goma casio','Relojes',1,31,4,150,250,50),
       (42,'Reloj puso de goma Tissot','Relojes',1,31,19,150,250,50),
       (43,'Reloj pulso de goma diesel','Relojes',1,31,20,150,250,50),
       (44,'Reloj pulso normal Casio','Relojes',1,32,4,150,250,50),
       (45,'Reloj pulso normal diesel','Relojes',1,32,20,150,250,50),
       (46,'Posillos personalizados grandes','Vajillas',1,33,21,150,250,50),
       (47,'Copas personalizadas pequeñas','Vajillas',1,34,21,150,250,50),
       (48,'Caja de madera decorada grande','Cajas',1,35,21,150,250,50),
       (49,'Caja de carton personalizada mediana','Cajas',1,36,21,150,250,50),
       (50,'Cajas decorativas peque±as','Cajas',1,37,21,150,250,50),
       (51,'Habladores de cumpleaños pequeño','Detalles',1,38,21,150,250,50),
       (52,'Habladores de navidad medianos','Detalles',1,39,21,150,250,50),
       (53,'Habladores de amistad grandes','Detalles',1,41,21,150,250,50),
       (54,'Habladores de amor medianos','Detalles',1,40,21,150,250,50),
       (55,'Cadenas de oro','Joyas',1,43,21,150,250,50),
       (56,'Cadenas de plata','Joyas',1,43,21,150,250,50),
       (57,'Anillos de oro','Joyas',1,45,21,150,250,50),
       (58,'Manillas con mostacilla','Utiles',1,47,21,150,250,50),
       (59,'Balacas con pepas','Utiles',1,47,21,150,250,50),
       (60,'Balacas con flores','Utiles',1,47,21,150,250,50),
       (61,'Cerveza corona grande','Licor',1,48,1,150,250,50),
       (62,'Cerveza Budweiser mediana','Licor',1,49,1,150,250,50),
       (63,'Cerveza duff mediana','Licor',1,50,1,150,250,50),
       (64,'Cerveza artesanal grande','Licor',1,51,1,150,250,50),
       (65,'Cerveza polar pequeña','Licor',1,52,1,150,250,50);     




insert into precio 
values (1,'2022-01-02',16500,000,16500,16500,1),
       (2,'2022-01-02',5000,000,5000,5000,2),
       (3,'2022-01-02',2800,000,2800,2800,3),
       (4,'2022-01-02',3500,000,3500,3500,4),
       (5,'2022-01-02',5000,000,5000,5000,5),
       (6,'2022-01-02',2300,000,2300,2300,6),
       (7,'2022-01-02',900,000,900,900,7),
       (8,'2022-01-02',1700,000,1700,1700,8),
       (9,'2022-01-02',900,000,900,900,9),
       (10,'2022-01-02',380,000,380,380,10),
       (11,'2022-01-02',90000,000,90000,90000,11),
       (12,'2022-01-02',50000,000,50000,50000,12),
       (13,'2022-01-02',550,000,550,550,13),
       (14,'2022-01-02',80000,000,80000,80000,14),
       (15,'2022-01-02',100,000,100,100,15),
       (16,'2022-01-02',5800,000,5800,5800,16),
       (17,'2022-01-02',5800,000,5800,5800,17),
       (18,'2022-01-02',5800,000,5800,5800,18),
       (19,'2022-01-02',3500,000,3500,3500,19),
       (20,'2022-01-02',3500,000,3500,3500,20),
       (21,'2022-01-02',600,000,600,600,21),
       (22,'2022-01-02',350,000,350,350,22),
       (23,'2022-01-02',3800,000,3800,3800,23),
       (24,'2022-01-02',1000,000,1000,1000,24),
       (25,'2022-01-02',1000,000,1000,1000,25),
       (26,'2022-01-02',1200,000,1200,1200,26),
       (27,'2022-01-02',1200,000,1200,1200,27),
       (28,'2022-01-02',1500,000,1500,1500,28),
       (29,'2022-01-02',1500,000,1500,1500,29),
       (30,'2022-01-02',2100,000,2100,2100,30),
       (31,'2022-01-02',1800,000,1800,1800,31),
       (32,'2022-01-02',1700,000,1700,1700,32),
       (33,'2022-01-02',2000,000,2000,2000,33),
       (34,'2022-01-02',2000,000,2000,2000,34),
       (35,'2022-01-02',2500,000,2500,2500,35),
       (36,'2022-01-02',7000,000,7000,7000,36),
       (37,'2022-01-02',7000,000,7000,7000,37),
       (38,'2022-01-02',3800,000,3800,3800,38),
       (39,'2022-01-02',3800,000,3800,3800,39),
       (40,'2022-01-02',3800,000,3800,3800,40),
       (41,'2022-01-02',2200,000,2200,2200,41),
       (42,'2022-01-02',2200,000,2200,2200,42),
       (43,'2022-01-02',2200,000,2200,2200,43),
       (44,'2022-01-02',2500,000,2500,2500,44),
       (45,'2022-01-02',2500,000,2500,2500,45),
       (46,'2022-01-02',2500,000,2500,2500,46),
       (47,'2022-01-02',1500,000,1500,1500,47),
       (48,'2022-01-02',6000,000,6000,6000,48),
       (49,'2022-01-02',4000,000,4000,4000,49),
       (50,'2022-01-02',2500,000,2500,2500,50),
       (51,'2022-01-02',800,000,800,800,51),
       (52,'2022-01-02',800,000,800,800,52),
       (53,'2022-01-02',800,000,800,800,53),
       (54,'2022-01-02',800,000,800,800,54),
       (55,'2022-01-02',2000,000,2000,2000,55),
       (56,'2022-01-02',1500,000,1500,1500,56),
       (57,'2022-01-02',3500,000,3500,3500,57),
       (58,'2022-01-02',350,000,350,350,58),
       (59,'2022-01-02',400,000,400,400,59),
       (60,'2022-01-02',400,000,400,400,60),
       (61,'2022-01-02',800,000,800,800,61),
       (62,'2022-01-02',450,000,450,450,62),
       (63,'2022-01-02',600,000,600,600,63),
       (64,'2022-01-02',700,000,700,700,64),
	(65,'2022-01-02',320,000,320,320,65);
