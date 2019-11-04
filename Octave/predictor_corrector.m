
## Metodo predictor corrector para calculo de ecuaciones diferenciales
## numericas
## Entradas: Valor inicial, extremos del rango inicial, 
## cantidad de puntos, y funcion a evaluar
## Salidas: Vector de puntos en x, vector de puntos en y

function [x,y]  = predictor_corrector(y0, a, b, n, funcion)
    
    f = str2func(funcion);
    h = (b - a) / (n - 1)

    x = [a];
    y = [y0];
    y_aux = [];
    for i = 1:n-1
        y_aux = [y_aux, y(i) + h * f(x(i), y(i))];
        x = [x, x(i) + h];
        y = [y, y(i) + h * (f(x(i), y(i)) + f(x(i + 1), y_aux(i))) / 2]
    endfor
    x = transpose(x);
    y = transpose(y);
endfunction
