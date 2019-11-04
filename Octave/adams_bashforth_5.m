##Metodo de adams bashforth 5 para calculo de ecuaciones diferenciales
##numericas
##Entradas: Valor inicial, extremos del rango inicial, 
##cantidad de puntos, y funcion a evaluar
##Salidas: Vector de puntos en x, vector de puntos en y

function [x,y] = adams_bashforth_5(y0, a, b, n, funcion)
    h = (b - a) / (n - 1);
    function [x,y] = euler(y0, a, b, n, funcion)
      f = str2func(funcion);
      h = (b - a) / (n - 1);

      x = [a];
      y = [y0];
      for i = 1:n-1
          x = [x, x(i) + h];
          y = [y, y(i) + h * f(x(i), y(i))];
      endfor
    endfunction
  
    [x, y] = euler(y0, a, a + 4 * h, 5, funcion);

    f = str2func(funcion);

    for i = 5:n - 1
        x = [x, x(i) + h];
        y = [y, y(i) + h / 720 * (1901 * f(x(i), y(i)) - 
                          2774 * f(x(i - 1), y(i - 1)) +
                          2616 * f(x(i - 2), y(i - 2)) - 
                          1274 * f(x(i - 3), y(i - 3)) +
                          251  * f(x(i - 4), y(i - 4)))];
    endfor
    
    x = transpose(x);
    y = transpose(y);
    
endfunction