from sympy import *
import math
import numpy as np


"""
Metodo iterativo de muller, para solucion de ecuaciones no lineales.
Entradas: limites del rango inicial de iteracion, tolerancia minima del
resultado y funcion a evaluar en formato lambda.
Salidas:Valor aproximado y numero de iteraciones
"""
def muller(x0, x1, x2, tol, funcion):
    variable = Symbol('x')
    funcion = sympify(funcion)
    f = lambdify(variable, funcion, "numpy")
    iteracion = 0

    while abs(f(x0)) >= tol:
        A = np.array([[x0**2, x0, 1], [x1**2, x1, 1], [x2**2, x2, 1]])
        B = np.array([f(x0), f(x1), f(x2)])
        parametros = np.linalg.solve(A, B)
        a = parametros[0]
        b = parametros[1]
        c = parametros[2]
        next_iter = values(a, b, c, x0, x1, x2);
        x0 = next_iter[0]
        x1 = next_iter[1]
        x2 = next_iter[2]
        iteracion += 1
    return x0, iteracion


"""
Metodo auxiliar de muller, para calculo de soluciones cuadráticas y determinar
solución apropiada
Entradas: coeficientes de la ecuacion cuadratica, valores de iteracion
Salidas: tupla de proxima iteracion
"""
def values(a, b, c, x0, x1, x2):
    r1 = (-b + math.sqrt(b**2 - 4 * a * c)) / (2 * a)
    r2 = (-b - math.sqrt(b**2 - 4 * a * c)) / (2 * a)
    mins1 = get_closest(x0, x1, x2, r1)
    mins2 = get_closest(x0, x1, x2, r2)
    if (abs(mins1[0] - r1) + abs(mins1[1] - r1) <
        abs(mins2[0] - r2) + abs(mins2[1] - r2)):
        return mins1
    else:
        return mins2


"""
Metodo auxiliar de muller, para calculo de cercania de puntos
Entradas: solucion y 3 puntos adjacentes
Salidas: tupla de solucion y 2 puntos mas cercanos
"""
def get_closest(x0, x1, x2, r):
    closest = [x0, x1, r]
    if abs(x2 - r) < abs(x0 - r):
        closest[0] = x2
        if abs(x0 - r) < abs(x1 - r):
            closest[1] = x0
    elif abs(x2 - r) < abs(x1 - r):
        closest[1] = x2
    return closest
