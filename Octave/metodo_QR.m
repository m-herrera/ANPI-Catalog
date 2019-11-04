##Metodo QR para el calculo de autovalores
##Entradas: Matriz y tolerancia minima
##Salidas: Valores propios de la matriz
function A = metodo_QR(A, tol)
    function [Q, R] = factorizacion_QR(A1)
       function result =  producto_punto(x, y)
            result = 0;
            for k = 1:length(x)
                result += x(k) * y(k);
            endfor
       endfunction
       Q = zeros(length(A1));
       for i = 1:length(A1)
            Ak = A1(:, i);
            if i == 1
                U = Ak;
            else
                sum = 0;
                for j = 1:i-1
                    sum += producto_punto(Ak, Q(:,j)) * Q(:,j);
                endfor
                U = Ak - sum;
            end
            Q(:,i) = U / norm(U);
        endfor
        R = transpose(Q) * A1;
        Q = Q;
    endfunction
    error = tol;
    while error >= tol
        [Q, R] = factorizacion_QR(A);
        A = R * Q;
        error = 0;
        for i = 2:length(A)-1
            for j = 1:i-1
                error += abs(A(i, j));
            endfor
        endfor
    endwhile
    A = diag(A);
endfunction

