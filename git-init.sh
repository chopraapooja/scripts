#!/bin/bash

# Ask for project name
echo "What is the name of project ?"
read projectname

# Creating dir
mkdir $projectname

# Git init
git init $projectname

# Creating README
echo "# $projectname #" > $projectname/README.md

# Creating .gitignore
touch $projectname/.gitignore

# Git args 
gitargs="--git-dir=./$projectname/.git --work-tree=./$projectname"

# Initial commit
git $gitargs add .
git $gitargs commit -m "Initializing git"

# Push to remote
echo "Do you want to push to remote [y/n] ?"
read answer
case $answer in
	y ) 
		echo "Enter github-username [chopraapooja] :"
	    	read username
	    	username=${username:-chopraapooja}
		echo "Pushing to https://github.com/$username/$projectname.git ..."
		git $gitargs remote add origin https://github.com/$username/$projectname.git
		git $gitargs push -u origin master
		;;
	n ) 	
		echo Done
esac
