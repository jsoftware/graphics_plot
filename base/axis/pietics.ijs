NB. pie tics

NB. old method, not supported in J601
NB. NB. =========================================================
NB. drawpietics=: 3 : 0
NB. 'rw rh pos'=. y
NB. rad=. <. -: {: Gxywh
NB. xy=. rndint rad * rw,.rh
NB. xy drawpietic1"1 pos
NB. )
NB.
NB. NB. =========================================================
NB. NB. drawpietic1
NB. NB.
NB. NB. returns list of 6 numbers for tic
NB. NB.
NB. NB. need to check for overlap with text labels
NB.
NB. drawpietic1=: 4 : 0
NB.
NB. min=. 10
NB. bit=. 2
NB.
NB. NB. ---------------------------------------------------------
NB. 'x y'=. x
NB. 'px py pw ph'=. y
NB.
NB. NB. ---------------------------------------------------------
NB. NB. flip negatives:
NB. neg=. x < 0
NB. if. neg do.
NB.   x=. | x
NB.   px=. - px + pw
NB. end.
NB.
NB. if. y >: py + min do.
NB.   if. x <: px - min do.
NB.     ymid=. <. py - -: ph
NB.     tic=. (x,y),(px-min),ymid,(px-bit),ymid
NB.   else.
NB.     xmid=. <. px + -: pw
NB.     tic=. (x,y),xmid,(y<.py+min),xmid,y<.py
NB.   end.
NB.
NB. NB. ---------------------------------------------------------
NB. elseif. y <: py - min do.
NB.   if. x <: px - min do.
NB.     ymid=. <. py - -: ph
NB.     tic=. (x,y),(px-min),ymid,(px-bit),ymid
NB.   else.
NB.     xmid=. <. px + -: pw
NB.     tic=. (x,y),xmid,(y>.py-ph+min),xmid,y>.py-ph
NB.   end.
NB.
NB. NB. ---------------------------------------------------------
NB. elseif. do.
NB.   ymid=. <. py - -: ph
NB.   tic=. (x,y),(x>.px-min),ymid,(x>.px-bit),ymid
NB. end.
NB.
NB. NB. ---------------------------------------------------------
NB. if. neg do.
NB.   tic=. tic scalepos _1 1
NB. end.
NB.
NB. )

NB. =========================================================
drawpietics=: 3 : 0
rad=. <. -: <./ _2 {. Gxywh
ctr=. (Gx+-:Gw),Gy+-:Gh
xy=. rndint (rad * y),.(rad+MPieTic) * y
xy +"1 [ 4 $ ctr
)
