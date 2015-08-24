.PHONY: all update sort

all:

NOW=$(shell git branch | fgrep '*' | sed -e 's;\*;;g')

update:
	git fetch
	git checkout master
	git merge origin/master
	git checkout $(NOW)

sort:
	sort -u  blackhost.txt | grep -v '^$'  > blackhost.tmp
	- cmp blackhost.txt blackhost.tmp || mv -v blackhost.tmp blackhost.txt
	rm -f blackhost.tmp
	./check
