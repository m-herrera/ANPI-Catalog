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
## Created: 2019-08-09

## Metodo iterativo de Muller para la solucion de ecuaciones no lineales.
## Entradas: valores iniciales, tolerancia minima y funcion a evaluar.
## Salidas: aproximacion de la solucion y numero de iteraciones.
function [x0, iteracion] = muller(x0, x1, x2, tol, funcion)
    f = str2func(funcion);
    iteracion = 0;

    function [closest] = get_closest(x0, x1, x2, r)
      closest = [x0 x1 r];
      if abs(x2 - r) < abs(x0 - r)
          closest(1) = x2;
          if abs(x0 - r) < abs(x1 - r)
              closest(2) = x0;
          end
      elseif abs(x2 - r) < abs(x1 - r)
          closest(2) = x2;
      end
    endfunction
    
    function [parameters] = values(a, b, c, x0, x1, x2)
        r1 = (-b + sqrt(b**2 - 4 * a * c)) / (2 * a);
        r2 = (-b - sqrt(b**2 - 4 * a * c)) / (2 * a);
        mins1 = get_closest(x0, x1, x2, r1);
        mins2 = get_closest(x0, x1, x2, r2);
        if (abs(mins1(1) - r1) + abs(mins1(2) - r1) <
            abs(mins2(1) - r2) + abs(mins2(2) - r2))
            parameters = mins1;
        else
            parameters = mins2;
        end
    endfunction
    
    while abs(f(x0)) >= tol
        A = [[x0**2 x0 1]; [x1**2 x1 1]; [x2**2 x2 1]];
        B = [f(x0); f(x1); f(x2)];
        parametros = A \ B;
        a = parametros(1);
        b = parametros(2);
        c = parametros(3);
        next_iter = values(a, b, c, x0, x1, x2);
        x0 = next_iter(1);
        x1 = next_iter(2);
        x2 = next_iter(3);
        iteracion += 1;
    endwhile
endfunction

