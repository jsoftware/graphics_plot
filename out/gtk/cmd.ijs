NB. cmd

NB. =========================================================
NB. draw edge
gtk_edge=: 4 : 0
's t f e c p'=. y
glbrushnull''
fn=. x~
if. (is1color e) *. 1=#s do.
  s glsetpen e
  fn p
else.
  s=. (#p) $ s
  e=. (#p) $ citemize e
  for_i. i.#s do.
    (i{s) glsetpen i{e
    fn i{p
  end.
end.
)

NB. =========================================================
NB. draw shape
gtk_shape=: 4 : 0
'v s f e c p'=. y
if. v=0 do. e=. c end.
fn=. x~
if. isempty c do.
  glbrushnull''
  if. is1color e do.
    glsetpen e
    fn p
  else.
    for_clr. e do.
      glsetpen clr
      fn clr_index{p
    end.
  end.
else.
  if. (is1color e) *. is1color c do.
    glsetpen e
    glsetbrush c
    fn p
  else.
    c=. (#p) $ citemize c
    e=. (#p) $ citemize e
    for_i. i.#p do.
      glsetpen i{e
      glsetbrush i{c
      fn i{p
    end.
  end.
end.
)
