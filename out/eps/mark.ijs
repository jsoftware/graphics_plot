NB. markers

NB. =========================================================
epsmark_circle=: 3 : 0
's m f e c p'=. y
p=. citemize p
v=. 8 * s * EPS_PENSCALE
pbuf eps_color e
NB. following should not be required, but now
NB. included to avoid drawing line from label
pbuf (pfmt {.p), ' moveto'
pbuf (pfmt p,.v) ,"1 ' 0 360 arc fill'
)

NB. =========================================================
epsmark_diamond=: 3 : 0
's m f e c p'=. y
e=. eps_color e
p=. 8 $"1 citemize p
d=. (3.5 * s) * _1 0 0 1 1 0 0 _1
p=. p +"1 d
for_i. i.#p do.
  pbuf eps_makelines i{p
  pbuf e,' fill'
end.
)

NB. =========================================================
NB. following only used for key markers, given singly
epsmark_line=: 3 : 0
's m f e c p'=. y
e=. eps_color e
p=. ,p
s=. -:KeyLen,KeyPen
p=. (p - s) , p + s
pbuf eps_makerect p
pbuf e,' fill'
)

NB. =========================================================
epsmark_plus=: 3 : 0
's m f e c p'=. y
s=. s * 4
t=. s, 0
pbuf e eps_pen s
p=. citemize p
d=. (p -"1 t) ,. p +"1 t
t=. |. t
d=. d, (p -"1 t) ,. p +"1 t
pbuf eps_lines d
)

NB. =========================================================
epsmark_square=: 3 : 0
's m f e c p'=. y
e=. eps_color e
p=. citemize p
s=. 3 * s
p=. (p - s) ,"1 p + s
for_i. i.#p do.
  pbuf eps_makerect i{p
  pbuf e,' fill'
end.
)

NB. =========================================================
epsmark_times=: 3 : 0
's m f e c p'=. y
pbuf e eps_pen 4 * s
t=. _1 + s * 3
r=. (p - t) ,. p + t
s=. (p +"1 t * 1 _1) ,. p +"1 t * _1 1
pbuf eps_lines r,s
)

NB. =========================================================
epsmark_triangle=: 3 : 0
's m f e c p'=. y
e=. eps_color e
p=. 6 $"1 citemize p
d=. (4 * s) * , (sin,.cos) 2p1 * 0 1 2 % 3
p=. p +"1 d
for_i. i.#p do.
  pbuf eps_makelines i{p
  pbuf e,' fill'
end.
)
