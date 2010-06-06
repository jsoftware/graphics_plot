NB. eps cmds
NB.
NB. eps graphics command utilities

NB. =========================================================
eps_color=: 3 : 0
(": y % 255) ,"1 ' setrgbcolor '
)

NB. =========================================================
eps_makerect=: 3 : 0
'x y r s'=. y
r=. (pfmt _2 [\ x,y,x,s,r,s,r,y) ,. 1 3 # ' moveto',:' lineto'
(,r,.LF),'closepath'
)

NB. =========================================================
eps_makelines=: 3 : 0
len=. -: {: $ y
if. len = 0 do. i.0 0 return. end.
opr=. (1,len-1) # ' moveto',:' lineto'
if. 2 > #$y do.
  , ((pfmt _2 [\ y) ,. opr) ,. LF
else.
  ,"2 ((pfmt _2 [\"1 y) ,."2 opr) ,."2 LF
end.
)

NB. =========================================================
NB. codes to set pen
NB.
NB. eps_pen    one color, one size
NB. eps_pens   several colors, several sizes
eps_pens=: 4 : 0
(eps_color x) ,"1 (":,.EPS_PENSCALE*y) ,"1 ' setlinewidth '
)

NB. =========================================================
eps_pen=: 4 : 0
(eps_color ,x), (":EPS_PENSCALE*y) ,' setlinewidth '
)

NB. =========================================================
eps_lines=: 3 : 0
(eps_makelines y) ,"1 'stroke'
)

NB. =========================================================
NB. eps_text
NB.
NB. single alignment, single font
eps_text=: 3 : 0
'fnt txt pos align rot und'=. y
pos=. citemize pos
txt=. ,each boxxopen txt
txt=. pdfesc each txt

fn=. 'show',align{' cr'

select. rot
case. 0 do.
  res=. (<' moveto (') ,each txt ,each <') ',fn
  res=. tolist (<"1 pfmt pos >. 0) ,each res
case. 1 do.
  r=. ''
  for_i. i.#pos do.
    s=. 'save ',(pfmt 0 >. i{pos), ' translate 90 rotate',LF
    r=. r, <s, '0 0 moveto (' ,(i pick txt) , ') ',fn,' restore'
  end.
  res=. tolist r
case. 2 do.
  r=. ''
  for_i. i.#pos do.
    s=. 'save ',(pfmt 0 >. i{pos), ' translate 270 rotate',LF
    r=. r, <s, '0 0 moveto (' ,(i pick txt) , ') ',fn,' restore'
  end.
  res=. tolist r
end.

if. -. und do. return. end.

NB. ---------------------------------------------------------
NB. underline
wid=. ,{. fnt pgetextent txt
'off lwd'=. getunderline fnt
res=. res, LF, (":lwd) ,' setlinewidth '

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

bgn=. (": bgn >. 0) ,"1 ' moveto '
end=. (": end >. 0) ,"1 ' lineto stroke'
lin=. ,LF,.bgn,.end

res,lin

)
