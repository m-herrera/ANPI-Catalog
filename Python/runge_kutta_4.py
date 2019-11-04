from sympy import *


"""
Metodo de runge kutta de orden 4 para calculo de ecuaciones diferenciales
numericas
Entradas: Valor inicial, extremos del rango inicial, 
cantidad de puntos, y funcion a evaluar
Salidas: Vector de puntos en x, vector de puntos en y
"""
def runge_kutta_4(y0, a, b, n, funcion):
    variable1 = Symbol('x')
    variable2 = Symbol('y')
    funcion = sympify(funcion)
    f = lambdify([variable1, variable2], funcion, "numpy")

    h = (b - a) / (n - 1)

    x = [a]
    y = [y0]
    k_4 = []
    k_3 = []
    k_2 = []
    k_1 = []
    for i in range(n - 1):
        k_1.append(f(x[i], y[i]))
        k_2.append(f(x[i] + h / 2, y[i] + h * k_1[i] / 2))
        k_3.append(f(x[i] + h / 2, y[i] + h * k_2[i] / 2))
        k_4.append(f(x[i] + h, y[i] + h * k_3[i]))
        x.append(x[i] + h)
        y.append(y[i] + h / 6 * (k_1[i] + 2 * k_2[i] + 2 * k_3[i] + k_4[i]))

    return x, y


print(runge_kutta_4(1, 0, 1, 11, '-x*y + 4*x/y'))
