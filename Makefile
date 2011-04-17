BASE_DIR=~/

DOT_FILES=.bashrc .emacs .emacs.d

AWESOME_DIR=$(BASE_DIR).config/

install-dotfiles:
	mkdir -p $(BASE_DIR).emacs.d/
	cp -rf  $(DOT_FILES) $(BASE_DIR)

install-awesome:
	cp -rf awesome $(AWESOME_DIR)
