push:
	git add .
	git commit -m "$m"
	git push -u origin $b

tagandpublish:
	git add .
	git commit -m "$m"
	git push -u origin $b
	git tag -a $v -m "tag and publish a new snapshot version $v"
	git push origin $v
