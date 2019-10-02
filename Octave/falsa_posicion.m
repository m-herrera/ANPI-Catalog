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
## @deftypefn {} {@var{retval} =} falsa_posicion (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mherr <mherr@MSI>
## Created: 2019-08-10

## Metodo iterativo de la posicion falsa para la solucion de ecuaciones
## no lineales.
## Entradas: rango inicial, tolerancia minima y funcion a evaluar.
## Salidas: aproximacion de la solucion y numero de iteraciones.
function [x_k, nIterations] = falsa_posicion (a, b, tolerance, functionStr)
  func = str2func(functionStr);
  nIterations = 0;
  x_k = b - func(b) * (b-a) / (func(b) - func(a));
  if func(a)*func(b) <= 0
    while abs(func(x_k)) >= tolerance
      if func(a)*func(x_k) < 0
        b = x_k;
      else
        a = x_k;
      end
      x_k = b - func(b) * (b-a) / (func(b) - func(a));
      nIterations += 1;
    endwhile
  endif
endfunction
