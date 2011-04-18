BASE_DIR=~/
BIN_DIR=$(BASE_DIR)bin/
DOT_FILES=.bashrc .emacs .emacs.d

AWESOME_DIR=$(BASE_DIR).config/

install-dotfiles:
	mkdir -p $(BASE_DIR).emacs.d/
	cp -rf  $(DOT_FILES) $(BASE_DIR)
	mkdir -p $(BASE_DIR)bin/
	cp wakeup $(BIN_DIR) && chmod +x $(BIN_DIR)/wakeup

install-awesome:
	cp -rf awesome $(AWESOME_DIR)
