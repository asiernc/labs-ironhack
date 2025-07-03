USE LAB_MYSQL;

SELECT id_cliente FROM cliente WHERE ciudad='Mimia';
-- problemas modo seguro, requiere comparacion con id
UPDATE cliente SET ciudad='Miami' WHERE id_cliente=20001 and ciudad='Mimia';

SELECT * FROM cliente WHERE id_cliente=20001;

SELECT id_cliente, nombre as IDs, nombre FROM cliente;

UPDATE cliente SET correo='ppicasso@gmail.com' WHERE id_cliente=10001;
UPDATE cliente SET correo='lincoln@us.gov' WHERE id_cliente=20001;
UPDATE cliente SET correo='hello@napoleon.me' WHERE id_cliente=30001;