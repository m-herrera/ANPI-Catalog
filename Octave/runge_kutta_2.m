
##Metodo de runge kutta de orden 2 para calculo de ecuaciones diferenciales
##numericas
##Entradas: Valor inicial, extremos del rango inicial, 
##cantidad de puntos, y funcion a evaluar
##Salidas: Vector de puntos en x, vector de puntos en y

function [x, y] = runge_kutta_2(y0, a, b, n, funcion)
    
    f = str2func(funcion);
    h = (b - a) / (n - 1);

    x = [a];
    y = [y0];
    k_2 = [];
    k_1 = [];
    for i = 1:n-1
        k_1 = [k_1, f(x(i), y(i))];
        k_2 = [k_2, f(x(i) + h / 2, y(i) + h * k_1(i) / 2)];
        x = [x, x(i) + h];
        y = [y, y(i) + h * k_2(i)];
    endfor
    x = transpose(x);
    y = transpose(y);
    
endfunction
