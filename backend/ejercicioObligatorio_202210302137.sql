CREATE TABLE ejercicioObligatorio (
  id int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(40) NOT NULL,
  apellido varchar(40) NOT NULL,
  edad tinyint(2) NOT NULL,
  fecha timestamp NOT NULL DEFAULT current_timestamp(),
  provincia varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO ejercicioObligatorio (nombre,apellido,edad,provincia) VALUES
	 ('nombre1','apellido1',11,'BSAS'),
	 ('nombre2','apellido2',12,'CORDOBA'),
	 ('nombre3','apellido3',13,'CATAMARCA'),
	 ('nombre4','apellido4',14,'CHUBUT'),
	 ('nombre5','apellido5',15,'LA RIOJA');
