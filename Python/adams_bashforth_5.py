from sympy import *


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

"""
Metodo de adams bashforth 4 para calculo de ecuaciones diferenciales
numericas
Entradas: Valor inicial, extremos del rango inicial, 
cantidad de puntos, y funcion a evaluar
Salidas: Vector de puntos en x, vector de puntos en y
"""
def adams_bashforth_5(y0, a, b, n, funcion):
    h = (b - a) / (n - 1)
    temp = euler(y0, a, a + 4 * h, 5, funcion)
    x = temp[0]
    y = temp[1]

    variable1 = Symbol('x')
    variable2 = Symbol('y')
    funcion = sympify(funcion)
    f = lambdify([variable1, variable2], funcion, "numpy")

    for i in range(4, n - 1):
        x.append(x[i] + h)
        y.append(y[i] + h / 720 * (1901 * f(x[i], y[i]) - 2774 * f(x[i - 1], y[i - 1]) +
                                   2616 * f(x[i - 2], y[i - 2]) - 1274 * f(x[i - 3], y[i - 3]) +
                                   251 * f(x[i - 4], y[i - 4])))
    return x, y


print(adams_bashforth_5(1, 2, 4, 11, '1 + (x - y)**2'))
