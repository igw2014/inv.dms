push:
	git add .
	git commit -m "$m"
	git push -u origin $b

tag:
	git add .
	git commit -m "$m"
	git push -u origin $b
	git tag -a $v -m "tag a new snapshot version $v"
	git push origin $v
