USE LAB_MYSQL;

INSERT INTO coche(id_coche, vin, fabricante, modelo, ano, color)
VALUES ('0', 'K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Azul'),
('1', 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Rojo'),
('2', 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'Blanco'),
('3', 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Plata'),
('4', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gris'),
('5', 'DAM41UDN3CHU2WVF7', 'Volvo', 'V60 Cross Country', 2019, 'Gris');

INSERT INTO cliente(id_cliente, nombre, telefono, correo, direccion, ciudad, provincia, pais, codigo_postal)
VALUES ('10001', 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chope', 'Madrid', 'Madrid', 'Spain', '28045'),
('20001', 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130'),
('30001', 'Napoleon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');

INSERT INTO vendedor(id_vendedor, nombre, tienda)
VALUES ('00001', 'Petey Cruiser', '0'),
('00002', 'Anna Sthesia', '1'),
('00003', 'Paul Molive', '2'),
('00004', 'Gail Forcewind', '3'),
('00005', 'Paige Turner', '4'),
('00006', 'Bob Frapples', '5'),
('00007', 'Walter Melon', '6'),
('00008', 'Shonda Leer', 'São Paulo');

INSERT INTO factura(id_factura, fecha, id_coche, id_cliente, id_vendedor)
VALUES ('852399038', '2018-08-22', '0','10001','3'),
('731166526', '2018-12-31', '3', '20001', '5'),
('271135104', '2019-01-22', '2','30001','7');