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

## Metodo directo de factorizacion LU para solucion de sistemas de 
## ecuaciones.
## Entradas: Matriz de Coeficientes y matriz de términos independientes.
# Salidas: Solucion .
function [result] = factorizacion_LU(a, b)
    n = length(a);
    
    function [L, a] =  get_LU(a, n)
        L = zeros(n);
        for j = 1:n
            for i = 1:n
                if i > j && a(i, j) != 0
                    multiplier = -1 * a(i, j) / a(j, j);
                    L(i, j) = -1 * multiplier;
                    for k = 1:n
                        a(i, k) = a(i, k) + a(j, k) * multiplier;
                    endfor
                elseif i == j
                    L(i, j) = 1;
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
    
    [L, U] = get_LU(a, n);
    y = sustitucion_hacia_adelante(L, b, n);
    result = sustitucion_hacia_atras(U, y, n);
endfunction
   