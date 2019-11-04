# Metodo de interpolacion de las diferencias divididas
# de newton
# Entradas: puntos en x y puntos en y
# Salidas: polinomio de lagrange.

function polinomio = diferencias_newton(x_points, y_points)
  pkg load symbolic;
  x_var = sym('x');
  p = length(x_points);
  polinomio = 0;
  
  function rslt = f(x, y)
    n = length(x);
    m = ceil(n / 2);
    if n == 1
      rslt = y(1);
    elseif rem(n, 2) != 0
      rslt = (f(x(1:m), y(1:m)) - f(x(m:n), y(m:n))) / (x(1) - x(n));
    else
      rslt = (f(x(1:m), y(1:m)) - f(x(m+1:n), y(m+1:n))) / (x(1) - x(n));
    endif
  endfunction
  
  for i = 1:p
    prod = 1;
      for j = i:-1:1
        prod = prod * (x_var - x_points(j));
      endfor
    x_points(1:i)
    polinomio = polinomio + f(x_points(1:i), y_points(1:i)) * prod;
  endfor
  polinomio = simplify(polinomio);

endfunction
