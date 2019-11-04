from sympy import *

"""
Metodo de interpolacion de las diferencias divididas
de newton
Entradas: puntos en x y puntos en y
Salidas: polinomio de lagrange.
"""
def diferencias_newton(x_points, y_points):
    x = Symbol('x')
    n = len(x_points)
    polinomio = 0
    for i in range(n):
        prod = 1
        for j in range(i, 0, -1):
            prod *= (x - x_points[j - 1])
        polinomio += f(x_points[0:i + 1], y_points[0:i + 1]) * prod
    return simplify(polinomio)


#funcion auxiliar
def f(x, y):
    n = len(x)
    m = math.ceil(n / 2)
    if n == 1:
        return y[0]
    elif n % 2 != 0:
        return (f(x[0:m], y[0:m]) - f(x[m - 1:n], y[m - 1:n])) / (x[0] - x[n - 1])
    else:
        return (f(x[0:m], y[0:m]) - f(x[m:n], y[m:n])) / (x[0] - x[n - 1])


print(diferencias_newton([-2, 0, 1], [0, 1, -1]))
