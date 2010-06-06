NB. plotf
NB.
NB. TODO:
NB. In plot, don't change colors for the different pieces of a piecewise graph

NB. definitions required by plotsubd
NB. stored in global PlotfDefs
PlotfNames=: <;._2 (0 : 0)
SINGTOLER
XFUNCRES
YFUNCRES
)

NB. origlocale
NB. plotconvertstringtogerund_z_
NB. plotdefverbd
NB. plotdefverbm
NB. plotf_userverb_z_ (2)
NB. plotfintvl
NB. plotfiy
NB. plotfn
NB. plotsubd

NB. Verb to convert a boxed specifierstring to gerund.
NB. Defined in _z_, runs in user's locale.
NB. Can be called as monad or dyad (x is ignored),
NB. and creates a verb of the corresponding valence
plotconvertstringtogerund_z_=: 3 : 0"0 _ 0
if. +./ ((,'y');'y.') e. ;: >y do.
  {. ''`(13 : (>y) f.)
else.
  {. ''`(13 : ('(' , (>y) , ') y') f.)
end.
:
if. +./ ((,'y');'y.') e. ;: >y do.
  {. ''`(13 : (>y) f.)
else.
  {. ''`(13 : ('x (' , (>y) , ') y') f.)
end.
)

NB. Dyad to create monadic verb for subsequent pd
NB. x is (boxed) name of user's locale
NB. y is verb specifier: either a gerund or a string
NB.  if a string, y is a sequence of verb-specifiers
NB.  separated by ` (` in a specifier must be written ``).
NB. verb-specifier is: verb-string(such as '5&+' or 'disp')
NB.  which is converted to a verb via 13 : '(verb-string) y' f.
NB.  OR a string containing 'y' in which case it is
NB.  converted to a verb via 13 : 'verb-string' f.
NB. In either case, the verbs are converted to gerunds and
NB. the result is (locale name) ,&< gerunds
plotdefverbm=: 4 : 0
locale=. x
NB. if y is a gerund, use it directly
if. 32 ~: 3!:0 gerund=. y do.
NB. Break the string into specifiers.  Handle `` escapes
  boxs=. <@('`'"_^:(-.@*@#));._1@('`'&,) y  NB. strings betw `, with `` as <'`'
  specs=. (<@;;.1~ (1&(0}))@(*. |.!.0)@:(#@$@>)) boxs
NB. Convert each string to a gerund - in the user's locale
  gerund=. plotconvertstringtogerund__locale specs
end.
NB. Return the locale and the gerund
locale ,&< gerund
)
NB. Similar for the dyadic case
plotdefverbd=: 4 : 0
locale=. x
NB. if y is a gerund, use it directly
if. 32 ~: 3!:0 gerund=. y do.
NB. Break the string into specifiers.  Handle `` escapes
  boxs=. <@('`'"_^:(-.@*@#));._1@('`'&,) y  NB. strings betw `, with `` as <'`'
  specs=. (<@;;.1~ (1&(0}))@(*. |.!.0)@:(#@$@>)) boxs
NB. Convert each string to a gerund - in the user's locale
  gerund=. '' plotconvertstringtogerund__locale specs
end.
NB. Return the locale and the gerund
locale ,&< gerund
)

NB. Verb to plot 2-D and 3-D functions
NB.
NB. plotsubd x;<yspec
NB. plotsubd x;y;<zspec

NB. x and y can be of 2 forms: boxed or unboxed.
NB. If boxed, the contents of the boxes contain operands to the verb,
NB. and the results are drawn with no line connecting the results from
NB. the boxes.  If unboxed, should be a list of 2 or 3 atoms (or an
NB. array  whose items are 2 or 3 long.  Unboxed operand is interpreted
NB. as start,end,nsteps and produces steps between start and end.  If
NB. nsteps is 0 or omitted, plotf chooses a suitable number, attempting
NB. to account for discontinuities in the function.
NB.
NB. If x or y is unboxed but is a list longer than 3 atoms, it is
NB. treated as operand points (i. e. it is boxed immediately).
NB.
NB. The yzspec is (locale ,&< gerund).  Each verb of the gerund is processed
NB. against the operands, and the result is returned as plot data
NB.
NB. Result is a list of boxes, one for each gerund.  Each box contains
NB. a boxed array of shape n,2 for 2-D or n,3 for 3-D, where each item
NB. is points, suitable to be an operand to pd.

NB. NOTE: in this function, the operands of 2-D plot are named y and z;
NB. for 3-D plot they are named x, y, and z
plotsubd=: 3 : 0"1
(PlotfNames)=: PlotfDefs
NB. origlocale_jwplot_ =: 0 {:: > {: y
origlocale=: 0 {:: > {: y
gerund=. 1 {:: > {: y
res=. 0$a:
if. 2 = #y do.
NB. If y is an open list more than 3 long, box it
  y=. boxopen"1^:(3:<{:@$) 0 {:: y

NB. Options set; create verbs to apply log scaling if any
  pfmody=: ]`(^.) @. XLOG
  pfmodz=: ]`(^.@:(0&>.)) @. YLOG

NB. Process each atom of the gerund
  for_n. gerund do.
NB. Create the plot verb, which is a monadic hook that takes the list
NB. of operand abscissas.  The result of the user's verb is reshaped into
NB. a rank-2 array always, so the result of this verb is always
NB. a 2-box list abscissas ; (rank-2 array of ordinates)
NB. This verb is DEFINED in z, but it is EXECUTED in the user's locale
    plotf_userverb_z_=: (; # (((%~,[) #) ($,) ]) (n`:6))
NB. Create the plotted points
    d=. plotfn y
NB. Scale the plot if it contained discontinuities
    if. (1 < #d) *. 0 = #YRANGE do.  NB. and the user didn't give a range
NB. When there are discontinuities, it is a challenge to scale the
NB. plot correctly, since the discontinuity may have a value of infinity
NB. and that is unscalable.  We ignore the 1%SINGTOLER of the interval closest
NB. to the singularity, but only as long as the function values are
NB. monotone increasing or decreasing.  We calculate the range from
NB. the resulting values.  Then we go back and calculate the range
NB. based on all the points (in case the discontinuity was NOT infinite).
NB. We use the whole range unless it is more than twice as large as
NB. the range ignoring discontinuities; then we use the smaller range.

NB. calculate the lengths of the monotone runs
      mtone1=. (<./@:((i.&0@:(2&(<:/\)) >. i.&0@:(2&(>:/\)))"1))@(1&{::)"1 d
      mtonen=. (>./@:((i:&0@:(0&,)@:(2&(<:/\)) <. i:&0@:(0&,)@:(2&(>:/\)))"1))@(1&{::)"1 d
NB. Calculate where the first and fourth quintiles are
      quintiles=. ((((+ {.)~ i.&1@:<: [) , ((-~ {:)~ i:&1@:>: [)) %&(1.01 >. SINGTOLER)@({:-{.))@(0&{::)"1 d
NB. Create the interval to use, and extract the extreme values in each.  Use the
NB. quintile/monotone values only if the point is a singularity.  Convert the
NB. interval to the form used by ;.0
      intvl=. 0 _,."1 -~/\"1 (> 2{"1 d) {"0 1 (0 ,. {:@$@> 1{"1 d) ,"0 (mtone1,.mtonen) <.&.(1 _1&*"1) quintiles
      extremes=. (<./&.:(1 _1&*"1)) ; intvl <@:(((<./"1^:2 , >./"1^:2);.0 (1)&{::)"2 1) d
NB. Calculate the extremes using all data
      allextremes=. (<./&.:(1 _1&*"1)) ; <@:((<./"1^:2 , >./"1^:2)@:(1&{::)"1) d
NB. If the full range is lots bigger than the smaller, use the smaller
      if. allextremes >&(-~/) 2 * extremes do.
NB. chop consecutive out-of-range off the end of a singularity.  If z is an array,
NB.  call the point out-of-range if any data point is out-of-range
        oor=. (<extremes) +./@(<:/"1@:(<:"1 0))&.> 1{"1 d
        oormsk=. (2{"1 d) +:/@(*. (*./\ ,: *./\.))&.> oor
        d=. oormsk #"1&.>"0 1 (2){."1 d
      end.
    end.
NB. Plot the data
    res=. res , < 2 {."1 d
  end.
else.   NB. must be 3-D plot
  x=. boxopen"1^:(3:<{:@$) 0 {:: y
  y=. boxopen"1^:(3:<{:@$) 1 {:: y

NB. Options set; create verbs to apply log scaling if any
  pfmodx=: ]`(^.) @. XLOG
  pfmody=: ]`(^.) @. YLOG
  pfmodz=: ]`(^.) @. ZLOG

NB. Process each atom of the gerund
  for_n. gerund do.
NB. Create the plot verb, always producing rank 2
    plotf_userverb_z_=: ([ ; ] ; (n`:6)"0 _)
NB. Create the plotted points
    res=. res , < x plotfn y
  end.
end.
res
)

NB. plotf_userverb_z_ is verb to be plotted; [x] and y
NB. are (possibly list of) values, either as
NB. boxed lists or intervals
NB. Result is rank-2 array of x;y;z  or y;z;mask  operand/data boxes
plotfn=: 3 : 0
NB. For intervals, go analyze each interval
if. 0 = L. y do.
NB. Force y to rank 2
  y=. ,:^:(2-#$y) y
NB. The y values we use will be steps in screen space; convert the input
NB. to screen space here.  We will convert back to operand space when we
NB. apply the user's verb
  y=. (pfmody 2 {."1 y) ,"1 (2) }."1 y
NB. Calculate yrange (if user didn't specify one), and divide by
NB. the subdivision resolution (which defaults to half a pixel),
NB. to create the minimum feature size in y
  if. 0 = #yrange=. XRANGE do. yrange=. 0 1{"0 _1 (<./ ,: >./) y end.
  if. 0 = #sres=. XFUNCRES do. sres=. 2 * 2 { Dxywh end.
  pfresy=: (| -/ yrange) % sres
NB. Create lists of points for each interval, and then collect them
NB. into lists for y and z
  ; <@plotfiy y
else.
NB. For point values, evaluate function.
NB. This calculation must be done in the original locale
  plotf_userverb__origlocale&> ,y
end.
:
NB. dyadic case is 3D plot.  For the nonce, we don't do the check for
NB. discontinuities, so just convert intervals to point lists & create
NB. the surface from the points.  Use default of 25 steps
x=. <@(pfmodx^:_1)@:steps@(pfmodx@(2&{.) , {.@(,&25)@(2&}.))"1^:(0:=L.) x
y=. <@(pfmody^:_1)@:steps@(pfmody@(2&{.) , {.@(,&25)@(2&}.))"1^:(0:=L.) y
NB. create cross-product of point lists
; x plotf_userverb__origlocale&.>/ y
)

NB. plotf_userverb_z_  is verb to be plotted; y is interval
NB. start,end[,count], in screen space
NB. Result is rank-1 or rank-2 array of y;z;(singularity mask)
plotfiy=: 3 : 0 ("1)
if. 0 < 2 { y,0 do.
NB. User gives subdivision by specifying the count: use that many
NB. steps, and append mask indicating 'no singularity')
  (plotf_userverb__origlocale pfmody^:_1 steps y) , <0 0
else.  NB. here we calculate the 'proper' number of points to use
NB. Start with a fixed number, and if it looks like there is a singularity
NB. or an interval that needs more attention, subdivide it.
NB. If we have a singularity, truncate the plot so that the
NB. off-to-infinity part doesn't dominate.
  pfrngz=: $ 0  NB. Init to unknown range
  pfrngy=: 2 {. y  NB. Save the domain so we don't evalute outside
  plotfintvl (2 {. y),100
end.
)

NB. plotf_userverb_z_ is verb to be plotted; y is interval start/end/nsubd
NB. in screen space
NB. Result is list of y;results;mask (y in operand space)
NB. where mask has shape 2 and indicates whether the
NB. left and right for the corresponding item of results are singularities
NB. We subdivide the interval, look for discontinuities, and recur
plotfintvl=: 3 : 0"1
NB. If the interval is too small on the screen to subdivide, return
NB. the endpoints as two different intervals with a singularity in between.
NB. If one of the endpoints evaluates to infinity, remove it.  This is
NB. possible only at the ends of the original interval, since other
NB. infinities should be subsumed in a larger interval.
NB. debug qprintf 'y '
if. pfresy > -~/ 2 {. y do.
  'y res'=. plotf_userverb__origlocale pfmody^:_1 (2 {. y)
  (-. +./ res e. _ __) # (<@,"0 y) ,. (<"2@:|:@,: res) ,. 0 1;1 0
NB. debug sing [ qprintf 'sing '
  return.
end.
NB. Evaluate the function at the points given.  Save screen-space y
'yvals zvals'=. plotf_userverb__origlocale pfmody^:_1 yscrn=. steps y
NB. Calculate the provisional range for z.  This is the range with extreme
NB. values (top&bottom 10%, here) of z removed.
NB. We use this to decide whether the function
NB. is straight enough that it doesn't need to be subdivided.  We
NB. discard extreme values in case we evaluated the point at a singularity.
NB. But if the user specified a YRANGE, just use it
NB. Do this only once
if. 0 = #pfrngz do.
  if. 0 = #pfrngz=: YRANGE do.
    pfrngz=: -~/ pfmodz (({~ , ({~ _1&-)) <.@(0.1&*)@#) /:~ ,zvals
  end.
NB. Calculate minimum feature size in z
  if. 0 = #sres=. YFUNCRES do. sres=. 2 * 3 { Dxywh end.
  pfresz=: pfrngz % sres
end.

NB. Approximate the derivative at each point.  If the points are too
NB. close together, give up because the secant will be invalid.
NB. Be careful not to evaluate the function outside the original
NB. interval, for the function may be undefined elsewhere
if. 0.000001 < (-~ % 0.001&>.@|@[)/ 2 {. yvals do.
  intsize=. 2 -~/\ yvals
  'ylo zlo'=. plotf_userverb__origlocale ({.pfrngy) >. yvals - (,~ {.) 0.01 * intsize
  'yhi zhi'=. plotf_userverb__origlocale ({:pfrngy) <. yvals + (, {:) 0.01 * intsize
  secant=. (zhi-zlo) %"1 yhi-ylo

NB. Project derivative forward & backward.
  fwdproj=. ({."1 zvals) ,"0 1 (}:"1 zvals) + (}:"1 secant) *"1 intsize
  bakproj=. ({:"1 zvals) ,~"0 1 (}."1 zvals) - (}."1 secant) *"1 intsize
NB. First/continue a subdivided interval on a point which is not pointed to
NB. by the following point.  Infinity is a miss
NB. Last/continue a subdivided interval on a point which is not pointed to
NB. by the preceding point.  Infinity is a miss
NB. Make any point on or just after a start/continue an end/continue, and any
NB. point on or just before an end/continue a start/continue
  'intst inten'=. (+. (+. 1 _1&(|."0 1))@:|.) (+./ (zvals e. _ __)) +."1 +./"2 (| (bakproj,:fwdproj) -"2&:pfmodz zvals) > pfresz
NB. debug qprintf 'yvals zvals fwdproj bakproj intst inten '
NB. Calculate interval starts and end
  intervals=. (I. 2 </\ 0 , intst) ,. (I. 2 >/\ inten , 0)
NB. Calculate intervals (,.start,len) of UNsubdivided data.  Unsub intvl starts
NB. with the endpoint of the previous subd intvl.  Discard 0-length intvls
  unsubint=. ,.@((-~ >:)/\)"1 (#~ ~:/"1) _2 ]\ 0 , (,intervals) , #yvals
NB. Create list of all intervals, in y;z;mask form.  For the
NB. unsubdivided intervals, each is just y;z;0 0
NB. For the subdivided intervals, recur to replace each interval
NB. with a list of y;z;mask, and collect the lists
  subres=. (unsubint <;.0 yvals) ,. (unsubint <@|:;.0 |: zvals) ,. <0 0
  if. #intervals do.
    subres=. /:~ subres , ; <@plotfintvl (intervals { yscrn) ,. +: >: -~/"1 intervals
  end.
NB. Intervals are collected and in order.  Now join any intervals that
NB. are not separated by a singularity.  Calculate places where there is a split,
NB. with a leading 1
  splitpoints=. _2 +./\ |.!.1 , , > 2{"1 subres
NB. verb to merge boxes.  The
NB. n,3 array of boxes is transposed to 3,n, and then a verb is applied to
NB. each row using ;.1 (gerund form).  The first two rows (y and z) delete
NB. the first item of all but the first box; the third row takes the first and last
NB. mask bits
  merge=. ,@(1&((2 # (,}.)"1&.>/"1`'')`(<@(0 _1&{)@;);.1))@|:
NB. merge each block of intervals.  Unjoined intervals are processed individually
NB. and thereby left unchanged
NB. debug qprintf 'splitpoints subres '
  subres=. splitpoints merge;.1 subres
else.
NB. Here we could not calculate derivatives, so we don't know whether there's
NB. a singularity or not.  Just return the points (after removing infinities),
NB. with no singularity marked
  noninf=. -. +./ zvals e. _ __
  subres=. ,: (noninf#yvals) ; (noninf#"1 zvals) ; 0 0
end.
NB. debug qprintf 'subres '
subres
)
