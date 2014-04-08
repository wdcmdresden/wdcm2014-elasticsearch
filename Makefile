build:
	cd presentation && middleman build
	git status
	git add .
deploy:
	git push origin master
	git push origin master:gh-pages


