LASTNAME	= lhermenier
FIRSTNAME	= guillaume

export CV	= ${FIRSTNAME}_${LASTNAME}_cv
export CVFR	= ${CV}_fr

export SRCDIR	= ${PWD}/src
export OUTDIR	= ${PWD}/output
export VIEWER	= zathura

fr::
	mkdir -p ${OUTDIR}
	sudo docker run --rm -v ${SRCDIR}:/var/inputs -v ${OUTDIR}:/var/output gocho/moderncv:latest xelatex --output-directory /var/output ${CV}_$@.tex
	ln -s -f ${OUTDIR}/${CV}_$@.pdf .

frdisplay::
	${VIEWER} ${CVFR}.pdf

clean::
	rm -f ${OUTDIR}/*.{aux,log,out}

distclean:: clean
	rm -rf *.pdf ${OUTDIR}
