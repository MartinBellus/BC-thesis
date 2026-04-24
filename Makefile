TMP_DIR := tmp

IMAGES :=

PDFS := thesis.pdf abstract-cs.pdf abstract-en.pdf

.PHONY: all clean clean-tex clean-img force

all: $(IMAGES) $(PDFS)

thesis.pdf:
	mkdir -p $(TMP_DIR)
	latexmk -pdf -outdir=$(TMP_DIR) thesis.tex
	cp $(TMP_DIR)/thesis.pdf .

%.pdf: abstracts/%.tex
	mkdir -p $(TMP_DIR)
	latexmk -pdf -outdir=$(TMP_DIR) abstracts/$*.tex
	cp $(TMP_DIR)/$@ .

img/%.pdf: img/tex/%.tex
	mkdir -p $(TMP_DIR)
	latexmk -pdf -outdir=$(TMP_DIR) img/tex/$*.tex
	cp $(TMP_DIR)/$*.pdf ./img/

clean:
	rm -rf $(TMP_DIR)
	rm -f $(IMAGES)
	rm -f $(PDFS)

clean-tex:
	rm -rf $(TMP_DIR)
	rm -f $(PDFS)

clean-img:
	rm -rf $(IMAGES)
	rm -f $(PDFS)
