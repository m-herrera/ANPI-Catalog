from sympy import *


"""
Regla de simpson para aproximacion de integrales
Entradas:limites de integracion, funcion a integrar
Salidas: aproximacion de integral.
"""
def simpson(a, b, funcion):
    x = Symbol('x')
    funcion = sympify(funcion)
    f = lambdify(x, funcion, "numpy")

    return (b - a) / 6 * (f(a) + 4 * f((a + b) / 2) + f(b))


print(simpson(2, 5, "log(x)"))
