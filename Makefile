.PHONY: clean

EXTRASTYS = ssdefs.sty abhepexpt.sty abhep.sty abmath.sty lineno.sty siunitx.sty SIunits.sty varwidth.sty

main.pdf: main.tex mythesis.bib $(addprefix otherText/,preamble.tex frontmatter.tex appendices.tex) $(addprefix mainChapters/,theory.tex ATLAS.tex LUCID.tex SS.tex monoW.tex TRT.tex)
	@rm -f $(EXTRASTYS)
	unzip extrastyles.zip
	@rm -f main.{aux,toc,lof,lot}
	(pdflatex main && bibtex main && pdflatex main && pdflatex main) || rm -f $(EXTRASTYS) main.pdf
	@rm -f main.{aux,toc,lof,lot}
	@rm -f $(EXTRASTYS)

clean:
	@rm -f $(EXTRASTYS)
	@rm -f main.pdf main.log main.aux
	@rm -f *.bbl *.blg *.lof *.cut
	@rm -f *.lot *.out *.toc
