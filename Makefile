## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## All markdown files in the working directory
SRC = $(wildcard *.$(MEXT))

CSS=$(HOME)/.pandoc/templates/css/john-full.css

# Pandoc options
#----------------------------------------
# --standone		|	add header and footer
# --smart		|	curly quotes
# --self-contained	|	no internet reference
# --listings		|	listings package for LaTeX

# Unified Pandoc command line
PANDOC=pandoc \
	--toc \
	--smart \
	--standalone \

# Per extension options
PANDOC_html5=--css=$(CSS) --self-contained
PANDOC_pdf=--latex-engine=xelatex -V mainfont='Droid Sans' --listings

DESIRED_FORMATS=html5 pdf

all: $(DESIRED_FORMATS)

html5: $(SRC)
	$(PANDOC) \
	$(PANDOC_$@) \
	-o $(SRC:.md=.$@) $<

latex: $(SRC)
	$(PANDOC) \
	$(PANDOC_$@) \
	-o $(SRC:.md=.$@) $<


pdf: $(SRC)
	$(PANDOC) \
	$(PANDOC_$@) \
	-o $(SRC:.md=.$@) $<

odt: $(SRC)
	$(PANDOC) \
	$(PANDOC_$@) \
	-o $(SRC:.md=.$@) $<

beamer: $(SRC)
	$(PANDOC) \
	$(PANDOC_$@) \
	-o $(SRC:.md=.$@) $<


epub: $(SRC)
	$(PANDOC) \
	$(PANDOC_$@) \
	-o $(SRC:.md=.$@) $<
