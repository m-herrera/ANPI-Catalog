
#Regla de simpson para aproximacion de integrales
#Entradas:limites de integracion, funcion a integrar
#Salidas: aproximacion de integral.
function integ = simpson(a, b, funcion)
  
    f = str2func(funcion);
    integ = (b - a) / 6 * (f(a) + 4 * f((a + b) / 2) + f(b));

endfunction