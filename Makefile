.DEFAULT_GOAL := setup

playbook = pipenv run ansible-playbook

setup:
	$(playbook) main.yml

upgrade:
	$(playbook) main.yml --tags upgrade

preview:
	$(playbook) main.yml --check --diff
