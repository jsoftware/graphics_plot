require 'graphics/plot numeric stats trig'

dat=: 0.1 0.4 0.5 0.7 0.7 0.9 ,: 0.61 0.92 0.99 1.52 1.47 2.03

NB. least-squares fit coefficients for polynomials of order 0-4
fits=: (i.5) lsfit"0 _ dat

NB. dat compared with fitted dat:
dat,fitdat=: fits p."1 {.dat

NB. sum of squared deviations from y values:
+/"1 *: fitdat-"1 {:dat

NB. plot original symbols, and polys of order 1, 2 and 4:
x=: steps 0 1 50
y=: 1 2 4{fits p."1 x
'linefit' plot (<split dat) , <x;y
