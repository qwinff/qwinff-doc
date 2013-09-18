#!/bin/bash

ITEMS="""
html
"""

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
git rm -rf . >& /dev/null
for item in $ITEMS; do
	cp -rp _build/$item . && git add $item
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

git commit -m "$LOG"

# push to remote
read -p "push to remote? [y/N]: " reply
if [ "$reply" != "y" ]; then
	echo "not pushing to remote"
else
	echo "pushing to remote"
	git push
fi

git checkout master
