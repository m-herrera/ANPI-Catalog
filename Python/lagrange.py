from sympy import *


"""
Metodo de interpolacion de lagrange
Entradas: puntos en x y puntos en y
Salidas: polinomio de lagrange.
"""
def lagrange(x_points, y_points):
    n = len(x_points)
    x = Symbol('x')
    polinomio = 0
    for k in range(n):
        prod = 1
        for i in range(n):
            if i != k:
                prod *= (x - x_points[i]) / (x_points[k] - x_points[i])
        polinomio += prod * y_points[k]

    return simplify(polinomio)


print(lagrange([-2, 0, 1], [0, 1, -1]))
