serve: # serves the wiki
	mkdocs serve

install: # install python dependencies
	pip install mkdocs mkdocs-material mkdocs-awesome-pages-plugin mkdocs-git-revision-date-plugin

deploy:
	git push
	mkdocs gh-deploy

build:
	mkdocs build

clean:
	rm -r site

open-website:
	xdg-open https://ironbar.github.io/understanding_intelligence/ &
