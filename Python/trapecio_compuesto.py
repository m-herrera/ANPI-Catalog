from sympy import *


"""
Regla del trapecio compuesto para aproximacion de integrales
Entradas:limites de integracion, cantidad de subintervalos, 
funcion a integrar
Salidas: aproximacion de integral.
"""
def trapecio_compuesto(a, b, n, funcion):
    x = Symbol('x')
    funcion = sympify(funcion)
    f = lambdify(x, funcion, "numpy")

    h = (b - a) / (n - 1)
    sum = 0
    for i in range(n - 1):
        sum += f(a + i * h) + f(a + (i + 1) * h)
    return h / 2 * sum


print(trapecio_compuesto(2, 5, 4, "log(x)"))
