#!/usr/bin/env fish
#

# reset - commit your changes or stash them before you merge
# git reset --hard - ArcoLinux alias - grh

# reset - go back one commit - all is lost
# git reset --hard HEAD~1

# remove a file online but keep it locally
# https://www.baeldung.com/ops/git-remove-file-without-deleting-it
# git rm --cached file.txt


# checking if I have the latest files from github
echo "Checking for newer files online first"
git pull

set workdir $(pwd)

# Below command will backup everything inside the project folder
git add --all .

# Give a comment to the commit if you want
echo "####################################"
echo "Write your commit comment!"
echo "####################################"

read input

# Committing to the local repository with a message containing the time details and commit text

git commit -m "$input"

# Push the local files to github

if grep -q main .git/config
	echo "Using main"
		git push -u origin main
end

if grep -q master .git/config
	echo "Using master"
		git push -u origin master
end

# force the matter
# git push -u origin master --force

echo
tput setaf 6
echo "######################################################"
echo "###################  $(basename $workdir) done."
echo "######################################################"
tput sgr0
echo
