.DEFAULT_GOAL := setup

playbook = source .env/bin/activate && ansible-playbook --ask-vault-pass --ask-become-pass -i inventory

lint:
	$(playbook) main.yml --syntax-check

setup:
	$(playbook) main.yml

upgrade:
	$(playbook) main.yml --tags upgrade

preview:
	$(playbook) main.yml --check --diff
