# Batch Image Convert Script
This is a simple batch script that utilises ImageMagic to resize and compress image assets also creating a compressed wepb version of the images. 
## Getting Started
Clone or download the repo.
### Prerequisites
1. On a windows machine you will need to have something like git bash installed to run this script. [Git BASH](https://gitforwindows.org/)
2. Ensure git bash is in your PATH variable. 
3. This script utilises [ImageMagick](https://www.imagemagick.org/) so make sure to install it, on the installation window ensure to check the "Install legacy utilities" and "Add application directory to your system path" boxes

### Using the script
1. Copy the `compression.sh` file and add it to your project root.
2. In your terminal cd to the project root. 
3. The script takes 2 arguments, the relative path from root to the folder that containes the images you would like to conpress and the relative path to the folder that will contain the compressed images.

#### Unix comand
run `./compression.sh <PATH1> <PATH2>`
#### On Windows
run `compression.sh <PATH1> <PATH2>`

### Changing quality and resize %
if you open the script you can chan%e the variables for rezise and quality as needed
```
...
resize=50
...
quality=50
...
```