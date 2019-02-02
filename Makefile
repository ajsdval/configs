.DEFAULT_GOAL := setup

setup:
	pipenv run ansible-playbook main.yml