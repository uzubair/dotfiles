# Setup a new machine
.PHONY: setup
setup:
	./setup.sh --setup

# Install only the dotfiles
.PHONY: install
install:
	./setup.sh --install
