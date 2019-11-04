from sympy import *


"""
Metodo de euler para calculo de ecuaciones diferenciales
numéricas
Entradas: Valor inicial, extremos del rango inicial, 
cantidad de puntos, y función a evaluar
Salidas: Vector de puntos en x, vector de puntos en y
"""
def euler(y0, a, b, n, funcion):
    variable1 = Symbol('x')
    variable2 = Symbol('y')
    funcion = sympify(funcion)
    f = lambdify([variable1, variable2], funcion, "numpy")

    h = (b - a) / (n - 1)

    x = [a]
    y = [y0]
    for i in range(n - 1):
        x.append(x[i] + h)
        y.append(y[i] + h * f(x[i], y[i]))

    return x, y


print(euler(0.5, 0, 2, 11, 'y - x**2 + 1'))
