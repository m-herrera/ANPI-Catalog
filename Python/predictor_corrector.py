from sympy import *


"""
Metodo predictor corrector para calculo de ecuaciones diferenciales
numericas
Entradas: Valor inicial, extremos del rango inicial, 
cantidad de puntos, y funcion a evaluar
Salidas: Vector de puntos en x, vector de puntos en y
"""
def predictor_corrector(y0, a, b, n, funcion):
    variable1 = Symbol('x')
    variable2 = Symbol('y')
    funcion = sympify(funcion)
    f = lambdify([variable1, variable2], funcion, "numpy")

    h = (b - a) / (n - 1)

    x = [a]
    y = [y0]
    y_aux = []
    for i in range(n - 1):
        y_aux.append(y[i] + h * f(x[i], y[i]))
        x.append(x[i] + h)
        y.append(y[i] + h * (f(x[i], y[i]) + f(x[i + 1], y_aux[i])) / 2)

    return x, y

print(predictor_corrector(0.5, 0, 2, 11, 'y - x**2 + 1'))
