NB. canvas draw

NB. =========================================================
canvascircle=: 3 : 0
'v s f e c p'=. y
if. isempty c do.
  if. is1color e do.
    pbuf e canvas_pen v
    pbuf 'ctx.beginPath();ctx.arc(' ,"1 (0&pfmtjs flipxy 2{."1 p) ,"1 ',' ,"1 (0&pfmtjs 2{"1 p) ,"1 ',0,2*Math.PI,1);ctx.stroke();ctx.closePath();'
  else.
    for_i. i.#p do.
      pbuf (i{e) canvas_pen i{v
      pbuf 'ctx.beginPath();ctx.arc(' ,"1 (0&pfmtjs flipxy 2{.i{p) ,"1 ',' ,"1 (0&pfmtjs 2{i{p) ,"1 ',0,2*Math.PI,1);ctx.stroke();ctx.closePath();'
    end.
  end.
else.
  p=. citemize p
  c=. p cmatch c
  e=. p cmatch e
  v=. p cmatch v
  for_i. i.#p do.
    pbuf 'ctx.beginPath();ctx.arc(' , (0&pfmtjs flipxy 2{.i{p) , ',' , (0&pfmtjs 2{i{p) , ',0,2*Math.PI,1);'
    pbuf (1 canvas_color i{c) ,((i{e) canvas_pen i{v), 'ctx.stroke();ctx.fill();ctx.closePath();'
  end.
end.
)

NB. =========================================================
NB. canvasdot
canvasdot=: 3 : 0
'v s f e c p'=. y
p=. citemize p
v=. v * CANVAS_PENSCALE
if. is1color e do.
  pbuf 1 canvas_color e
  pbuf 'ctx.beginPath();ctx.arc(' ,"1 (0&pfmtjs flipxy p) ,"1 ',' ,"1 (0&pfmtjs v) ,"1 ',0,2*Math.PI,1);ctx.fill();ctx.closePath();'
else.
  e=. p cmatch e
  for_c. p do.
    pbuf 1 canvas_color c_index { e
    pbuf 'ctx.beginPath();ctx.arc(' , (0&pfmtjs flipxy c) , ',' , (0&pfmtjs v) , ',0,2*Math.PI,1);ctx.fill();ctx.closePath();'
  end.
end.
)

NB. =========================================================
NB. set graph box clipping
canvasfxywh=: 3 : 0
''return.
p=. _1 pick y
if. #p do.
  CLIP=: >: CLIP
  'x y w h'=. p
  rect=. canvas_makerect x,y,(x+w),y+h
  pbuf 'gsave ',rect,' clip newpath'
else.
  if. CLIP do.
    CLIP=: <: CLIP
    pbuf 'grestore'
  end.
end.
)

NB. =========================================================
NB. canvasline
canvasline=: 3 : 0
'v s f e c p'=. y
if. (is1color e) *. 1 = #s do.
  pbuf e canvas_pen v
  pbuf canvas_lines p
else.
  rws=. #p
  e=. rws $ citemize e
  v=. rws $ v
  for_i. i. rws do.
    pbuf (i{e) canvas_pen i{v
    pbuf canvas_lines i{p
  end.
end.
)

NB. =========================================================
canvasmarker=: 3 : 0
('canvasmark_',1 pick y)~ y
)

NB. =========================================================
NB. canvaspie
NB.
NB. assume single line width and color
canvaspie=: 3 : 0
'v s f e c p'=. y
pen=. e canvas_pen v
p=. citemize p
ctr=. 0 1 {"1 p
rad=. 2 {"1 p
ang=. 360 %~ 2p1 * 360 + 90 + - 3 4 {"1 p
clr=. cmatch c
for_i. i.#p do.
  pbuf 'ctx.beginPath();', 'ctx.moveTo', (pfmtjs flipxy i { ctr), ';'
  pbuf 'ctx.arc(', (0&pfmtjs flipxy (i { ctr) ,(i{rad)), ',', (0&pfmtjs 0{i{ang), ',', (0&pfmtjs 1{i{ang), ',1);'
  pbuf (1 canvas_color i{clr) ,pen,'ctx.stroke();ctx.fill();ctx.closePath();'
end.
)

NB. =========================================================
NB. canvasline - patterned line
canvaspline=: 3 : 0
'v s f e c p'=. y
if. *./ s = 0 do.
  canvasline y return.
end.
s=. s { PENPATTERN
if. (is1color e) *. 1 = #v do.
  pos=. s linepattern"0 1 p
  canvasline (<pos) _1 } y
else.
  rws=. #p
  e=. rws $ citemize e
  v=. rws $ v
  s=. rws $ s
  for_i. i.#p do.
    pbuf (i{e) canvas_pen i{v
    pos=. (i{s) linepattern i{p
    canvasline (i{v);0;0;(i{e);0;pos
  end.
end.
)

NB. =========================================================
canvaspoly=: 3 : 0
'v s f e c p'=. y
p=. citemize p
if. v=0 do. e=. c end.
c=. p cmatch c
e=. p cmatch e
if. +/v do.
  v=. p cmatch v
  for_i. i.#p do.
    pbuf 'ctx.beginPath();', (canvas_makelines i{p), (1 canvas_color i{c), ((i{e) canvas_pen i{v), 'ctx.stroke();ctx.fill();ctx.closePath();'
  end.
else.
  for_i. i.#p do.
    pbuf 'ctx.beginPath();', (canvas_makelines i{p), (0 canvas_color i{c), (1 canvas_color i{c), 'ctx.stroke();ctx.fill();ctx.closePath();'
  end.
end.
)

NB. =========================================================
canvasrect=: 3 : 0
'v s f e c p'=. y
p=. citemize p
if. v=0 do. e=. c end.
c=. p cmatch c
e=. p cmatch e
if. +/v do.
  v=. p cmatch v
  for_i. i.#p do.
    pbuf 'ctx.beginPath();', (canvas_makerect i{p) , (1 canvas_color i{c) ,((i{e) canvas_pen i{v) , 'ctx.stroke();ctx.fill();ctx.closePath();'
  end.
else.
  for_i. i.#p do.
    pbuf 'ctx.beginPath();', (canvas_makerect i{p) ,(1 canvas_color i{c) ,'ctx.fill();ctx.closePath();'
  end.
end.
)

NB. =========================================================
NB. canvastext
NB. y is text;font;alignment;pencolor;n/a;position
NB.
NB. assumes single alignment, single font
canvastext=: 3 : 0
't f a e c p'=. y

NB. ---------------------------------------------------------
NB. set up fonts
'fnx fst fsz fan und'=. f
rot=. 3 | 0 90 270 i. fan
asc=. pgetascender f
fnm=. getfntname fnx,fst
NB. kludge for using type I font
bold=. italic=. ''
if. (1 e. '-Oblique' E. fnm)+.(1 e. '-Bold' E. fnm)+.(1 e. '-Italic' E. fnm) do.
  bold=. (1 e. 'Bold' E. fnm)#'bold '
  italic=. ((1 e. 'Oblique' E. fnm)+.(1 e. 'Italic' E. fnm))#'italic '
  fnm=. ({.~ i:&'-') fnm
end.
pbuf 'ctx.font= "', italic, bold, (": getplotfontsize f), 'pt \"', fnm,'\"";'

NB. ---------------------------------------------------------
NB. adjust position to CANVAS baseline
select. rot
case. 0 do. p=. 0 >. p -"1 [ 0, asc
case. 1 do. p=. p +"1 asc, 0
case. 2 do. p=. p -"1 asc, 0
end.

NB. ---------------------------------------------------------
if. is1color e do.
  pbuf 1 canvas_color e
  pbuf canvas_text f;t;p;a;rot;und
else.
  for_i. i.#e do.
    pbuf 1 canvas_color i{e
    pbuf canvas_text f;(i{t);(i{p);a;rot;und
  end.
end.
)
