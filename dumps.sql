# dumps

## variant 3

CREATE TABLE `material_type` (
`id` bigint NOT NULL AUTO_INCREMENT,
`type` varchar(100) DEFAULT NULL,
`loss_percent` decimal(5,2) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `material_type` VALUES (1,'Тип материала 1',0.20),(2,'Тип материала 2',0.50),(3,'Тип материала 3',0.30),(
4,'Тип материала 4',0.15),(5,'Тип материала 5',0.18);

CREATE TABLE `product_type` (
`id` bigint NOT NULL AUTO_INCREMENT,
`type` varchar(100) DEFAULT NULL,
`coefficient` decimal(5,2) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `product_type` VALUES (1,'Древесно-плитные материалы',1.50),(2,'Декоративные панели',3.50),(3,'Плитка'
,5.25),(4,'Фасадные материалы',4.50),(5,'Напольные покрытия',2.17);

CREATE TABLE `product` (
`id` bigint NOT NULL AUTO_INCREMENT,
`product_type_id` bigint DEFAULT NULL,
`name` varchar(200) DEFAULT NULL,
`sku` varchar(12) DEFAULT NULL,
`min_price` double DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `product_type_id` (`product_type_id`),
CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`)
) ENGINE=InnoDB;

INSERT INTO `product` VALUES (1,1,'Фанера ФСФ 1800х1200х27 мм бежевая береза','6549922',5100),(2,2,'Мягкие панели
прямоугольник велюр цвет оливковый 600х300х35 мм','7018556',1880),(3,4,'Бетонная плитка Белый кирпич микс 30х7,3 см'
,'5028272',2080),(4,3,'Плитка Мозаика 10x10 см цвет белый глянец','8028248',2500),(5,5,'Ламинат Дуб Античный серый 32
класс толщина 8 мм с фаской','9250282',4050),(6,2,'Стеновая панель МДФ Флора 1440x500x10 мм','7130981',2100.56),(
7,4,'Бетонная плитка Красный кирпич 20x6,5 см','5029784',2760),(8,5,'Ламинат Канди Дизайн 33 класс толщина 8 мм с
фаской','9658953',3200.96),(9,1,'Плита ДСП 11 мм влагостойкая 594x1815 мм','6026662',497.69),(10,5,'Ламинат с
натуральным шпоном Дуб Эксперт толщина 6 мм с фаской','9159043',3750),(11,3,'Плитка настенная Формат 20x40 см матовая
цвет мята','8588376',2500),(12,1,'Плита ДСП Кантри 16 мм 900x1200 мм','6758375',1050.96),(13,2,'Стеновая панель МДФ
Сосна Полярная 60х280х4мсм цвет коричневый','7759324',1700),(14,4,'Клинкерная плитка коричневая 29,8х29,8 см','5118827'
,860),(15,3,'Плитка настенная Цветок 60x120 см цвет зелено-голубой','8559898',2300),(16,2,'Пробковое настенное покрытие
600х300х3 мм белый','7259474',3300),(17,3,'Плитка настенная Нева 30x60 см цвет серый','8115947',1700),(18,4,'Гипсовая
плитка настенная Дом на берегу кирпич белый 18,5х4,5 см','5033136',499),(19,5,'Ламинат Дуб Северный белый 32 класс
толщина 8 мм с фаской','9028048',2550),(20,1,'Дерево волокнистая плита Дуб Винтаж 1200х620х3 мм светло-коричневый'
,'6123459',900.5);

CREATE TABLE `partner` (
`id` bigint NOT NULL AUTO_INCREMENT,
`name` varchar(200) DEFAULT NULL,
`director` varchar(200) DEFAULT NULL,
`email` varchar(100) DEFAULT NULL,
`phone` varchar(20) DEFAULT NULL,
`address` varchar(200) DEFAULT NULL,
`inn` varchar(12) DEFAULT NULL,
`rating` int DEFAULT NULL,
`org_type` varchar(100) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `partner` VALUES (1,'Стройдвор','Андреева Ангелина Николаевна','angelina77@kart.ru','492 452 22 82','143001,
Московская область, город Одинцово, уд. Ленина, 21','9432455179',5,'ЗАО'),(2,'Самоделка','Мельников Максим Петрович'
,'melnikov.maksim88@hm.ru','812 267 19 59','306230, Курская область, город Обоянь, ул. 1 Мая, 89','7803888520',3,'
ЗАО'),(3,'Деревянные изделия','Лазарев Алексей Сергеевич','aleksejlazarev@al.ru','922 467 93 83','238340,
Калининградская область, город Светлый, ул. Морская, 12','8430391035',4,'ООО'),(4,'Декор и отделка','Саншокова Мадина
Муратовна','mmsanshokova@lss.ru','413 230 30 79','685000, Магаданская область, город Магадан, ул. Горького, 15','
4318170454',7,'ООО'),(5,'Паркет','Иванов Дмитрий Сергеевич','ivanov.dmitrij@mail.ru','921 851 21 22','606440,
Нижегородская область, город Бор, ул. Свободы, 3','7687851800',7,'ООО'),(6,'Дом и сад','Аникеева Екатерина Алексеевна'
,'ekaterina.anikeeva@ml.ru','499 936 29 26','393760, Тамбовская область, город Мичуринск, ул. Красная, 50','
6119144874',7,'ПАО'),(7,'Легкий шаг','Богданова Ксения Владимировна','bogdanova.kseniya@bkv.ru','495 445 61 41','307370,
Курская область, город Рыльск, ул. Гагарина, 16','1122170258',6,'ОАО'),(8,'СтройМатериалы','Холодова Валерия Борисовна'
,'holodova@education.ru','499 234 56 78','140300, Московская область, город Егорьевск, ул. Советская, 24','
8355114917',5,'ПАО'),(9,'Мир отделки','Крылов Савелий Тимофеевич','stkrylov@mail.ru','908 713 51 88','344116, Ростовская
область, город Ростов-на-Дону, ул. Артиллерийская, 4','3532367439',8,'ОАО'),(10,'Технологии комфорта','Белов Кирилл
Александрович','kirill_belov@kir.ru','918 432 12 34','164500, Архангельская область, город Северодвинск, ул. Ломоносова,
29','2362431140',4,'ОАО'),(11,'Твой дом','Демидов Дмитрий Александрович','dademidov@ml.ru','919 698 75 43','354000,
Краснодарский край, город Сочи, ул. Больничная, 11','4159215346',10,'ПАО'),(12,'Новые краски','Алиев Дамир Игоревич'
,'alievdamir@tk.ru','812 823 93 42','187556, Ленинградская область, город Тихвин, ул. Гоголя, 18','9032455179',9,'
ЗАО'),(13,'Политехник','Котов Михаил Михайлович','mmkotov56@educat.ru','495 895 71 77','143960, Московская область,
город Реутов, ул. Новая, 55','3776671267',5,'ОАО'),(14,'СтройАрсенал','Семенов Дмитрий Максимович','semenov.dm@mail.ru'
,'896 123 45 56','242611, Брянская область, город Фокино, ул. Фокино, 23','7447864518',5,'ОАО'),(15,'Декор и порядок'
,'Болотов Артем Игоревич','artembolotov@ab.ru','950 234 12 12','309500, Белгородская область, город Старый Оскол, ул.
Цветочная, 20','9037040523',5,'ПАО'),(16,'Умные решения','Воронова Анастасия Валерьевна','voronova_anastasiya@mail.ru'
,'923 233 27 69','652050, Кемеровская область, город Юрга, ул. Мира, 42','6221520857',3,'ПАО'),(17,'Натуральные
покрытия','Горбунов Василий Петрович','vpgorbunov24@vvs.ru','902 688 28 96','188300, Ленинградская область, город
Гатчина, пр. 25 Октября, 17','2262431140',9,'ЗАО'),(18,'СтройМастер','Смирнов Иван Андреевич','smirnov_ivan@kv.ru','917
234 75 55','184250, Мурманская область, город Кировск, пр. Ленина, 24','4155215346',9,'ООО'),(19,'Гранит','Джумаев Ахмед
Умарович','dzhumaev.ahmed@amail.ru','495 452 55 95','162390, Вологодская область, город Великий Устюг, ул.
Железнодорожная, 36','3961234561',5,'ООО'),(20,'Строитель','Петров Николай Тимофеевич','petrov.nikolaj31@mail.ru','916
596 15 55','188910, Ленинградская область, город Приморск, ш. Приморское, 18','9600275878',10,'ЗАО');

CREATE TABLE `product` (
`id` bigint NOT NULL AUTO_INCREMENT,
`product_type_id` bigint DEFAULT NULL,
`name` varchar(200) DEFAULT NULL,
`sku` varchar(12) DEFAULT NULL,
`min_price` double DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `product_type_id` (`product_type_id`),
CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`)
) ENGINE=InnoDB;

INSERT INTO `product` VALUES (1,1,'Фанера ФСФ 1800х1200х27 мм бежевая береза','6549922',5100),(2,2,'Мягкие панели
прямоугольник велюр цвет оливковый 600х300х35 мм','7018556',1880),(3,4,'Бетонная плитка Белый кирпич микс 30х7,3 см'
,'5028272',2080),(4,3,'Плитка Мозаика 10x10 см цвет белый глянец','8028248',2500),(5,5,'Ламинат Дуб Античный серый 32
класс толщина 8 мм с фаской','9250282',4050),(6,2,'Стеновая панель МДФ Флора 1440x500x10 мм','7130981',2100.56),(
7,4,'Бетонная плитка Красный кирпич 20x6,5 см','5029784',2760),(8,5,'Ламинат Канди Дизайн 33 класс толщина 8 мм с
фаской','9658953',3200.96),(9,1,'Плита ДСП 11 мм влагостойкая 594x1815 мм','6026662',497.69),(10,5,'Ламинат с
натуральным шпоном Дуб Эксперт толщина 6 мм с фаской','9159043',3750),(11,3,'Плитка настенная Формат 20x40 см матовая
цвет мята','8588376',2500),(12,1,'Плита ДСП Кантри 16 мм 900x1200 мм','6758375',1050.96),(13,2,'Стеновая панель МДФ
Сосна Полярная 60х280х4мсм цвет коричневый','7759324',1700),(14,4,'Клинкерная плитка коричневая 29,8х29,8 см','5118827'
,860),(15,3,'Плитка настенная Цветок 60x120 см цвет зелено-голубой','8559898',2300),(16,2,'Пробковое настенное покрытие
600х300х3 мм белый','7259474',3300),(17,3,'Плитка настенная Нева 30x60 см цвет серый','8115947',1700),(18,4,'Гипсовая
плитка настенная Дом на берегу кирпич белый 18,5х4,5 см','5033136',499),(19,5,'Ламинат Дуб Северный белый 32 класс
толщина 8 мм с фаской','9028048',2550),(20,1,'Дерево волокнистая плита Дуб Винтаж 1200х620х3 мм светло-коричневый'
,'6123459',900.5);

CREATE TABLE `request` (
`id` bigint NOT NULL AUTO_INCREMENT,
`product_id` varchar(200) DEFAULT NULL,
`partner_id` varchar(200) DEFAULT NULL,
`amount` int DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `request` VALUES (1,'4','1',2000),(2,'5','2',3000),(3,'1','3',1000),(4,'3','4',9500),(5,'1','5',2000),(
6,'18','6',1100),(7,'12','7',5000),(8,'1','8',2500),(9,'2','9',6000),(10,'6','10',7000),(11,'4','11',5000),(12,'4','12'
,7500),(13,'1','13',3000),(14,'18','14',500),(15,'16','15',7000),(16,'9','16',4000),(17,'1','17',3500),(18,'1','18'
,7900),(19,'15','19',9600),(20,'15','20',1200),(21,'11','1',1500),(22,'8','2',3000),(23,'2','3',3010),(24,'7','4'
,3020),(25,'5','5',3050),(26,'14','6',3040),(27,'19','7',3050),(28,'4','8',3060),(29,'18','9',3070),(30,'9','10',5400),(
31,'12','11',5500),(32,'11','12',5600),(33,'9','13',5700),(34,'14','14',5800),(35,'2','15',5900),(36,'12','16',6000),(
37,'6','17',6100),(38,'9','18',8000),(39,'3','19',7060),(40,'17','20',6120),(41,NULL,'1',5180),(42,'10','2',4240),(
43,'10','3',3300),(44,'10','4',2360),(45,'8','5',1420),(46,'11','6',1500),(47,'5','7',1700),(48,'12','8',1900),(49,'15'
,'9',2100),(50,'12','10',2300),(51,'8','11',2500),(52,'15','12',2700),(53,'12','13',2900),(54,'1','14',3100),(55,'18'
,'15',3300),(56,'20','16',3500),(57,'10','17',3750),(58,'14','18',6700),(59,'7','19',6950),(60,'11','20',7200),(61,'17'
,'1',7450),(62,'19','2',7700),(63,'20','3',7950),(64,'8','4',8200),(65,'10','5',8450),(66,'7','6',8700),(67,'8','7'
,8950),(68,'20','8',9200),(69,'4','9',1300),(70,'16','10',1500),(71,'16','11',1700),(72,'12','12',1900),(73,'20','13'
,2100),(74,'9','14',2300),(75,'13','15',2500),(76,'13','16',2700),(77,'12','17',2900),(78,'3','18',3100),(79,'14','19'
,3300),(80,'18','20',3500);

## variant 4


create table Test1.material_type
(
    id           bigint auto_increment
        primary key,
    title        varchar(255) null,
    lost_percent double       null
);

create table Test1.product
(
    id               bigint auto_increment
        primary key,
    title            varchar(255) null,
    sku              varchar(255) null,
    minimal_price    double       null,
    product_type_id  bigint       null,
    material_type_id bigint       null
);

create table Test1.product_type
(
    id          bigint auto_increment
        primary key,
    title       varchar(255) null,
    koefficient double       null
);

create table Test1.product_workshop
(
    id              bigint auto_increment
        primary key,
    product_id      bigint null,
    workshop_id     bigint null,
    production_time double null
);

create table Test1.user
(
    id          bigint auto_increment
        primary key,
    email       varchar(100) null,
    password    varchar(255) null,
    name        varchar(100) null,
    mobilePhone varchar(200) null
);

create table Test1.workshop
(
    id               bigint auto_increment
        primary key,
    title            varchar(255) null,
    workers_amount   int          null,
    workshop_type_id bigint       null
);

create table Test1.workshop_type
(
    id    bigint auto_increment
        primary key,
    title varchar(255) null
);


insert into Test1.material_type (id, title, lost_percent)
values  (1, 'Мебельный щит из массива дерева', 0.008),
        (2, 'Ламинированное ДСП', 0.007),
        (3, 'Фанера', 0.0055),
        (4, 'МДФ', 0.003);

insert into Test1.product (id, title, sku, minimal_price, product_type_id, material_type_id)
values  (1, 'Комплект мебели для гостиной Ольха горная', '1549922', 160507, 1, 1),
        (2, 'Стенка для гостиной Вишня темная', '1018556', 216907, 1, 1),
        (3, 'Прихожая Венге Винтаж', '3028272', 24970, 2, 2),
        (4, 'Тумба с вешалкой Дуб натуральный', '3029272', 18206, 2, 2),
        (5, 'Прихожая-комплект Дуб темный', '3028248', 177509, 2, 1),
        (6, 'Диван-кровать угловой Книжка', '7118827', 85900, 3, 1),
        (7, 'Диван модульный Телескоп', '7137981', 75900, 3, 1),
        (8, 'Диван-кровать Соло', '7029787', 120345, 3, 1),
        (9, 'Детский диван Выкатной', '7758953', 25990, 3, 3),
        (10, 'Кровать с подъемным механизмом с матрасом 1600х2000 Венге', '6026662', 69500, 4, 1),
        (11, 'Кровать с матрасом 90х2000 Венге', '6159043', 55600, 4, 2),
        (12, 'Кровать универсальная Дуб натуральный', '6588376', 37900, 4, 2),
        (13, 'Кровать с ящиками Ясень белый', '6758375', 46750, 4, 3),
        (14, 'Шкаф-купе 3-х дверный Сосна белая', '2759324', 131560, 5, 2),
        (15, 'Стеллаж Бук натуральный', '2118827', 38700, 5, 1),
        (16, 'Шкаф 4 дверный с ящиками Ясень серый', '2559898', 160151, 5, 3),
        (17, 'Шкаф-пенал Береза белый', '2259474', 40500, 5, 3),
        (18, 'Комод 6 ящиков Вишня светлая', '4115947', 61235, 5, 1),
        (19, 'Комод 4 ящика Вишня светлая', '4033136', 41200, 5, 1),
        (20, 'Тумба под ТВ ', '4028048', 12350, 5, 4),
        (23, 'Очень мягкий диван', '12344', 346, 3, 2),
        (24, 'МегаДиван', '1231233', 123, 1, 1),
        (25, '123', '1233', 13, 1, 1),
        (26, 'Топовый диван', '1234551', 123, 1, 1);

insert into Test1.product_type (id, title, koefficient)
values  (1, 'Гостиные', 3.5),
        (2, 'Прихожие', 5.6),
        (3, 'Мягкая мебель', 3),
        (4, 'Кровати', 4.7),
        (5, 'Шкафы', 1.5),
        (6, 'Комоды', 2.3);

insert into Test1.product_workshop (id, product_id, workshop_id, production_time)
values  (1, 1, 12, 0.3),
        (2, 1, 5, 2),
        (3, 1, 7, 1.5),
        (4, 1, 2, 0.4),
        (5, 1, 3, 1),
        (6, 1, 1, 1),
        (7, 1, 6, 0.3),
        (8, 1, 4, 0.5),
        (9, 2, 5, 2),
        (10, 2, 7, 1),
        (11, 2, 11, 1),
        (12, 2, 2, 1),
        (13, 2, 3, 1),
        (14, 2, 1, 1),
        (15, 2, 6, 0.4),
        (16, 2, 4, 0.3),
        (17, 2, 10, 0.3),
        (18, 3, 11, 1),
        (19, 3, 3, 1),
        (20, 3, 4, 0.5),
        (21, 3, 10, 0.5),
        (22, 4, 12, 0.5),
        (23, 4, 3, 1),
        (24, 4, 4, 0.5),
        (25, 5, 12, 0.2),
        (26, 5, 5, 2),
        (27, 5, 7, 1),
        (28, 5, 11, 0.5),
        (29, 5, 2, 0.5),
        (30, 5, 3, 1),
        (31, 5, 1, 1.5),
        (32, 5, 6, 0.5),
        (33, 5, 4, 0.5),
        (34, 5, 10, 0.3),
        (35, 6, 12, 0.3),
        (36, 6, 5, 2),
        (37, 6, 11, 0.5),
        (38, 6, 3, 1),
        (39, 6, 6, 0.5),
        (40, 6, 4, 0.5),
        (41, 6, 9, 4.2),
        (42, 7, 12, 0.2),
        (43, 7, 5, 2),
        (44, 7, 7, 0.5),
        (45, 7, 11, 0.3),
        (46, 7, 3, 1),
        (47, 7, 6, 1),
        (48, 7, 4, 0.5),
        (49, 7, 9, 4.5),
        (50, 8, 12, 0.3),
        (51, 8, 7, 0.5),
        (52, 8, 2, 0.5),
        (53, 8, 3, 0.5),
        (54, 8, 1, 0.5),
        (55, 8, 6, 0.5),
        (56, 8, 4, 0.5),
        (57, 8, 9, 4.7),
        (58, 9, 12, 0.5),
        (59, 9, 7, 1),
        (60, 9, 3, 0.7),
        (61, 9, 6, 0.5),
        (62, 9, 4, 0.3),
        (63, 9, 9, 4),
        (64, 10, 12, 0.5),
        (65, 10, 3, 1),
        (66, 10, 6, 0.4),
        (67, 10, 4, 0.6),
        (68, 10, 10, 0.5),
        (69, 10, 8, 2),
        (70, 11, 12, 0.5),
        (71, 11, 3, 1),
        (72, 11, 4, 1),
        (73, 11, 9, 5.5),
        (74, 12, 12, 0.3),
        (75, 12, 11, 0.8),
        (76, 12, 3, 1.1),
        (77, 12, 4, 0.8),
        (78, 13, 12, 0.2),
        (79, 13, 11, 0.3),
        (80, 13, 3, 2),
        (81, 13, 6, 1.5),
        (82, 13, 4, 2),
        (83, 14, 12, 0.5),
        (84, 14, 11, 1.5),
        (85, 14, 2, 1),
        (86, 14, 3, 1),
        (87, 14, 1, 2),
        (88, 14, 4, 0.5),
        (89, 14, 10, 0.5),
        (90, 15, 12, 0.2),
        (91, 15, 5, 2),
        (92, 15, 7, 0.5),
        (93, 15, 11, 0.3),
        (94, 15, 2, 0.7),
        (95, 15, 3, 1),
        (96, 15, 1, 1),
        (97, 15, 6, 1),
        (98, 15, 4, 0.3),
        (99, 16, 12, 0.5),
        (100, 16, 7, 1),
        (101, 16, 11, 2),
        (102, 16, 3, 1),
        (103, 16, 4, 1.5),
        (104, 17, 12, 0.5),
        (105, 17, 7, 3),
        (106, 17, 3, 1),
        (107, 17, 6, 2.5),
        (108, 17, 4, 1),
        (109, 18, 12, 0.2),
        (110, 18, 5, 2),
        (111, 18, 7, 2),
        (112, 18, 11, 0.3),
        (113, 18, 3, 1),
        (114, 18, 6, 1),
        (115, 18, 4, 0.5),
        (116, 19, 12, 0.2),
        (117, 19, 5, 2),
        (118, 19, 7, 2),
        (119, 19, 3, 1),
        (120, 19, 6, 0.4),
        (121, 19, 4, 0.4),
        (122, 20, 12, 0.3),
        (123, 20, 11, 1),
        (124, 20, 2, 0.4),
        (125, 20, 3, 0.6),
        (126, 20, 1, 1),
        (127, 20, 6, 0.5),
        (128, 20, 4, 0.5),
        (129, 20, 10, 1),
        (130, 20, 8, 2.7);

insert into Test1.workshop (id, title, workers_amount, workshop_type_id)
values  (1, 'Проектный', 4, 1),
        (2, 'Расчетный', 5, 1),
        (3, 'Раскроя', 5, 2),
        (4, 'Обработки', 6, 2),
        (5, 'Сушильный', 3, 3),
        (6, 'Покраски', 5, 2),
        (7, 'Столярный', 7, 2),
        (8, 'Изготовления изделий из искусственного камня и композитных материалов', 3, 2),
        (9, 'Изготовления мягкой мебели', 5, 2),
        (10, 'Монтажа стеклянных, зеркальных вставок и других изделий', 2, 4),
        (11, 'Сборки', 6, 4),
        (12, 'Упаковки', 4, 4);

insert into Test1.workshop_type (id, title)
values  (1, 'Проектирование
'),
        (2, 'Обработка'),
        (3, 'Сушка'),
        (4, 'Сборка');

## variant 5

create table if not exists material_type (
    id bigint auto_increment primary key not null,
    type varchar(200),
    loss_percent double
);

create table if not exists product_type (
    id bigint auto_increment primary key not null,
    type varchar(200),
    coefficient double
);

create table if not exists material (
    id bigint auto_increment primary key not null,
    name varchar(200),
    material_type_id bigint,
    price double,
    warehouse_amount double,
    minimal_amount double,
    amount_in_package double,
    measure_unit varchar(100),

    foreign key (material_type_id) references material_type(id)
);

create table if not exists product (
    id bigint auto_increment primary key not null,
    product_type_id bigint,
    name varchar(200),
    sku varchar(100),
    min_price double,

    foreign key (product_type_id) references product(id)
);

create table if not exists material_product (
    id bigint auto_increment primary key not null,
    material_id bigint,
    product_id bigint,
    amount double,

    foreign key (material_id) references material(id),
    foreign key (product_id) references product(id)
);

insert into material_type (type, loss_percent)
values
    ('Дерево',0.55),
    ('Древесная плита',0.30),
    ('Текстиль',0.15),
    ('Стекло',0.45),
    ('Металл',0.10),
    ('Пластик',0.05);

insert into product_type (type, coefficient)
values
   ('Кресла', 1.95),
   ('Полки', 2.5),
   ('Стеллажи', 4.35),
   ('Столы', 5.5),
   ('Тумбы', 7.6),
   ('Шкафы', 6.72);


insert into material (name, material_type_id, price, warehouse_amount, minimal_amount, amount_in_package, measure_unit)
values
    ('Цельный массив дерева Дуб 1000х600 мм', (select id from material_type where type = 'Дерево') ,7450.00 , 1500.00,500.00, 7.20, 'м²'),
    ('Клееный массив дерева Дуб 1000х600 мм', (select id from material_type where type = 'Дерево'),4520.00 , 300.00,500.00, 7.20, 'м²'),
    ('Шпон облицовочный Дуб натуральный 2750х480 мм', (select id from material_type where type = 'Дерево'),2500.00 , 2000.00,1500.00, 19.80, 'м²'),
    ('Фанера 2200х1000 мм', (select id from material_type where type = 'Древесная плита'),2245.00 , 450.00,1000.00, 52.80, 'м²'),
    ('ДСП 2750х1830 мм', (select id from material_type where type = 'Древесная плита'),529.60 , 1010.00,1200.00, 181.08, 'м²'),
    ('МДФ 2070х1400 мм', (select id from material_type where type = 'Древесная плита'),417.24 , 1550.00,1000.00, 87.00, 'м²'),
    ('ДВП 2440х2050 мм', (select id from material_type where type = 'Древесная плита'),187.00 , 1310.00,1000.00, 190.00, 'м²'),
    ('ХДФ 2800x2070 мм', (select id from material_type where type = 'Древесная плита'),370.96 , 1400.00,1200.00, 90.00, 'м²'),
    ('Экокожа 140 см', (select id from material_type where type = 'Текстиль'),1600.00 , 1200.00,1500.00, 100.00, 'пог.м'),
    ('Велюр 140 см', (select id from material_type where type = 'Текстиль'),1300.00 , 1300.00,1500.00, 100.00, 'пог.м'),
    ('Шенилл 140 см', (select id from material_type where type = 'Текстиль'),620.00 , 950.00,1500.00, 100.00, 'пог.м'),
    ('Рогожка 140 см', (select id from material_type where type = 'Текстиль'),720.00 , 960.00,1500.00, 100.00, 'пог.м'),
    ('Закаленное стекло 2600х1800 мм', (select id from material_type where type = 'Стекло'),1148.00 , 1000.00,500.00, 196.56, 'м²'),
    ('Металлокаркас для стула', (select id from material_type where type = 'Металл'),1100.00 , 300.00,250.00, 5.00, 'шт'),
    ('Металлокаркас каркас из профиля с траверсами для стола', (select id from material_type where type = 'Металл'),6700.00 , 100.00,100.00, 1.00, 'шт'),
    ('Колесо для мебели поворотное', (select id from material_type where type = 'Пластик'),10.59 , 1500.00,1000.00, 500.00, 'шт'),
    ('Газ-лифт', (select id from material_type where type = 'Металл'),730.00 , 500.00,250.00, 5.00, 'шт'),
    ('Металлическая крестовина для офисных кресел', (select id from material_type where type = 'Металл'),2700.00 , 500.00,250.00, 5.00, 'шт'),
    ('Пластиковый комплект для стула', (select id from material_type where type = 'Пластик'),900.00 , 300.00,250.00, 100.00, 'шт'),
    ('Кромка ПВХ', (select id from material_type where type = 'Пластик'),35.80 , 1500.00,1000.00, 100.00, 'м');

insert into product (product_type_id, name, sku, min_price)
values
    ((select id from product_type where type = 'Кресла'),'Кресло детское цвет Белый и Розовый','3028272',15324.99),
    ((select id from product_type where type = 'Кресла'),'Кресло офисное цвет Черный','3018556',21443.99),
    ((select id from product_type where type = 'Кресла'),'Кресло эргономичное цвет Темно-коричневый  ','3549922',24760.00),
    ((select id from product_type where type = 'Полки'),'Полка настольная','7028048',2670.89),
    ((select id from product_type where type = 'Стеллажи'),'Стеллаж для документов цвет Дуб светлый 854х445х2105 мм','5759324',24899.00),
    ((select id from product_type where type = 'Стеллажи'),'Стеллаж цвет Белый с ящиками 854х445х2105 мм','5259474',16150.00),
    ((select id from product_type where type = 'Стеллажи'),'Стеллаж цвет Орех 400х370х2000 мм','5118827',2860.00),
    ((select id from product_type where type = 'Столы'),'Стол для ноутбука на металлокаркасе 800х600х123 мм','1029784',14690.00),
    ((select id from product_type where type = 'Столы'),'Стол компьютерный 700х600х500 мм','1028248',4105.89),
    ((select id from product_type where type = 'Столы'),'Стол компьютерный на металлокаркасе 1400х600х750 мм','1130981',13899.00),
    ((select id from product_type where type = 'Столы'),'Стол письменный 1100x750x600 мм','1188827',5148.00),
    ((select id from product_type where type = 'Столы'),'Стол письменный с тумбочкой 4 ящика 1100x750x600 мм','1029272',15325.00),
    ((select id from product_type where type = 'Столы'),'Стол руководителя письменный цвет Венге 1600x800x764 мм','1016662',43500.90),
    ((select id from product_type where type = 'Столы'),'Стол руководителя письменный цвет Орех темный 2300x1000x750 мм','1658953',132500.00),
    ((select id from product_type where type = 'Тумбы'),'Тумба выкатная 3 ящика','6033136',3750.00),
    ((select id from product_type where type = 'Тумбы'),'Тумба офисная для оргтехники','6115947',2450.00),
    ((select id from product_type where type = 'Стеллажи'),'Узкий пенал стеллаж 5 полок цвет Орех 364х326x2000 мм ','5559898',8348.00),
    ((select id from product_type where type = 'Шкафы'),'Шкаф для книг 800x420x2000 мм','4159043',23390.99),
    ((select id from product_type where type = 'Шкафы'),'Шкаф для одежды цвет Венге 602x420x2000 мм','4758375',12035.00),
    ((select id from product_type where type = 'Шкафы'),'Шкаф-витрина 2 ящика 800x420x2000 мм','4588376',31991.00);

insert into material_product (material_id, product_id, amount)
values
    ((select id from material where name = 'Фанера 2200х1000 мм'), (select id from product where name = 'Кресло детское цвет Белый и Розовый'),0.85),
    ((select id from material where name = 'Велюр 140 см'), (select id from product where name = 'Кресло детское цвет Белый и Розовый'),1.50),
    ((select id from material where name = 'Шенилл 140 см'), (select id from product where name = 'Кресло детское цвет Белый и Розовый'),1.50),
    ((select id from material where name = 'Рогожка 140 см'), (select id from product where name = 'Кресло детское цвет Белый и Розовый'),1.50),
    ((select id from material where name = 'Металлокаркас для стула'), (select id from product where name = 'Кресло детское цвет Белый и Розовый'),1.00),
    ((select id from material where name = 'Колесо для мебели поворотное'), (select id from product where name = 'Кресло детское цвет Белый и Розовый'),5.00),
    ((select id from material where name = 'Газ-лифт'), (select id from product where name = 'Кресло детское цвет Белый и Розовый'),1.00),
    ((select id from material where name = 'Металлическая крестовина для офисных кресел'), (select id from product where name = 'Кресло детское цвет Белый и Розовый'),1.00),
    ((select id from material where name = 'Пластиковый комплект для стула'), (select id from product where name = 'Кресло детское цвет Белый и Розовый'),1.00),
    ((select id from material where name = 'Фанера 2200х1000 мм'), (select id from product where name = 'Кресло офисное цвет Черный'),1.25),
    ((select id from material where name = 'Экокожа 140 см'), (select id from product where name = 'Кресло офисное цвет Черный'),3.04),
    ((select id from material where name = 'Шенилл 140 см'), (select id from product where name = 'Кресло офисное цвет Черный'),1.50),
    ((select id from material where name = 'Рогожка 140 см'), (select id from product where name = 'Кресло офисное цвет Черный'),2.50),
    ((select id from material where name = 'Металлокаркас для стула'), (select id from product where name = 'Кресло офисное цвет Черный'),1.00),
    ((select id from material where name = 'Колесо для мебели поворотное'), (select id from product where name = 'Кресло офисное цвет Черный'),5.00),
    ((select id from material where name = 'Газ-лифт'), (select id from product where name = 'Кресло офисное цвет Черный'),1.00),
    ((select id from material where name = 'Металлическая крестовина для офисных кресел'), (select id from product where name = 'Кресло офисное цвет Черный'),1.00),
    ((select id from material where name = 'Пластиковый комплект для стула'), (select id from product where name = 'Кресло офисное цвет Черный'),1.00),
    ((select id from material where name = 'Фанера 2200х1000 мм'), (select id from product where name = 'Кресло эргономичное цвет Темно-коричневый  '),1.85),
    ((select id from material where name = 'Экокожа 140 см'), (select id from product where name = 'Кресло эргономичное цвет Темно-коричневый  '),4.22),
    ((select id from material where name = 'Велюр 140 см'), (select id from product where name = 'Кресло эргономичное цвет Темно-коричневый  '),1.50),
    ((select id from material where name = 'Металлокаркас для стула'), (select id from product where name = 'Кресло эргономичное цвет Темно-коричневый  '),1.00),
    ((select id from material where name = 'Колесо для мебели поворотное'), (select id from product where name = 'Кресло эргономичное цвет Темно-коричневый  '),5.00),
    ((select id from material where name = 'Газ-лифт'), (select id from product where name = 'Кресло эргономичное цвет Темно-коричневый  '),1.00),
    ((select id from material where name = 'Металлическая крестовина для офисных кресел'), (select id from product where name = 'Кресло эргономичное цвет Темно-коричневый  '),1.00),
    ((select id from material where name = 'Пластиковый комплект для стула'), (select id from product where name = 'Кресло эргономичное цвет Темно-коричневый  '),1.00),
    ((select id from material where name = 'ДСП 2750х1830 мм'), (select id from product where name = 'Полка настольная'),3.33),
    ((select id from material where name = 'Кромка ПВХ'), (select id from product where name = 'Полка настольная'),6.00),
    ((select id from material where name = 'Клееный массив дерева Дуб 1000х600 мм'), (select id from product where name = 'Стеллаж для документов цвет Дуб светлый 854х445х2105 мм'),2.90),
    ((select id from material where name = 'Шпон облицовочный Дуб натуральный 2750х480 мм'), (select id from product where name = 'Стеллаж для документов цвет Дуб светлый 854х445х2105 мм'),1.70),
    ((select id from material where name = 'МДФ 2070х1400 мм'), (select id from product where name = 'Стеллаж для документов цвет Дуб светлый 854х445х2105 мм'),2.70),
    ((select id from material where name = 'ХДФ 2800x2070 мм'), (select id from product where name = 'Стеллаж для документов цвет Дуб светлый 854х445х2105 мм'),1.80),
    ((select id from material where name = 'Клееный массив дерева Дуб 1000х600 мм'), (select id from product where name = 'Стеллаж цвет Белый с ящиками 854х445х2105 мм'),1.70),
    ((select id from material where name = 'Шпон облицовочный Дуб натуральный 2750х480 мм'), (select id from product where name = 'Стеллаж цвет Белый с ящиками 854х445х2105 мм'),1.60),
    ((select id from material where name = 'ХДФ 2800x2070 мм'), (select id from product where name = 'Стеллаж цвет Белый с ящиками 854х445х2105 мм'),1.80),
    ((select id from material where name = 'ДСП 2750х1830 мм'), (select id from product where name = 'Стеллаж цвет Орех 400х370х2000 мм'),2.00),
    ((select id from material where name = 'ДВП 1400х693'), (select id from product where name = 'Стеллаж цвет Орех 400х370х2000 мм'),0.80),
    ((select id from material where name = 'Кромка ПВХ'), (select id from product where name = 'Стеллаж цвет Орех 400х370х2000 мм'),7.00),
    ((select id from material where name = 'МДФ 2070х1400 мм'), (select id from product where name = 'Стол для ноутбука на металлокаркасе 800х600х123 мм'),5.95),
    ((select id from material where name = 'Металлокаркас каркас из профиля с траверсами для стола'), (select id from product where name = 'Стол для ноутбука на металлокаркасе 800х600х123 мм'),1.00),
    ((select id from material where name = 'ДСП 2750х1830 мм'), (select id from product where name = 'Стол компьютерный 700х600х500 мм'),4.30),
    ((select id from material where name = 'Кромка ПВХ'), (select id from product where name = 'Стол компьютерный 700х600х500 мм'),8.60),
    ((select id from material where name = 'МДФ 2070х1400 мм'), (select id from product where name = 'Стол компьютерный на металлокаркасе 1400х600х750 мм'),7.65),
    ((select id from material where name = 'ХДФ 2800x2070 мм'), (select id from product where name = 'Стол компьютерный на металлокаркасе 1400х600х750 мм'),1.05),
    ((select id from material where name = 'Металлокаркас каркас из профиля с траверсами для стола'), (select id from product where name = 'Стол компьютерный на металлокаркасе 1400х600х750 мм'),1.00),
    ((select id from material where name = 'ДСП 2750х1830 мм'), (select id from product where name = 'Стол письменный 1100x750x600 мм'),6.40),
    ((select id from material where name = 'Кромка ПВХ'), (select id from product where name = 'Стол письменный 1100x750x600 мм'),6.20),
    ((select id from material where name = 'Фанера 2200х1000 мм'), (select id from product where name = 'Стол письменный с тумбочкой 4 ящика 1100x750x600 мм'),2.55),
    ((select id from material where name = 'ДСП 2750х1830 мм'), (select id from product where name = 'Стол письменный с тумбочкой 4 ящика 1100x750x600 мм'),5.20),
    ((select id from material where name = 'ДСП 2750х1830 мм'), (select id from product where name = 'Стол письменный с тумбочкой 4 ящика 1100x750x600 мм'),5.22),
    ((select id from material where name = 'ДВП 1400х691'), (select id from product where name = 'Стол письменный с тумбочкой 4 ящика 1100x750x600 мм'),3.59),
    ((select id from material where name = 'Кромка ПВХ'), (select id from product where name = 'Стол письменный с тумбочкой 4 ящика 1100x750x600 мм'),9.40),
    ((select id from material where name = 'Цельный массив дерева Дуб 1000х600 мм'), (select id from product where name = 'Стол руководителя письменный цвет Венге 1600x800x764 мм'),3.50),
    ((select id from material where name = 'Шпон облицовочный Дуб натуральный 2750х480 мм'), (select id from product where name = 'Стол руководителя письменный цвет Венге 1600x800x764 мм'),1.50),
    ((select id from material where name = 'ХДФ 2800x2070 мм'), (select id from product where name = 'Стол руководителя письменный цвет Венге 1600x800x764 мм'),2.10),
    ((select id from material where name = 'Закаленное стекло'), (select id from product where name = 'Стол руководителя письменный цвет Венге 1600x800x764 мм'),0.80),
    ((select id from material where name = 'Цельный массив дерева Дуб 1000х600 мм'), (select id from product where name = 'Стол руководителя письменный цвет Орех темный 2300x1000x750 мм'),7.70),
    ((select id from material where name = 'Шпон облицовочный Дуб натуральный 2750х480 мм'), (select id from product where name = 'Стол руководителя письменный цвет Орех темный 2300x1000x750 мм'),6.50),
    ((select id from material where name = 'ДСП 2750х1830 мм'), (select id from product where name = 'Стол руководителя письменный цвет Орех темный 2300x1000x750 мм'),4.50),
    ((select id from material where name = 'МДФ 2070х1400 мм'), (select id from product where name = 'Стол руководителя письменный цвет Орех темный 2300x1000x750 мм'),5.70),
    ((select id from material where name = 'ХДФ 2800x2070 мм'), (select id from product where name = 'Стол руководителя письменный цвет Орех темный 2300x1000x750 мм'),2.30),
    ((select id from material where name = 'Экокожа 140 см'), (select id from product where name = 'Стол руководителя письменный цвет Орех темный 2300x1000x750 мм'),1.74),
    ((select id from material where name = 'ДСП 2750х1830 мм'), (select id from product where name = 'Тумба выкатная 3 ящика'),4.20),
    ((select id from material where name = 'ДВП 1400х690'), (select id from product where name = 'Тумба выкатная 3 ящика'),2.21),
    ((select id from material where name = 'Колесо для мебели поворотное'), (select id from product where name = 'Тумба выкатная 3 ящика'),4.00),
    ((select id from material where name = 'Кромка ПВХ'), (select id from product where name = 'Тумба выкатная 3 ящика'),6.50),
    ((select id from material where name = 'Клееный массив дерева Дуб 1000х600 мм'), (select id from product where name = 'Тумба офисная для оргтехники'),0.40),
    ((select id from material where name = 'Колесо для мебели поворотное'), (select id from product where name = 'Тумба офисная для оргтехники'),4.00),
    ((select id from material where name = 'Шпон облицовочный Дуб натуральный 2750х480 мм'), (select id from product where name = 'Узкий пенал стеллаж 5 полок цвет Орех 364х326x2000 мм '),0.70),
    ((select id from material where name = 'ДСП 2750х1830 мм'), (select id from product where name = 'Узкий пенал стеллаж 5 полок цвет Орех 364х326x2000 мм '),7.65),
    ((select id from material where name = 'ДВП 1400х694'), (select id from product where name = 'Узкий пенал стеллаж 5 полок цвет Орех 364х326x2000 мм '),0.80),
    ((select id from material where name = 'Кромка ПВХ'), (select id from product where name = 'Узкий пенал стеллаж 5 полок цвет Орех 364х326x2000 мм '),6.30),
    ((select id from material where name = 'Шпон облицовочный Дуб натуральный 2750х480 мм'), (select id from product where name = 'Шкаф для книг 800x420x2000 мм'),3.20),
    ((select id from material where name = 'Фанера 2200х1000 мм'), (select id from product where name = 'Шкаф для книг 800x420x2000 мм'),3.50),
    ((select id from material where name = 'ДВП 1400х692'), (select id from product where name = 'Шкаф для книг 800x420x2000 мм'),1.60),
    ((select id from material where name = 'Закаленное стекло'), (select id from product where name = 'Шкаф для книг 800x420x2000 мм'),1.60),
    ((select id from material where name = 'Шпон облицовочный Дуб натуральный 2750х480 мм'), (select id from product where name = 'Шкаф для одежды цвет Венге 602x420x2000 мм'),1.30),
    ((select id from material where name = 'ДСП 2750х1830 мм'), (select id from product where name = 'Шкаф для одежды цвет Венге 602x420x2000 мм'),8.20),
    ((select id from material where name = 'ХДФ 2800x2070 мм'), (select id from product where name = 'Шкаф для одежды цвет Венге 602x420x2000 мм'),1.30),
    ((select id from material where name = 'Цельный массив дерева Дуб 1000х600 мм'), (select id from product where name = 'Шкаф-витрина 2 ящика 800x420x2000 мм'),1.80),
    ((select id from material where name = 'Шпон облицовочный Дуб натуральный 2750х480 мм'), (select id from product where name = 'Шкаф-витрина 2 ящика 800x420x2000 мм'),3.50),
    ((select id from material where name = 'ХДФ 2800x2070 мм'), (select id from product where name = 'Шкаф-витрина 2 ящика 800x420x2000 мм'),1.65),
    ((select id from material where name = 'Закаленное стекло'), (select id from product where name = 'Шкаф-витрина 2 ящика 800x420x2000 мм'),1.60);