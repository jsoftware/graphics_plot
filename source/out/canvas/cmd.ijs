NB. canvas cmds
NB.
NB. canvas graphics command utilities

NB. =========================================================
canvas_color=: 4 : 0
if. x do.
  'ctx.fillStyle= "rgb',"1 (pfmtjs y),"1 '";'
else.
  'ctx.strokeStyle= "rgb',"1 (pfmtjs y),"1 '";'
end.
)

NB. =========================================================
canvas_makerect=: 3 : 0
'x y r s'=. y
r=. (pfmtjs _2 [\ flipxy x,y,x,s,r,s,r,y,x,y) ,.~ 1 4 # ' ctx.moveTo',:' ctx.lineTo'
(,r,"1 ';')
)

NB. =========================================================
canvas_makelines=: 3 : 0
len=. -: {: $ y
if. len = 0 do. i.0 0 return. end.
opr=. (1,len-1) # 'ctx.moveTo',:'ctx.lineTo'
if. 2 > #$y do.
  , ((pfmtjs _2 [\ flipxy y) ,.~ opr) ,. ';'
else.
  ,"2 ((pfmtjs _2 [\"1 flipxy y) ,."2~ opr) ,."2 ';'
end.
)

NB. =========================================================
NB. codes to set pen
NB.
NB. canvas_pen    one color, one size
NB. canvas_pens   several colors, several sizes
canvas_pens=: 4 : 0
assert. 0 [ 'canvas_pens not implemented'
(0 canvas_color x) ,"1 'ctx.lineWidth="',"1 (":1>.CANVAS_PENSCALE*y),"1 '";'
)

NB. =========================================================
canvas_pen=: 4 : 0
NB. (0 canvas_color ,x), (":CANVAS_PENSCALE*y) ,' setlinewidth '
(0 canvas_color x) , 'ctx.lineWidth="',(":1>.CANVAS_PENSCALE*y),'";'
)

NB. =========================================================
canvas_lines=: 3 : 0
'ctx.beginPath();' ,"1 (canvas_makelines y) ,"1 'ctx.stroke();ctx.closePath();'
)

NB. =========================================================
NB. canvas_text
NB.
NB. single alignment, single font
canvas_text=: 3 : 0
'fnt txt pos align rot und'=. y
pos=. citemize pos
txt=. ,each boxxopen txt
txt=. utf8@('"'&,)@(,&'"')@jsesc each txt

if. 1=#txt do. txt=. (#pos)#{.txt end.

fn=. 'ctx.textBaseline= "middle";ctx.textAlign= "', (align{:: 'left';'center';'right'), '";'

select. rot
case. 0 do.
  res=. tolist (<fn) ,each (<'ctx.fillText(') ,each txt ,each (<',') ,each (<("1) 0&pfmtjs flipxy pos >. 0) ,each <');'
case. 1 do.
  r=. ''
  for_i. i.#pos do.
    s=. 'ctx.save();ctx.translate', (pfmtjs flipxy 0 >. i{pos), ';ctx.rotate(-Math.PI/2);'
    r=. r, <s, fn, 'ctx.fillText(' , (i pick txt), ',0,0);ctx.restore();'
  end.
  res=. tolist r
case. 2 do.
  r=. ''
  for_i. i.#pos do.
    s=. 'ctx.save();ctx.translate', (pfmtjs flipxy 0 >. i{pos), ';ctx.rotate(Math.PI/2);'
    r=. r, <s, fn, 'ctx.fillText(' , (i pick txt), ',0,0);ctx.restore();'
  end.
  res=. tolist r
end.

if. -. und do. res return. end.

NB. ---------------------------------------------------------
NB. underline
wid=. ,{. fnt pgetextent txt
'off lwd'=. getunderline fnt
res=. res, LF, 'ctx.lineWidth="', (":1>.lwd) ,'";'

select. rot
case. 0 do.
  bgn=. pos - (wid * -: align),.-off
  end=. bgn + wid,.0
case. 1 do.
  bgn=. pos - off,.wid * -: align
  end=. bgn + 0,.wid
case. 2 do.
  bgn=. pos + off,.wid * -: align
  end=. bgn - 0,.wid
end.

bgn=. 'ctx.beginPath();ctx.moveTo' ,"1 (pfmtjs flipxy bgn >. 0) ,"1 ';'
end=. 'ctx.lineTo' ,"1 (pfmtjs flipxy end >. 0) ,"1 ';ctx.stroke();ctx.fill();ctx.closePath();'
lin=. ,LF,.bgn,.end

res,lin
)
