DROP DATABASE IF EXISTS LAB_MYSQL;

CREATE DATABASE LAB_MYSQL;

USE LAB_MYSQL;

CREATE TABLE cliente (
	id_cliente  INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(30),
    direccion VARCHAR(100),
    ciudad VARCHAR(30),
    provincia VARCHAR(30),
    pais VARCHAR(20),
    codigo_postal VARCHAR(10)
);

CREATE TABLE coche (
	id_coche INT PRIMARY KEY AUTO_INCREMENT,
    vin VARCHAR(17) NOT NULL UNIQUE,
    fabricante VARCHAR(30) NOT NULL,
    modelo VARCHAR(30) NOT NULL,
    ano SMALLINT NOT NULL,
    color VARCHAR(15)
);
    
CREATE TABLE vendedor (
	id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    tienda VARCHAR(30)
);

CREATE TABLE factura (
	id_factura INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    
    id_coche INT NOT NULL,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    
    FOREIGN KEY (id_coche) REFERENCES coche(id_coche),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);


    
    
    