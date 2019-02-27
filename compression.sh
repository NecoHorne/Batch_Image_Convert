#!/usr/bin/env bash

# This Bash script will take all png, jpg jpeg files in a directory and create compressed and webp
# versions in another target directory.
# Keep this script in the root directory
# ARG1 = directory containing the images you want to convert, Path relative to root
# ARG2 = target directory where new files will be added, Path relative to root

#give this script the correct permissions
chmod +x compression.sh
#when script executes the target directory will be the PWD + relative path of target directory
directory=${PWD}/$2
#resize value can be changed
resize=50
#quality value changed by below value
quality=50
echo "target: "${directory}
#go to directory containing the files you would like to convert
cd $1
#compressed files and add to your target directory
echo "Converting .PNG files."
magick mogrify -path ${directory} -adaptive-resize ${resize}% -quality ${quality}% *.PNG
echo "Converting .jpg files"
magick mogrify -path ${directory} -adaptive-resize ${resize}% -quality ${quality}% *.jpg
echo "Converting .JPEG files"
magick mogrify -path ${directory} -adaptive-resize ${resize}% -quality ${quality}% *.JPEG

#also create compressed webp files for all images
echo "Creating webp files from PNG's"
magick mogrify -format WEBP -path ${directory} -quality ${quality}% -define webp:lossless=true *.PNG
echo "Creating webp files from jpg's"
magick mogrify -format WEBP -path ${directory} -quality ${quality}% -define webp:lossless=true *.jpg
echo "Creating webp files from JPEG's"
magick mogrify -format WEBP -path ${directory} -quality ${quality}% -define webp:lossless=true *.JPEG
echo "Complete"

