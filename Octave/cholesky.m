## Copyright (C) 2019 mherr
##
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} biseccion (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mherr <mherr@MSI>
## Created: 2019-08-11

## Metodo directo de factorizacion de Cholesky para solucion de sistemas de 
## ecuaciones.
## Entradas: Matriz de Coeficientes y matriz de términos independientes.
# Salidas: Solucion .
function [result] = cholesky(a, b)
    n = length(a);
    
    function [L] = get_L(a, n)
        L = zeros(n);
        for i = 1:n
            for j = 1:n
                if i == j
                    sum1 = 0;
                    for k = 1:j
                        sum1 += L(j, k)**2;
                    endfor
                    L(i, j) = sqrt(a(i, j) - sum1);
                else 
                    if i > j
                        sum2 = 0;
                        for k = 1:j
                            sum2 += L(i, k)*L(j, k);
                        endfor    
                        L(i, j) = (a(i, j) - sum2) / L(j, j);
                    end
                end
            endfor
        endfor    
    endfunction

    function [result] = sustitucion_hacia_atras(a, b, n)
        result = zeros(1, n);
        i = n;
        while i > 0
            resultTemp = b(i);
            j = n;
            while j > 0
                if i == j
                    result(j) = resultTemp/a(i,j);
                    break
                else
                    resultTemp -= a(i,j)*result(j);
                end
                j -= 1;
            endwhile    
            i -= 1;
        endwhile
    endfunction
    
    function [result] = sustitucion_hacia_adelante(a, b, n)
        result = zeros(1, n);
        for i = 1:n
            resultTemp = b(i);
            for j = 1:n
                if i == j
                    result(j) = resultTemp/a(i,j);
                    break
                else
                    resultTemp -= a(i,j)*result(j);
                end
            endfor
        endfor    
    endfunction
    L = get_L(a, n);
    y = sustitucion_hacia_adelante(L, b, n);
    result = sustitucion_hacia_atras(transpose(L), y, n);
endfunction    



