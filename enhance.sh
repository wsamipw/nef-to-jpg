#!/bin/bash

#program to appy few enhancements to raw (NEF) and convert/compress them to jpg format.

#Copyright, 2022. Samip Subedi (samip@techkunja.com.np)

# Convert function
enhancer() {
	SECONDS=0
	echo "Enhance v1.0.0"
	files=$(find *.NEF -maxdepth 1)
	count=$(find *.NEF -maxdepth 1 | wc -l)
	echo "Found ${count} files."
	if [ $count -ge 1 ]
	then
		for file in $files; do
			echo "Converting $file"
			convert -enhance -normalize "$file" "${file%.NEF}.jpg"
		done
	else
		echo "There are no NEF files in this directory."
	fi
	duration=$SECONDS
	echo "Done in $(($duration / 3600)) hours, $(($duration / 60)) minutes and $(($duration % 60)) seconds."
}

# Help function
enhance-help(){
cat << _EOF_
This tool is designed to apply few enahncements using convert command from ImageMagick and convert the provided NEF (camera raw files) to JPG format.

Commands:
	--help	Shows help.
	--convert	Convert NEF files to JPG and apply enhancements.

Copy this script file in the location of the raw files and simply run the script.

Example: $ ./enhance.sh --convert

Note: Before running this script, you may need to make this script file executable.
$ chmod +x enhance.sh

Copyright(r) 2022, Samip Subedi (samip@techkunja.com.np)

_EOF_
}


# Start of program execution
if [ ${1} ]; then
	if [ ${1} == "--help" ]; then
		enhance-help
		exit

	elif [ ${1} == "--convert" ]; then
        	enhancer
		exit

	else
		echo "Invalid argument passed. Try --help for more info."
		exit 1
	fi
else
	echo "No argument passed. Try --help for more info."
        exit 1
fi
exit
