#! bin/bash # specifies which interpreter

echo "==========================="  # prints out to command line

git config --global user.name ${GITHUB_ACTOR} # to keep track of who is running the action (which user)
git config --global user.email ${INPUT_EMAIL} # same as above but email address
git config --global --add safe.directory /github/workspace # adding to safe list of directories to run git operations

python3 /usr/bin/feed.py

git add -A
git commit -m "Update feed"
git push --set-upstream origin main # make sure upstream branch is setup (new clean machine)

echo "===========================" 