NB. init

coclass 'jzplot'

NB. this will be the first script being loaded for package jzplot

require 'graphics/afm graphics/color/colortab graphics/bmp graphics/png math/misc/trig'

3 : 0''
NB. prevent JHSOUTPUT from overwritten by another load
if. 0 ~: 4!:0 <'JHSOUTPUT' do. JHSOUTPUT=: 'canvas' end.
if. 0 ~: 4!:0 <'CONSOLEOUTPUT' do. CONSOLEOUTPUT=: 'pdf' end.
if. 0 ~: 4!:0 <'IFTESTPLOTJHS' do. IFTESTPLOTJHS_z_=: 0 end.
if. IFTESTPLOTJHS +. IFJHS do.
elseif. IFQT do.
  if. 0 < #1!:0 jpath '~addons/ide/qt/console.ijs' do.
    require '~addons/ide/qt/console.ijs'
  end.
  require 'graphics/gl2'
  coinsert 'jgl2'
elseif. IFJA do.
  require 'graphics/gl2'
  coinsert 'jgl2'
  CONSOLEOUTPUT=: 'android'
elseif. ('jwin32';'jjava') e.~ < (11!:0) ::0: 'qwd' do.
  require 'graphics/gl2'
  coinsert 'jgl2'
elseif. do.  NB. jconsole
  if. 0 < #1!:0 jpath '~addons/graphics/gl2/gl2.ijs' do.
    require 'graphics/gl2'
    coinsert 'jgl2'
  end.
  if. -. IFIOS +. IFJA +. (UNAME-:'Android') +. ((UNAME-:'Darwin') *. ((0;'') e.~ <2!:5 'QT_PLUGIN_PATH')) +. ((UNAME-:'Linux') *. (0;'') e.~ <2!:5 'DISPLAY') do.
    if. (CONSOLEOUTPUT-:'qtc') *. (0 < #1!:0 jpath '~addons/ide/qt/qt.ijs') *. ('"',libjqt,'" dummyfunction + n')&cd :: (2={.@cder) '' do.
      require '~addons/ide/qt/console.ijs'
    end.
  end.
end.
if. 0 < #1!:0 jpath '~addons/graphics/cairo/cairo.ijs' do.
  require 'graphics/cairo'
  coinsert 'jcairo'
end.
coinsert 'jafm'
''
)

NB. =========================================================
NB. keywords
NB.
NB. KEYWORDS is a boxed list of lowercase keywords. A keyword
NB. given in the left argument to plot or as an argument to pd,
NB. is replaced with its uppercase definition.

NB. ---------------------------------------------------------
NB. no axes
NB. turns all axis decorations off:
NOAXES=: 'axes 0;boxed 0;frame 0;grids 0;labels 0;tics 0;'

NB. ---------------------------------------------------------
NB. no frame
NB. turns axes on, frame off
NOFRAME=: 'axes 1;frame 0'

KEYWORDS=: 'noaxes';'noframe'
