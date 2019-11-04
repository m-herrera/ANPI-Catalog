from sympy import *


"""
Regla del trapecio para aproximacion de integrales
Entradas:limites de integracion, funcion a integrar
Salidas: aproximacion de integral.
"""
def trapecio(a, b, funcion):
    x = Symbol('x')
    funcion = sympify(funcion)
    f = lambdify(x, funcion, "numpy")

    return (f(a) + f(b)) * (b - a) / 2


print(trapecio(2, 5, "log(x)"))
