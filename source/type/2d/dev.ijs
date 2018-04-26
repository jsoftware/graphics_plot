NB. dev

NB. ---------------------------------------------------------
NB. sort each
NB. pos=. (rws,2 2) ($,) }."1 /:~ (2#i.rws),.((2*rws),2) ($,) pos


NB. pos=. conpaths each pos

NB. pos=. roundint 1e5 * pos
NB. rws=. #pos
NB. pos=. lvl </. pos
NB. lvl=. ~. lvl


NB. p=: 0 1 2 3 4
NB. q=: 2 3 4 3 0
NB. rfx=: i.@# ,&.> ]
NB. sq =: ~.@;@:{&.> <
NB. rtc=: sq^:_ @ rfx

a=: 0 3 1 2 2 2 3 3
b=: 0 1 1 1 2 0
c=: 3 0 2 1 3 2 3 0

f=: 2: ,\ _2: ,\ ]
d=: sort ; f each a;b;c

p=: 2 {."1 d
q=: 2 }."1 d

e=: ~. p,q
p=: e i. p
q=: e i. q
m=: q -. p
p=: p, m
q=: q, m

p=: 0 1 2 3 4 5 6 7 8 9
q=: 2 6 4 7 0 9 1 8 8 9


NB. =========================================================
NB. returns arcs;cycles
conpaths=: 3 : 0
'p q'=. 0 2 |: _2 /:~\"1 /:~y
e=. ~. p,q
p=. e i. p
q=. e i. q
m=. q -. p
p=. p, m
q=. q, m
bgn=. p -. q
arc=. {&q^:a: each bgn
msk=. p e. ;arc
if. 0 e. msk do.
  bgn=. (-.msk) # p
  end=. (-.msk) # q
  cyc=. (C. bgn i. end) { each <end
else.
  cyc=. ''
end.
arc=. arc {each <e
cyc=. cyc {each <e
arc ; <cyc
)

dbg 1
dbstop''
smoutput run''

NB. p=: 0 1 2 3 4
NB. q=: 2 3 4 3 0
