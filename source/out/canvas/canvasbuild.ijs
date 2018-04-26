NB. canvas build

NB. =========================================================
NB. canvas_build
canvas_build=: 4 : 0
if. #x do.
  'function(ctx){',LF,y,'}',LF
else.
  canvas_wrap (canvas_header''),LF,'function drawPlot(ctx) {',LF,y,'}',LF
end.
)

NB. =========================================================
canvas_header=: 3 : 0
r=. ('80';(pfmt 0{Pxywh);'40';(pfmt 1{Pxywh)) stringreplace canvas_template
r=. ('<1>';IFJHS{::'';'<!--[if lt IE 9]><script src="/~addons/ide/jhs/js/excanvas.js" type="text/javascript"></script><![endif]-->') stringreplace canvas_template
)

canvas_template=: 0 : 0
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset=utf-8>
	<title>J Plot</title>
	<style>
		#canvas1 { margin-left:80px; margin-top:40px; }
	</style>

  <1>
	<script type="text/javascript">
		function graph() {
			var graphCanvas = document.getElementById('canvas1');
			// ensure that the element is available within the DOM
			if (graphCanvas && graphCanvas.getContext) {
				// open a 2D context within the canvas
				var context = graphCanvas.getContext('2d');
				// draw
				drawPlot(context);
			}
		}
)

NB. =========================================================
CANVAS_TRL=: 0 : 0
	</script>
</head>
<body onLoad="graph();">
	<article>
		<h1>plot</h1>
		<canvas id="canvas1" width="800" height="400"></canvas>
	</article>
</body>
</html>
)

NB. =========================================================
canvas_wrap=: 3 : 0
y, ('800';(pfmt 2{Pxywh);'400';(pfmt 3{Pxywh)) stringreplace CANVAS_TRL
)
