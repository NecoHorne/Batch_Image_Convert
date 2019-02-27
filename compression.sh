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
resize=80
quality=30
webpQ=50
cd $1
#compressed files and add to your target directory
echo "Converting .PNG files."
magick mogrify -path ${directory} -adaptive-resize ${resize}% -filter Triangle -define filter:support=2 -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -quality ${quality}% -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB -strip *.PNG
echo "Converting .jpg files"
magick mogrify -path ${directory} -adaptive-resize ${resize}% -filter Triangle -define filter:support=2 -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -quality ${quality}% -define jpeg:fancy-upsampling=off -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB -strip *.jpg
echo "Converting .JPEG files"
magick mogrify -path ${directory} -adaptive-resize ${resize}% -filter Triangle -define filter:support=2 -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -quality ${quality}% -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB -strip *.JPEG

cd
cd ${directory}
#also create compressed webp files for all images
echo "Creating webp files from PNG's"
magick mogrify -format WEBP -path ${directory} -quality ${webpQ}% -define webp:lossless=true *.PNG
echo "Creating webp files from jpg's"
magick mogrify -format WEBP -path ${directory} -quality ${webpQ}% -define webp:lossless=true *.jpg
echo "Creating webp files from JPEG's"
magick mogrify -format WEBP -path ${directory} -quality ${webpQ}% -define webp:lossless=true *.JPEG
echo "Complete"

