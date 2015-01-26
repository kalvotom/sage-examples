gamma:
	sage gamma.sage > gamma.tex
	latex gamma
	dvipdf gamma.dvi gamma.pdf
	dvisvgm --no-fonts gamma.dvi gamma.pdf

besselj:
	sage besselj.sage > besselj.tex
	latex besselj
	dvipdf besselj.dvi besselj.pdf
	dvisvgm --no-fonts besselj.dvi besselj.svg

bessely:
	sage bessely.sage > bessely.tex
	latex bessely
	dvipdf bessely.dvi bessely.pdf
	dvisvgm --no-fonts bessely.dvi bessely.svg

all: gamma besselj bessely
