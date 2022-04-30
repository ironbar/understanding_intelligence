serve: # serves the wiki
	mkdocs serve

install: # install python dependencies
	pip install mkdocs mkdocs-material mkdocs-awesome-pages-plugin

deploy:
	mkdocs gh-deploy

build:
	mkdocs build

clean:
	rm -r site