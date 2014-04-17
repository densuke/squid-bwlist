all:

NOW=$(shell git branch | fgrep '*' | sed -e 's;\*;;g')

update:
	git fetch
	git checkout master
	git merge origin/master
	git checkout $(NOW)

