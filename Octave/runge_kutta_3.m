
##Metodo de runge kutta de orden 3 para calculo de ecuaciones diferenciales
##numericas
##Entradas: Valor inicial, extremos del rango inicial, 
##cantidad de puntos, y funcion a evaluar
##Salidas: Vector de puntos en x, vector de puntos en y

function [x, y] = runge_kutta_3(y0, a, b, n, funcion)
    
    f = str2func(funcion);
    h = (b - a) / (n - 1);

    x = [a];
    y = [y0];
    k_3 = [];
    k_2 = [];
    k_1 = [];
    for i = 1:n-1
        k_1 = [k_1, f(x(i), y(i))];
        k_2 = [k_2, f(x(i) + h / 2, y(i) + h * k_1(i) / 2)];
        k_3 = [k_3, f(x(i) + h, y(i) + h * (2 * k_2(i) - k_1(i)))];
        x = [x, x(i) + h];
        y = [y, y(i) + h / 6 * (k_1(i) + 4 * k_2(i) + k_3(i))];
    endfor
    x = transpose(x);
    y = transpose(y);
    
endfunction
