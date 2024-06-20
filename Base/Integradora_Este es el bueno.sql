-- create database integradora;
-- drop database integradora;
-- use integradora;


create table Users(
	id_user int(5) primary key,
    first_name varchar (30) not null,
    last_name varchar (30) not null,
    email varchar(50) not null,
    password varchar (256) not null,
    id_user_type int(5) REFERENCES User_type(ute_id),
	id_grupo int(5) REFERENCES Grupos(grp_id)
);

Create table Bookings(
	id_booking int(5) primary key,
	fecha date not null,
    start_time time not null,
    end_time time not null,
	id_status int(5) references Status(sts_id),
	id_user int(5) REFERENCES Users(usr_id)
);

create table Buildings(
	id_building int(5) primary key,
    name varchar (30)
);

create table Spaces(
	id_spaces int(5) primary key,
    name varchar(30) not null,
	id_building int(5) REFERENCES Buildings(bdg_id),
	id_status int(5) REFERENCES Status(sts_id)
);

create table Grupos(
	id_grupo int(5) primary key,
    name varchar(50)
);

CREATE TABLE Schedules (
    id_schedul int(5) PRIMARY KEY,
    week_day VARCHAR(20) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    description VARCHAR(50),
	id_spaces int(5) REFERENCES Spaces(spe_id),
	id_subject int(5) REFERENCES Subjects(sjt_id)
);

CREATE TABLE Subjects(
    id_subject int(5) PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

create table User_type(
	id_user_type int(5) primary key,
    description varchar(50) not null
);

create table Spaces_has_Grupos(
	id_spaces int(5) REFERENCES Spaces(spe_id),
    id_grupo int(5) references Grupos(gro_id)
);

create table Status(
	id_status int(5) primary key,
    description varchar(45) not null
);

select * from Users;

select * from User_type;

select u.id_user as ID, u.first_name as Nombre, u.last_name as Apellido, u.email as Correo, 
u.password as Contraseña, ut.description as Tipo_Usuario, g.name  as Grupo
from Users u join User_type ut on u.id_user_type = ut.id_user_type left join Grupos g on u.id_grupo = g.id_grupo;

select * from Bookings;
select b.id_booking as ID, b.fecha as Fecha, b.start_time as 'Hora de inicio', b.end_time as 'Hora fin', s.description as Estado,
u.first_name as Nombre from Bookings b join status s on b.id_status = s.id_status join Users u on b.id_user = u.id_user;

select * from Buildings;

select * from Spaces;
select s.id_spaces as ID, s.name AS Espacio, b.name as 'Edificio', st.description as Estado from Spaces s 
join buildings b on s.id_building = b.id_building 
join Status st on s.id_status = st.id_status;

select * from Spaces_has_Grupos;

select s.name as Espacio, g.name as Grupo from Spaces_has_Grupos sg 
join Spaces s on sg.id_spaces = s.id_spaces
join Grupos g on sg.id_grupo = g.id_grupo;

select * from Grupos;
select * from Schedules;



select * from Subjects;
select * from Status;

INSERT INTO User_type (id_user_type, description) values (1, 'Administrador');
INSERT INTO User_type (id_user_type, description) values (2, 'Maestro');
INSERT INTO User_type (id_user_type, description) values (3, 'Estudiante');

INSERT INTO Grupos (id_grupo, name) values (1, '1°A');
INSERT INTO Grupos (id_grupo, name) values (2, '1°B');
INSERT INTO Grupos (id_grupo, name) values (3, '1°C');
INSERT INTO Grupos (id_grupo, name) values (4, '1°D');
INSERT INTO Grupos (id_grupo, name) values (5, '1°E');

INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (1, 'Hugo', 'Alejandes', 'hugoalejandres@utez.edu.mx', sha2('Alejandres1234', 256), 1, null);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (2, 'Evelin', 'Villalva', 'evelinvillalva@utez.edu.mx', sha2('Evelin1234', 256), 2, null);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (3, 'Pablo', 'Perez', '20233tn111@utez.edu.mx', sha2('Pablito2907', 256), 3, 2);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (4, 'Alexis', 'Apaez', '20233tn139@utez.edu.mx', sha2('Apaez1234', 256), 3, 2);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (5, 'Vanessa', 'Negrete', '20233tn112@utez.edu.mx', sha2('Vanessa1234', 256), 3, 2);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (6, 'Jesus', 'Perez', 'jesusperez@utez.edu.mx', sha2('Jesus1234', 256), 2, null);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (7, 'Enrique', 'Segura', 'enriquesegura@utez.edu.mx', sha2('Enrique1234', 256), 2, null);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (8, 'Christian', 'Garcia', 'christiangarcia@utez.edu.mx', sha2('Garcia1234', 256), 2, null);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (9, 'Mario', 'Castañeda', 'mariocastañeda@utez.edu.mx', sha2('MarCA1234', 256), 2, null);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (10, 'Guillermo', 'Del Toro', 'guillermodeltoro@utez.edu.mx', sha2('kjhfef8595', 256), 1, null);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (11, 'Erick', 'Garcia', '20233tn149@utez.edu.mx', sha2('iug6r5f7g',256), 3, 1);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (12, 'Isaac', 'Barcelata', '20233tn182@utez.edu.mx', sha2('hjf6r7gu', 256), 3, 1);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (13, 'Oscar', 'Pedraza', '20233tn143@utez.edu.mx', sha2('jhftrs97r7', 256), 3, 1);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (14, 'Angel', 'Murga', '20233tn150@utez.edu.mx', sha2('kjgty687tyu', 256), 3, 3);
INSERT INTO Users (id_user, first_name, last_name, email, password, id_user_type, id_grupo) values (15, 'Bryan', 'Villamil', '20233tn115@utez.edu.mx', sha2('jhfrd6r7', 256), 3, 3);

INSERT INTO Buildings (id_building, name) values (1, 'Docencia 1');
INSERT INTO Buildings (id_building, name) values (2, 'Docencia 2');
INSERT INTO Buildings (id_building, name) values (3, 'Docencia 3');
INSERT INTO Buildings (id_building, name) values (4, 'Docencia 4');
INSERT INTO Buildings (id_building, name) values (5, 'Docencia 5');
INSERT INTO Buildings (id_building, name) values (6, 'CEDIM');
INSERT INTO Buildings (id_building, name) values (7, 'CECADEC');

INSERT INTO Status (id_status, description) values (1, 'Activo');
INSERT INTO Status (id_status, description) values (2, 'Inactivo');
INSERT INTO Status (id_status, description) values (3, 'Pendiente');

INSERT INTO Bookings (id_booking, fecha, start_time, end_time, id_status, id_user) values (1, '2024-01-13', '07:00:00', '09:00:00', 3, 1);
INSERT INTO Bookings (id_booking, fecha, start_time, end_time, id_status, id_user) values (2, '2024-05-17', '07:00:00', '09:00:00', 2, 2);
INSERT INTO Bookings (id_booking, fecha, start_time, end_time, id_status, id_user) values (3, '2024-03-28', '07:00:00', '09:00:00', 1, 1);
INSERT INTO Bookings (id_booking, fecha, start_time, end_time, id_status, id_user) values (4, '2024-06-20', '07:00:00', '09:00:00', 3, 1);
INSERT INTO Bookings (id_booking, fecha, start_time, end_time, id_status, id_user) values (5, '2024-02-25', '07:00:00', '09:00:00', 2, 2);
INSERT INTO Bookings (id_booking, fecha, start_time, end_time, id_status, id_user) values (6, '2024-05-15', '07:00:00', '09:00:00', 2, 2);
INSERT INTO Bookings (id_booking, fecha, start_time, end_time, id_status, id_user) values (7, '2024-04-24', '07:00:00', '09:00:00', 1, 1);

INSERT INTO Subjects (id_subject, name) values (1, 'Base de Datos');
INSERT INTO Subjects (id_subject, name) values (2, 'Programacion Orientada a Objetos');
INSERT INTO Subjects (id_subject, name) values (3, 'Aplicaciones WEB');
INSERT INTO Subjects (id_subject, name) values (4, 'Sistemas Operativos');
INSERT INTO Subjects (id_subject, name) values (5, 'Integradora');
INSERT INTO Subjects (id_subject, name) values (6, 'Calculo');
INSERT INTO Subjects (id_subject, name) values (7, 'Formacion Sociocultural');
INSERT INTO Subjects (id_subject, name) values (8, 'Tutoria');
INSERT INTO Subjects (id_subject, name) values (9, 'Ingles');

INSERT INTO Spaces (id_spaces, name, id_building, id_status) values (1, 'CompuAula', 2, 1);
INSERT INTO Spaces (id_spaces, name, id_building, id_status) values (2, 'Centro de computo', 4, 2);
INSERT INTO Spaces (id_spaces, name, id_building, id_status) values (3, 'Auditorio', 1, 3);
INSERT INTO Spaces (id_spaces, name, id_building, id_status) values (4, 'Aula 10', 1, 3);
INSERT INTO Spaces (id_spaces, name, id_building, id_status) values (5, 'Centro de computo', 7, 1);
INSERT INTO Spaces (id_spaces, name, id_building, id_status) values (6, 'Aula 3', 1, 1);

INSERT INTO Schedules (id_schedul, week_day, start_time, end_time, description, id_spaces, id_subject) values (1, 'Lunes', '07:00:00', '09:00:00', null, 1, 1);
INSERT INTO Schedules (id_schedul, week_day, start_time, end_time, description, id_spaces, id_subject) values (2, 'Lunes', '09:00:00', '10:00:00', null, 2, 4);
INSERT INTO Schedules (id_schedul, week_day, start_time, end_time, description, id_spaces, id_subject) values (3, 'Lunes', '10:00:00', '12:00:00', null, 4, 8);
INSERT INTO Schedules (id_schedul, week_day, start_time, end_time, description, id_spaces, id_subject) values (4, 'Lunes', '12:00:00', '13:00:00', null, 2, 1);
INSERT INTO Schedules (id_schedul, week_day, start_time, end_time, description, id_spaces, id_subject) values (5, 'Lunes', '13:00:00', '14:00:00', null, 5, 1);
INSERT INTO Schedules (id_schedul, week_day, start_time, end_time, description, id_spaces, id_subject) values (6, 'Lunes', '14:00:00', '16:00:00', null, 6, 6);

INSERT INTO Spaces_has_Grupos (id_spaces, id_grupo) values (1, 4);
INSERT INTO Spaces_has_Grupos (id_spaces, id_grupo) values (2, 3);
INSERT INTO Spaces_has_Grupos (id_spaces, id_grupo) values (3, 2);
INSERT INTO Spaces_has_Grupos (id_spaces, id_grupo) values (4, 1);
