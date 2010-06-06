NB. key options:
NB.
NB.  key          key legends
NB.  keyfont	  key font
NB.  keystyle     left|right boxed|open vertical|horizontal thin|fat (lbvt)
NB.  keypos       left|center|right top|middle|bottom inside|outside (lti)
NB.  keytitle     key title
NB.
NB. Key placement:
NB.
NB.    horizontal     XXX
NB.                  +---+
NB.                  |   |
NB.                  +---+
NB.                   XXX
NB.
NB.    vertical    X +---+ X
NB.                X |   | X
NB.                X +---+ X
NB.
NB. MKx, MKy are margins. For horizontal boxes, an
NB. additional Mkx is used to pad the outer box.
NB. Extents are padded by 1 point each way, and
NB. width by an additional MKx

KeyOpts=: <;._2 (0 : 0)
bottom
boxed
center
combo
fat
horizontal
inside
left
marker
middle
open
outside
right
thin
top
vertical
)
