import math
import sympy


"""
Metodo iterativo de biseccion, para solucion de ecuaciones no lineales.
Entradas: limites del rango inicial de iteracion, tolerancia minima del
resultado y funcion a evaluar en formato lambda.
Salidas:Valor aproximado y numero de iteraciones
"""
def biseccion(a, b, tolerance, function):
    if eval(function)(a) * eval(function)(b) > 0:
        return 0, 0
    nIterations = 0
    while True:
        x_k = (a + b) / 2
        if abs(eval(function)(x_k)) < tolerance:
            break
        elif eval(function)(a) * eval(function)(x_k) < 0:
            b = x_k
        else:
            a = x_k
        nIterations += 1
    return x_k, nIterations
