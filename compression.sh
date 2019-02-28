#!/usr/bin/env bash

# This Bash script will take all png, jpg jpeg files in a directory and create compressed and webp
# versions in another target directory.
# Keep this script in the root directory
# ARG1 = directory containing the images you want to convert, Path relative to root

# give this script the correct permissions
chmod +x compression.sh

# VARIABLES
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'
NC='\033[0m'
root=${PWD}
target=${root}/$1
web="webReady"
directory=${root}/${web}
resize=80
quality=30
webpQ=50
count=0

# Make a copy of the directory in a new directory called webReady relative to root.
printf "${PURPLE}Creating webReady directory...${NC}\n"
cd $1
find . -type d >dirs.txt
mv dirs.txt ${root}
cd
cd ${root}
mkdir ${web}
mv dirs.txt ${web}
cd ${web}
xargs mkdir -p <dirs.txt
rm dirs.txt
printf "${GREEN}Directory Created${NC}\n"

# Go to target Directory and iterate over folders
cd
cd ${target}
printf "${YELLOW}Starting processing, This may take a few minutes depending on how many files are processed${NC}\n"
for file in ${target}/*; do
    for sub in ${file}/* ; do
    cd
    cd ${sub}
    printf "${PURPLE}Processing: ${directory}/$(basename "${file}")/$(basename "${sub}")${NC}\n"
    magick mogrify -path ${directory}/$(basename "${file}")/$(basename "${sub}") -adaptive-resize ${resize}% -filter Triangle -define filter:support=2 -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -quality ${quality}% -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB -strip *.PNG
    magick mogrify -path ${directory}/$(basename "${file}")/$(basename "${sub}") -adaptive-resize ${resize}% -filter Triangle -define filter:support=2 -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -quality ${quality}% -define jpeg:fancy-upsampling=off -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB -strip *.jpg
    magick mogrify -path ${directory}/$(basename "${file}")/$(basename "${sub}") -adaptive-resize ${resize}% -filter Triangle -define filter:support=2 -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -quality ${quality}% -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB -strip *.JPEG
    printf "${GREEN}Creating .webp's for $(basename "${file}")/$(basename "${sub}")${NC}\n"
    magick mogrify -format WEBP -path ${directory}/$(basename "${file}")/$(basename "${sub}") -quality ${webpQ}% -define webp:lossless=true *.jpg
    magick mogrify -format WEBP -path ${directory}/$(basename "${file}")/$(basename "${sub}") -quality ${webpQ}% -define webp:lossless=true *.PNG
    magick mogrify -format WEBP -path ${directory}/$(basename "${file}")/$(basename "${sub}") -quality ${webpQ}% -define webp:lossless=true *.JPEG
    cd
    cd ${target}
    for pic in ${directory}/$(basename "${file}")/$(basename "${sub}")/* ; do
    if [[ ${pic} == *.WEBP ]]; then
        mv -- "${pic}" "${pic%.WEBP}.webp"
    fi
        ((count++))
    done
    done
done
printf "${GREEN}Processing Complete...\n ${count} files created...${NC}\n"
printf "${GREEN}Press Enter to continue...${NC}\n"
read

