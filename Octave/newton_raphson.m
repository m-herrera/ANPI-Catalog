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
## @deftypefn {} {@var{retval} =} newton-raphson (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mherr <mherr@MSI>
## Created: 2019-08-09

## Metodo iterativo de Newton-Raphson para la solucion de ecuaciones
## no lineales.
## Entradas: rango inicial, tolerancia minima y funcion a evaluar.
## Salidas: aproximacion de la solucion y numero de iteraciones.
function [x_k, nIterations] = newton_raphson (x0, tolerance, functionStr)
  syms x;
  func = str2func(functionStr);
  deriv = diff(func, x);
  nIterations = 0;
  x_k = x0;
  while abs(func(x_k)) >= tolerance
    x_k = x_k - func(x_k) / eval((subs(deriv, x, x_k)));
    nIterations += 1;
  endwhile
endfunction
