.PHONY: clone-all update-all sync-gitignore

sync-gitignore:
	cat languages.txt > .gitignore

sync-readme:
	./sync_readme.sh

clone-all: sync-gitignore sync-readme
	bash clone_repos.sh

update-all: sync-gitignore
	bash update_repos.sh

install-hooks:
	pip install pre-commit
	pre-commit install
