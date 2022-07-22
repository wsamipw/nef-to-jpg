# nef-to-jpg
This tool is designed to apply few enahncements using convert command from ImageMagick and convert the provided NEF (camera raw files) to JPG format.

# Pre-configuration
This script depends on following packages
- Image Magick `sudo apt install graphicsmagick-imagemagick-compat`
- dcraw `sudo apt install dcraw`
- cjpeg `sudo apt install libjpeg-turbo-progs`


After installing the packages modify this file

`/etc/ImageMagick-6/delegates.xml`

search for this line

`<delegate decode="dng:decode" command=""ufraw-batch" --silent --create-id=also --out-type=png --out-depth=16 "--output=%u.png" "%i""/>`

Find the path to cjpeg using

`which cjpeg`

Change it to

`<delegate decode="dng:decode" command=""dcraw" -c -q 3 -H 5 -w "%i" | "<PATH_TO_CJPEG" -quality 100 > "%o""/>`

# Commands:
	
	--help		Shows help.
	
	--convert	Convert NEF files to JPG and apply enhancements.

Copy this script file in the location of the raw files and simply run the script.

Example: `$ ./enhance.sh --convert`

Note: Before running this script, you may need to make this script file executable.
`$ chmod +x enhance.sh`
