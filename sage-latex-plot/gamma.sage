##
## Plot of the Gamma function
##

# plot parameters
xmax = 5.0; delta = 0.01;
xcutoff = 0.001
ycutoff = 100;

# head
output = u"""\\documentclass{standalone}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{pgfplots}
\\pgfplotsset{compat=1.11}

\\begin{document}

\\begin{tikzpicture}[scale=1.5]
\\begin{axis}[
	ymin=-7.0, ymax=7.0,
	grid=major,
	xlabel=$x$, ylabel={$y$},
	xtick={-4,-3,...,5},
	title={Gamma function}
]
"""

# coordinate list generator

def getcoords(func,xstart,xend,xdelta):
	clist = u"{"
	x = xstart
	while x <= xend:
		if abs(func(x)) < ycutoff:
			 clist += " (%.4f,%.4f)" % (x, func(x))
		x += xdelta
	clist += "};\n"
	return clist


# Gamma

output += u"\\addplot[black,thick,smooth] coordinates "
output += getcoords(gamma, xcutoff, xmax, delta)
output += u"\\addlegendentry{$\\Gamma(x)$}\n"

for k in [-4.0,-3.0,-2.0,-1.0]:
	output += u"\\addplot[black,thick,smooth] coordinates "
	output += getcoords(gamma, k+xcutoff, k+1.0, delta)

# Gamma^-1

output += u"\\addplot[black,thick,smooth,densely dotted] coordinates "
output += getcoords(lambda x: gamma(x)^(-1), xcutoff, xmax, delta)
output += u"\\addlegendentry{$\\Gamma(x)^{-1}$}\n"

for k in [-4.0,-3.0,-2.0,-1.0]:
	output += u"\\addplot[black,thick,smooth,densely dotted] coordinates "
	output += getcoords(lambda x: gamma(x)^(-1), k+xcutoff, k+1.0, delta)

# tail
output += u"""
\\end{axis}
\\end{tikzpicture}
\\end{document}"""

# print out the output
print(output)