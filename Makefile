all:	paper.pdf

paper.pdf: paper.tex references.bib
	pdflatex $^
	bibtex paper >/dev/null || echo
	pdflatex $^ 2>/dev/null >/dev/null
	pdflatex $^

edit:
	texmaker paper.tex &

indent:
	latexindent -l paper.tex > paper-indent.tex
	@echo "Check the generated file 'paper-indent.tex' by latexindent"

clean:
	rm -f *.dvi *.aux *.log *.ps paper.pdf *.out paper.bbl paper.blg
