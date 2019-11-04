
#Regla del trapecio para aproximacion de integrales
#Entradas:limites de integracion, funcion a integrar
#Salidas: aproximacion de integral.

function integ = trapecio(a, b, funcion)
    f = str2func(funcion);
    integ = (f(a) + f(b)) * (b - a) / 2;
endfunction