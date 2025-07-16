#1. Importa el paquete NUMPY bajo el nombre np.
import numpy as np

#2. Imprime la versión de NUMPY y la configuración.
# __version__ => atributo especial del modulo numpy (__XX__) 
print("Version de numpy: ", np.__version__)
np.show_config()

#3. Genera un array tridimensional de 2x3x5 con valores aleatorios. Asigna el array a la variable "a"
# Desafío: hay al menos tres maneras fáciles que usan numpy para generar arrays aleatorios. ¿Cuántas formas puedes encontrar?

# 3 metodos diferentes para crear un array x con valores randomizados
a = np.random.randint(5000,size=(2, 3, 5))
arr2 = np.random.uniform(5000.0, size=(2, 3, 5))
arr3 = np.random.choice(5000, size=(2, 3, 5))

#4. Imprime a.

print(f"Array 2,3,5 with Randint:\n\n{a}\n\n")
#print(f"Array 2,3,5 with uniform:\n\n{arr2}\n\n")
#print(f"Array 2,3,5 with choice:\n\n{arr3}\n\n")


#5. Crea un array tridimensional de 5x2x3 con todos los valores igual a 1.
#Asigna el array a la variable "b"

# full crea un array con el size dado en la tupla y lo rellena con x
b = np.full((5, 2, 3), 1)

#6. Imprime b.

print(f"Array 5, 2, 3 with full 1:\n\n{b}\n\n")

#7. ¿Tienen a y b el mismo tamaño? ¿Cómo lo demuestras en código Python?

print(f"¿a y b tienen el mismo tamaño? {a.size == b.size}")
print(f"Size de a: {a.size}")
print(f"Size de b: {b.size}")

#8. ¿Es posible sumar a y b? ¿Por qué sí o por qué no?

# No es posible aplicar la suma porque las dimensiones son imcompatibles
# No es capaz de encontrar relaciones entre arrays con dimensiones diferentes.

#9. Transpone b para que tenga la misma estructura que a (es decir, se convierta en un array de 2x3x5). Asigna el array transpuesto a la variable "c".
# a => 2, 3, 5
print(f"A shape: {a.shape}")
print(f"B shape: {b.shape}")
# b => 5, 2, 3
# si quiero tener un arry 3d, (x, z, y), transpose me coge la shape de ese array
# en este caso b.transpose me coge (5, 2, 3) y me dice que modifique el orden de esos valores
# para el array transpuesto
# b es 3d, tiene (x, y, z) y es (5, 2, 3) es, mueve el primero (5) al indice posicion 1, es decir, (x(0), y(1), z(2))
# el que es 2 (el 2) ponlo en la posicion 2 es decir el tercero, y el que estaba en la posicion 3 (el z = 3) ponlo en el indice 0
c = b.transpose(1, 2, 0)
print(f"C shape: {c.shape}")

#10. Intenta sumar a y c. Ahora debería funcionar. Asigna la suma a la variable "d". Pero, ¿por qué funciona ahora?

#d = np.add(a, c)
d = a + c
print(f"Array d: \n{d}")

#11. Imprime a y d. ¿Notas la diferencia y la relación entre los dos arrays en términos de los valores? Explica.

print("___________________________________________")
print(f"Array 'A':\n {a}")
print("___________________________________________")
print(f"Array 'D':\n {d}\n")
print("La diferencia esta clara, D es A + 1 en cada elemento iterable. La relacion es (n = n + 1)")

#12. Multiplica a y c. Asigna el resultado a e.

#e = np.multiply(a, c)
e = a * c
print(f"Array 'E':\n {e}")

#13. ¿Es e igual a a? ¿Por qué sí o por qué no?

print(f"¿e y a tienen el mismo tamaño? {e.size == a.size}")
print(f"Size de e: {e.size} Shape: {e.shape}")
print(f"Size de a: {a.size} Shape: {a.shape}")
print("Son iguales porque? Ambos tienen la misma estructura tridimensional, como 'E' esta full de 1, los valores de 'A' en 'E' no cambian al multiplicarlos.")

#14. Identifica los valores máximos, mínimos y medios en d. Asigna esos valores a las variables "d_max", "d_min" y "d_mean"

d_max = np.max(d)
d_min = np.min(d)
d_mean = np.mean(d)

print(f"""
Valores máximos, mínimos y medios en d:
    d_max: {d_max}
    d_min: {d_min}
    d_mean: {d_mean}
    """)

#15. Ahora queremos etiquetar los valores en d. Primero crea un array vacío "f" con la misma forma (es decir, 2x3x5) que d usando `np.empty`.

# metodo empty crea un array con las medidas dadas en shape.
f = np.empty(shape=(2, 3, 5))
print(f"Array 'F':\n {f}\n")

"""
#16. Rellena los valores en f. Para cada valor en d, si es mayor que d_min pero menor que d_mean, asigna 25 al valor correspondiente en f.
Si un valor en d es mayor que d_mean pero menor que d_max, asigna 75 al valor correspondiente en f.
Si un valor es igual a d_mean, asigna 50 al valor correspondiente en f.
Asigna 0 al valor correspondiente(s) en f para d_min en d.
Asigna 100 al valor correspondiente(s) en f para d_max en d.
Al final, f debería tener solo los siguientes valores: 0, 25, 50, 75 y 100.
Nota: no necesitas usar Numpy en esta pregunta.
"""

# como es un array tridimensional, con i accedemos a la row, con j accedemos a la col, y con k accedemos a cada valor del array
# Despues accedemos por indice a f y modificamos valor acorde a los condicionales

for i in range(d.shape[0]):
    for j in range(d.shape[1]):
        for k in range(d.shape[2]):
            value = 0
            if d[i][j][k] > d_min and d[i][j][k] < d_mean:
                value = 25
            elif d[i][j][k] == d_mean:
                value = 50
            elif d[i][j][k] > d_mean and d[i][j][k] < d_max:
                value = 75
            elif d[i][j][k] >= d_max:
                value = 100
            f[i][j][k] = value


"""
#17. Imprime d y f. ¿Tienes el f esperado?
Por ejemplo, si tu d es:
array([[[1.85836099, 1.67064465, 1.62576044, 1.40243961, 1.88454931],
        [1.75354326, 1.69403643, 1.36729252, 1.61415071, 1.12104981],
        [1.72201435, 1.1862918 , 1.87078449, 1.7726778 , 1.88180042]],

       [[1.44747908, 1.31673383, 1.02000951, 1.52218947, 1.97066381],
        [1.79129243, 1.74983003, 1.96028037, 1.85166831, 1.65450881],
        [1.18068344, 1.9587381 , 1.00656599, 1.93402165, 1.73514584]]])

Tu f debería ser:
array([[[ 75.,  75.,  75.,  25.,  75.],
        [ 75.,  75.,  25.,  25.,  25.],
        [ 75.,  25.,  75.,  75.,  75.]],

       [[ 25.,  25.,  25.,  25., 100.],
        [ 75.,  75.,  75.,  75.,  75.],
        [ 25.,  75.,   0.,  75.,  75.]]])
"""

#[tu código aquí]

print(f"Array 'D':\n {d}\n")

print(f"Array 'F':\n {f}\n")


"""
#18. Pregunta de bonificación: en lugar de usar números (es decir, 0, 25, 50, 75 y 100), ¿cómo usar valores de cadena 
("A", "B", "C", "D" y "E") para etiquetar los elementos del array? Esperas el resultado sea:
array([[[ 'D',  'D',  'D',  'B',  'D'],
        [ 'D',  'D',  'B',  'B',  'B'],
        [ 'D',  'B',  'D',  'D',  'D']],

       [[ 'B',  'B',  'B',  'B',  'E'],
        [ 'D',  'D',  'D',  'D',  'D'],
        [ 'B',  'D',   'A',  'D', 'D']]])
De nuevo, no necesitas Numpy en esta pregunta.
"""

# por defecto el tipo es int, por lo que para meter un char o str debemos de crear un nuevo array con 
# el data type seteado a str.
g = np.empty(shape=(2, 3, 5), dtype=str)

# creamos un diccionario para asociar el valor numerico a un valor alfabetico
dic_values = {0:"A", 25:"B", 50:"C", 75:"D", 100:"E"}
# como es un array tridimensional, con i accedemos a la row, con j accedemos a la col, y con k accedemos a cada valor del array
# Despues accedemos por indice a g y modificamos valor acorde a los condicionales
for i in range(d.shape[0]):
    for j in range(d.shape[1]):
        for k in range(d.shape[2]):
            value = 0
            if d[i][j][k] == d_min:
                value = 0
            elif d[i][j][k] > d_min and d[i][j][k] < d_mean:
                value = 25
            elif d[i][j][k] == d_mean:
                value = 50
            elif d[i][j][k] > d_mean and d[i][j][k] < d_max:
                value = 75
            elif d[i][j][k] == d_max:
                value = 100
            g[i][j][k] = dic_values[value]
            
print(f"Array 'G' with letters:\n {g}\n")