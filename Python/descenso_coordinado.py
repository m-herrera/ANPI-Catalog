from sympy import *
import math
import numpy as np


"""
Metodo iterativo del Descenso Coordinado para optimizacion
en varias variables.
Entradas: valores iniciales, variables de la funcion, tolerancia minima
del resultado y funcion a evaluar en string.
Salidas:Valor aproximado y numero de iteraciones
"""
def descenso_coordinado(x0, variables, tol, funcion):
    n = len(variables)
    iteracion = 0
    for i in range(n):
        variables[i] = Symbol(variables[i])
    funcion = sympify(funcion)
    f = lambdify(variables, funcion, "numpy")
    error = tol
    while error >= tol:
        prev = x0.copy()
        for j in range(n):
            x0 = replace(x0, j, variables[j], f)
        iteracion += 1
        difference = np.array(np.subtract(x0, prev), dtype=np.float64)
        error = np.linalg.norm(difference)

    return x0, iteracion

"""
Metodo auxiliar del Descenso Coordinado para calcular el minimo en una variable
y reemplazarlo
Entradas: valores iniciales, indice de la variable a optimizar,
variables de la funcion, funcion
Salidas: iteracion ya reemplazada
"""
def replace(x0, indice, variable, f):
    temp = x0.copy()
    temp[indice] = variable
    df = lambdify(variable, diff(f(*temp), variable), "numpy")
    soluciones = solve(df(variable))
    for solucion in soluciones:
        temp[indice] = solucion
        if(f(*temp) < f(*x0)):
            x0 = temp
    return x0
