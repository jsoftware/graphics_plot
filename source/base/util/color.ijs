NB. color

". toupper COLORTABLE

NB. =========================================================
NB. standard colors
STDCLR=: _3[\BLUE,RED,GREEN,PURPLE,FUCHSIA,OLIVE,TEAL,YELLOW,TAN,AQUA,BROWN,GRAY

NB. 16 primary colors:
CLR16=: RED,BLUE,GREEN,AQUA,FUCHSIA,LIME,YELLOW,BROWN,TEAL,MAROON,NAVY,OLIVE,SILVER,GRAY,BLACK,:WHITE

NB. =========================================================
NB. various color schemes:
RBCLR=: 64 colorxy 1 0 0,:0.5 0 0.5

NB. RGCLR - red/green
RGCLR=: 64 colorxy 0 0.5 0.5, 0 0.75 0 ,: 1 0 0

NB. RGBCLR - red/green/blue
RGBCLR=: 64 colorxy |."1 #:7|3^i.6

NB. NB. BGRCLR - blue/green/red
NB. BGRCLR=: 64 colorxy |."1 #:7|3^|.i.5

NB. BGCLR - blue/green
BGCLR=: 64 colorxy 0.25 0.95 0.3 ,: 0.25 0.25 1

NB. =========================================================
NB. gray scalepos colors
GRAYSCALE=: 1 (3&#)\ <. 0.5 + 255 * 0.01 * i.101
