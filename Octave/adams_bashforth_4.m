##Metodo de adams bashforth 4 para calculo de ecuaciones diferenciales
##numericas
##Entradas: Valor inicial, extremos del rango inicial, 
##cantidad de puntos, y funcion a evaluar
##Salidas: Vector de puntos en x, vector de puntos en y

function [x,y] = adams_bashforth_4(y0, a, b, n, funcion)
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
  
    [x, y] = euler(y0, a, a + 3 * h, 4, funcion);

    f = str2func(funcion);

    for i = 4:n - 1
        x = [x, x(i) + h];
        y = [y, y(i) + h / 24 * (55 * f(x(i), y(i)) - 
                59 * f(x(i - 1), y(i - 1)) + 
                37 * f(x(i - 2), y(i - 2)) - 
                9  * f(x(i - 3), y(i - 3)))];
    endfor
    
    x = transpose(x);
    y = transpose(y);
    
endfunction