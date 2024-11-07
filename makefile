.PHONY: setup install remove

all: help

setup:
	NONINTERACTIVE=1 /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo >> ~/.bashrc
	echo 'eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
	echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/binutils/bin:$$PATH"' >> ~/.bashrc

install:
	brew install ansible && ansible-playbook local.yml

remove:
	ansible-playbook local.yml -e "state=absent" && brew remove ansible

help:
	@echo "Valid commands:"
	@echo "  make setup	Setup build tools"
	@echo "  make install	Install cli-essentials"
	@echo "  make remove	Remove cli-essentials"
	@echo "  make help	Make sure GIT is installed"
