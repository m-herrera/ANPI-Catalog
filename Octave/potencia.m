
##Metodo de iteración de la potencia para el calculo de autovalores
##Entradas: Matriz, valor inicial, tolerancia mínima
##Salidas: Valor propio dominante y vector propio asociado
function [ck, x] = potencia(A, x0, tol)
    x = x0;
    error = tol;
    while error >= tol
        yk = A * x;
        ck = max(yk(:));
        prev = x;
        x = 1 / ck * yk;
        error = norm(x - prev);
    endwhile
endfunction
