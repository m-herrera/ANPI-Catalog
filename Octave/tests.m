[x,i] = punto_fijo(1, 0.00001, "@(x)log(2*x + 1)")

[x,i] = punto_fijo(0.15, 0.00001, "@(x)2/5 * cos(x/2 + 1)")

[x,i] = muller(2, 2.2, 1.8, 0.0001, "@(x)sin(x) - x/2")

[x,i] = muller(2.9, 3, 2.8, 0.0001, "@(x)(1 + x)*sin(x) - 1")

[x,i] = descenso_coordinado([1, 3], ['x','y'], 0.0001, "@(x,y)(x-2)**2 + (y+3)**2 + x*y")

[x,i] = descenso_coordinado([1, 1, 1], ['x','y','z'], 0.0001, "@(x,y,z)x**3 + y**3 + z**3 -2*x*y -2*x*z -2*y*z")