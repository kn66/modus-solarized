EMACS ?= emacs

.PHONY: test compile clean

test:
	$(EMACS) -Q --batch --eval "(package-initialize)" \
	  -L . -L test \
	  -l modus-solarized-test \
	  -f ert-run-tests-batch-and-exit

compile:
	$(EMACS) -Q --batch --eval "(package-initialize)" \
	  -L . -f batch-byte-compile \
	  modus-solarized.el \
	  modus-solarized-light-theme.el \
	  modus-solarized-dark-theme.el

clean:
	rm -f modus-solarized.elc modus-solarized-light-theme.elc \
	  modus-solarized-dark-theme.elc test/*.elc
