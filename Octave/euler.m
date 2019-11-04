
## Metodo de euler para calculo de ecuaciones diferenciales
## numéricas
## Entradas: Valor inicial, extremos del rango inicial, 
## cantidad de puntos, y función a evaluar
## Salidas: Vector de puntos en x, vector de puntos en y

function [x,y] = euler(y0, a, b, n, funcion)
    f = str2func(funcion);
    h = (b - a) / (n - 1);

    x = [a];
    y = [y0];
    for i = 1:n-1
        x = [x, x(i) + h];
        y = [y, y(i) + h * f(x(i), y(i))];
    endfor
    x = transpose(x);
    y = transpose(y);
    
endfunction