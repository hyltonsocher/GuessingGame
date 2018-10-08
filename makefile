all: README.md 

README.md: guessinggame.sh
	echo "# The Unix Workbench - Guessing Game Project" > README.md
	echo "## This makefile was run at..." >> README.md
	date  >> README.md
	echo "## The guessinggame.sh script contains the following number of lines:" >> README.md
	wc -l guessinggame.sh | egrep -o "[0-9]+" >> README.md

