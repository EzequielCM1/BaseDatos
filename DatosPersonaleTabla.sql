create table datos_personales (
 usuario varchar(10) NOT NULL PRIMARY KEY,
fecha_nacimiento date NULL,
ultimo_login timestamp NULL,
num_accesos INT NULL default 0,
 foreign key (usuario) references  usuarios (usuario) ON DELETE CASCADE
);
