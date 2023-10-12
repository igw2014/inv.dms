push:
	git add .
	git commit -m "$m"
	git push -u origin $b

tagandpublish:
	git add .
	git commit -m "$m"
	git push -u origin $branch
	git tag -a $version -m "tag and publish a new snapshot version $version"
	git push origin $version
