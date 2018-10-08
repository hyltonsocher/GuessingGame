echo "Welcome to the Guessing Game..."
number_found=0
directory_count=0
filecount=0

# FUNCTION - Find number of directories
function count_directories {
dir_ct=0;
for FILE in `ls -l`
do
    if test -d $FILE
    then
      let dir_ct=$dir_ct+1
    fi
done
echo $dir_ct
}

# Count how many files and directories there are in the current directory 
filecount=$(ls | wc -l)
directory_count=$(count_directories) # Calling the function

# Pure File Count - subtract the directory count if there are any directories listed
let filecount-=$directory_count

# MAIN WHILE LOOP #####################################################
while [[ number_found -eq 0 ]] 
do
echo -e "\nHow many files do you thing there are in the current directory?..."
read response
echo -e "\nYou guessed >>> $response"

# Figure out if the guess was correct using an IF ELSE conditional ###
if [[ $response -ne $filecount ]]
then
	if [[ $response -gt $filecount ]]
	then
		echo "Incorrect, that number is too HIGH, please try again..."
	else
		echo "Incorrect, that number is too LOW, please try again..."
	fi
else
	echo "Correct! Well Done."
	# Terminate the WHILE loop
	number_found=1
fi
done

