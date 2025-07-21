-- Identificar los Principales Tipos de Quejas
-- Consulta el conjunto de datos para encontrar los 5 tipos principales de quejas basados en el número de quejas registradas.
-- Utiliza GROUP BY para agrupar los datos por tipo de queja y ORDER BY para ordenar los resultados.

SELECT ComplaintType, COUNT(*) AS TotalQuejas
FROM complaints_311
GROUP BY ComplaintType
ORDER BY TotalQuejas DESC
LIMIT 5;

-- Analizar Quejas por Distrito
-- Calcula el número total de quejas para cada distrito.
-- Utiliza la cláusula GROUP BY para agrupar los datos por distrito.

SELECT Borough, COUNT(*) AS TotalQuejas
FROM complaints_311
GROUP BY Borough
ORDER BY TotalQuejas DESC;

-- Filtrar Tipos de Quejas de Alto Volumen
-- Utiliza la cláusula HAVING para filtrar tipos de quejas que tienen más de 1000 quejas registradas.
-- Muestra el tipo de queja y el recuento de quejas.

SELECT ComplaintType, COUNT(*) AS TotalQuejas
FROM complaints_311
GROUP BY ComplaintType
HAVING COUNT(*) > 1000
ORDER BY TotalQuejas DESC;

-- Comparación de Distritos para un Tipo Específico de Queja
-- Elige un tipo particular de queja.
-- Compara el número de dichas quejas en cada distrito.

SELECT Borough, COUNT(*) AS TotalQuejas
FROM complaints_311
WHERE ComplaintType = 'Illegal Fireworks' -- change for anything different complaint
GROUP BY Borough
ORDER BY TotalQuejas DESC;
