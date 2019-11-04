from sympy import *
import numpy as np


"""
Metodo de iteracion de la potencia para el calculo de autovalores
Entradas: Matriz, valor inicial, tolerancia minima
Salidas: Valor propio dominante y vector propio asociado
"""
def potencia(A, x0, tol):
    A = Matrix(A)
    x = Matrix(x0)
    error = tol
    ck = 0
    while error >= tol:
        yk = A * x
        ck = max(yk)
        prev = x
        x = 1 / ck * yk
        difference = np.array(np.subtract(x, prev), dtype=np.float64)
        error = np.linalg.norm(difference)
    x = np.array(x, dtype=np.float64)
    return float(ck), x.tolist()

print(potencia([[0,11,-5],[-2,17,-7],[-4,26,-10]], [1,1,1], 0.0001))