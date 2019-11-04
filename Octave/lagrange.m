# Metodo de interpolacion de lagrange
# Entradas: puntos en x y puntos en y
# Salidas: polinomio de lagrange.

function polinomio = lagrange(x_points, y_points)
  pkg load symbolic;
  n = length(x_points);
  x = sym('x');
  polinomio = 0;
  for k =1:n
    prod = 1;
    for i=1:n
      if i != k
        prod = prod*(x - x_points(i)) / (x_points(k) - x_points(i));
      endif
    endfor
    polinomio = polinomio + prod * y_points(k);
  endfor
  polinomio = simplify(polinomio);
endfunction
