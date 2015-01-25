##
## Plots of the Bessel Y functions
##

# plot parameters
xmin = 0.001; xmax = 10.0; delta = 0.005;
ycutoff = 100;
style = ['red','green','blue','brown']

# head
output = u"""\\documentclass{standalone}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{pgfplots}
\\pgfplotsset{compat=1.11}

\\begin{document}

\\begin{tikzpicture}[scale=1.5]
\\begin{axis}[
	ymin=-1.2, ymax=0.6,
	grid=major,
	xlabel=$x$, ylabel=$y$,
	title={Bessel functions $Y_n(x)$},
	legend pos=south east
]\n
"""

# coordinate list generator

def getcoords(func,xstart,xend,xdelta):
	clist = u"{"
	x = xstart
	while x <= xend:
		if abs(func(x)) < ycutoff:
			 clist += " (%.3f,%.3f)" % (x, func(x))
		x += xdelta
	clist += "};\n"
	return clist

# Bessel J of various orders

for k in range(4):
	output += u"\\addplot[black,thick,smooth,%s,opacity=.9] coordinates " % style[k]
	output += getcoords(Bessel(k,'Y'), xmin, xmax, delta)
	output += u"\\addlegendentry{$Y_%i(x)$}\n" % k

# tail
output += u"""
\\end{axis}
\\end{tikzpicture}
\\end{document}"""

# print out the output
print(output)