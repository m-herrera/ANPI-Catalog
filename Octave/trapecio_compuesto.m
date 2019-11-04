
#Regla del trapecio compuesto para aproximacion de integrales
#Entradas:limites de integracion, cantidad de subintervalos, 
#funcion a integrar
#Salidas: aproximacion de integral.

function integ = trapecio_compuesto(a, b, n, funcion)
  
    f = str2func(funcion);
    h = (b - a) / (n - 1);
    sum = 0;
    for i=1:n-1
        sum += f(a + (i-1) * h) + f(a + i * h);
    endfor
    integ = h / 2 * sum;

endfunction