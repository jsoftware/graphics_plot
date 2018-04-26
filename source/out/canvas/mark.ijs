NB. markers

NB. =========================================================
canvasmark_circle=: 3 : 0
's m f e c p'=. y
p=. citemize p
v=. 8 * s * CANVAS_PENSCALE
pbuf 1 canvas_color e
NB. following should not be required, but now
NB. included to avoid drawing line from label
pbuf 'ctx.moveTo', (pfmtjs flipxy {.p), ';'
pbuf 'ctx.beginPath();ctx.arc(' ,"1 (0&pfmtjs flipxy p) ,"1 ',' ,"1 (0&pfmtjs v) ,"1 ',0,2*Math.PI,1);ctx.stroke();ctx.fill();ctx.closePath();'
)

NB. =========================================================
canvasmark_diamond=: 3 : 0
's m f e c p'=. y
e=. 1 canvas_color e
p=. 8 $"1 citemize p
d=. (3.5 * s) * _1 0 0 1 1 0 0 _1
p=. p +"1 d
pbuf 'ctx.beginPath();'
for_i. i.#p do.
  pbuf canvas_makelines i{p
  pbuf e,'ctx.fill();ctx.closePath();'
end.
)

NB. =========================================================
NB. following only used for key markers, given singly
canvasmark_line=: 3 : 0
's m f e c p'=. y
e=. 1 canvas_color e
p=. ,p
s=. -:KeyLen,KeyPen
p=. (p - s) , p + s
pbuf 'ctx.beginPath();'
pbuf canvas_makerect p
pbuf e,'ctx.fill();ctx.closePath();'
)

NB. =========================================================
canvasmark_plus=: 3 : 0
's m f e c p'=. y
s=. s * 4
t=. s, 0
pbuf e canvas_pen s
p=. citemize p
d=. (p -"1 t) ,. p +"1 t
t=. |. t
d=. d, (p -"1 t) ,. p +"1 t
pbuf canvas_lines d
)

NB. =========================================================
canvasmark_square=: 3 : 0
's m f e c p'=. y
e=. 1 canvas_color e
p=. citemize p
s=. 3 * s
p=. (p - s) ,"1 p + s
pbuf 'ctx.beginPath();'
for_i. i.#p do.
  pbuf canvas_makerect i{p
  pbuf e,'ctx.fill();ctx.closePath();'
end.
)

NB. =========================================================
canvasmark_times=: 3 : 0
's m f e c p'=. y
pbuf e canvas_pen 4 * s
t=. _1 + s * 3
r=. (p - t) ,. p + t
s=. (p +"1 t * 1 _1) ,. p +"1 t * _1 1
pbuf canvas_lines r,s
)

NB. =========================================================
canvasmark_triangle=: 3 : 0
's m f e c p'=. y
e=. 1 canvas_color e
p=. 6 $"1 citemize p
d=. (4 * s) * , (sin,.cos) 2p1 * 0 1 2 % 3
p=. p +"1 d
pbuf 'ctx.beginPath();'
for_i. i.#p do.
  pbuf canvas_makelines i{p
  pbuf e,'ctx.fill();ctx.closePath();'
end.
)
