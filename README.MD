# Batch Image Convert Script
This is a simple batch script that utilises ImageMagic to resize and compress image assets also creating a compressed `*.webp` version of the images.
This script was written to easily compress images in a wordpress uploads folder.<br>

Running the script will create a new folder in the root directory called `webReady` that contains a directory structure exactly the same as the original but containing the compressed and webp images.
## Getting Started
Clone or download the repo.
### Prerequisites
1. On a windows machine you will need to have something like git bash installed to run this script. [Git BASH](https://gitforwindows.org/)
2. Ensure git bash is in your PATH variable. 
3. This script utilises [ImageMagick](https://www.imagemagick.org/) so make sure to install it, on the installation window ensure to check the `Install legacy utilities` and `Add application directory to your system path` boxes. [(ImageMagic Repo)](https://github.com/ImageMagick/ImageMagick)

### Using the script
1. Copy the `compression.sh` file and add it to your project root.
2. In your terminal cd to the project root. 
3. The script takes 1 argument2, the relative path from root to the Directory you want to run through and compress all images.

#### Unix command
run `./compression.sh PATH` <br>
example: `./compression.sh uploads`
#### On Windows
run `compression.sh PATH` <br>
example: `compression.sh uploads`

### Changing quality and resize %
if you open the script you can chan%e the variables for resize and quality as needed, the below is so far what I found to work best. 
```
...
resize=80
quality=30
webpQ=50
...
```

### Issues
When using Wordpress plugins to serve the `*.webp` files some issues were found.
#### Fixes:
For this fix you will have to rename all the extensions from .WEBP to .webp or the plugin will not serve the files, (I suspect a regex issue)

On Windows you can cd to the directory containing the webp files and run `ren *.WEBP *.webp` <br>
On unix you you should find the appropriate rename command for your distro. <br>
On wordpress use the [WebP Express](https://wordpress.org/plugins/webp-express) plugin with the below settings. <br>
 
![webpsettings.png](https://pichub.site/images/2019/02/27/webpsettings.png)
![webpsettings2.png](https://pichub.site/images/2019/02/27/webpsettings2.png)
