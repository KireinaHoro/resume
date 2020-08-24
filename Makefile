.PHONY: all

CC = xelatex
CV_DIR = cv
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
BUILD = build/

all: $(foreach x, cv, $x.pdf)

$(BUILD):
	mkdir -p $@

cv.pdf: cv.tex $(CV_SRCS) $(BUILD)
	$(CC) -output-directory=$(BUILD) $<

clean:
	rm -rf $(BUILD)
