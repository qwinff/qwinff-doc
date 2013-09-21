#!/bin/bash

ITEMS="""
html
singlehtml
latexpdf
"""

publish_html() {
	cp -r _build/html html
}

publish_singlehtml() {
	cp -r _build/singlehtml singlehtml
}

publish_latexpdf() {
	mkdir -p latexpdf
	cp -r _build/latex/QWinFF.pdf latexpdf/qwinff.pdf
	echo "<a href=\"qwinff.pdf\">qwinff pdf document</a>" > latexpdf/index.html
}

generate_index() {
	echo "<ul>" > index.html
	for item in $ITEMS; do
		echo "<li><a href=\"$item/index.html\">$item</a></li>" >> index.html
	done
	echo "</ul>" >> index.html
}

UPDATED_ITEMS="\t"

# build pages
git checkout master
for item in $ITEMS; do
	echo building $item
	make $item > /dev/null
	[ $? -ne 0 ] && exit 1
done

# commit pages to gh-pages branch
git checkout gh-pages
if [ $? -ne 0 ]; then
	echo "failed to switch to gh-pages"
	exit 1
fi
git rm -rf . >& /dev/null
for item in $ITEMS; do
	publish_$item && git add $item >& /dev/null
	if [ $? -eq 0 ]; then
		echo "successfully updated $item"
		UPDATED_ITEMS="${UPDATED_ITEMS}${item}\n\t"
	else
		echo "ERROR: failed to update $item"
	fi
done

DATE=`date '+%Y-%m-%d %H:%M:%S'`
LOG="Update on $DATE.\n\nupdated items:\n$UPDATED_ITEMS"
LOG=`echo -e "$LOG"`

generate_index && git add index.html
touch .nojekyll
git add .nojekyll
git commit -m "$LOG"

# push to remote
read -p "push to remote? [y/N]: " reply
if [ "$reply" != "y" ]; then
	echo "not pushing to remote"
else
	echo "pushing to remote"
	git push --force
fi

git checkout master
