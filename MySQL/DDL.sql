CREATE DATABASE prueba_back;

USE prueba_back;

CREATE TABLE platillo (
	id INT NOT NULL AUTO_INCREMENT,
	plato VARCHAR (50) NOT NULL,
	descripcion VARCHAR (200),
	precio INT UNSIGNED DEFAULT 0,
	PRIMARY KEY (id)
);
CREATE TABLE cliente (
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    correo VARCHAR (100),
    platillo_id INT,
    valoracion_id INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE valoracion (
    id INT NOT NULL AUTO_INCREMENT,
    platillo_id INT NOT NULL,
    comentario VARCHAR (200),
    valoracion TINYINT,
    PRIMARY KEY (id)
);

ALTER TABLE cliente
	ADD FOREIGN KEY (valoracion_id) REFERENCES valoracion(id) 
		ON UPDATE NO ACTION 
        ON DELETE NO ACTION,
	ADD FOREIGN KEY (platillo_id) REFERENCES platillo(id) 
		ON UPDATE NO ACTION 
        ON DELETE NO ACTION;
        
ALTER TABLE valoracion
	ADD FOREIGN KEY (platillo_id) REFERENCES platillo(id) 
		ON UPDATE NO ACTION 
        ON DELETE NO ACTION;
