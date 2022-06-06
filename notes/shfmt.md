# How To Format Shell Programs Using Shfmt In Linux

from

https://ostechnix.com/how-to-format-shell-programs-using-shfmt-in-linux/


## 1. Introduction

If you are from a programming background, you may know the terms such as formatting, linting, etc.

There are important supporting tools that comes with every code editor for making our life easy while we code.

Similarly, for shell scripts, we have **shfmt**. shfmt is used to format, parse and interpret your shell scripts. Shfmt supports Bash, mksh, and Posix shells.

Shfmt is highly configurable and can format your code in several fashion and conventions.

You can install and use Shfmt tool from command line to work with your shell scripts. Also there are plugins available in popular text editors that will use shfmt to format your shell scripts.

## 2. Install Shfmt in Linux

Shfmt is available as snap application. If your distribution has snap installed, you can install shfmt using command:

$ sudo snap install shfmt

The another way to install Shfmt is by using the following one-liner command:

$ curl -sS https://webinstall.dev/shfmt | bash

The above two methods can be used irrespective of what distribution you are running. There are a few distributions where you can install shfmt from their package repositories.

To Install shfmt in Alpine Linux, run:

$ sudo apk add shfmt

Install shfmt in Arch Linux, EndeavourOS and Manjaro Linux:

$ sudo pacman -S shfmt

Install shfmt in FreeBSD.

$ sudo pkg install devel/shfmt

$ sudo pkg install shfmt

## 3. Format shell programs using Shfmt in Linux

If this is the first time you use Shfmt, start by running the `help` command to get an idea of what options shfmt supports:

$ shfmt --help

Now, allow me to show you an example. I have created a shell script with no proper formatting.

 [![Sample script](https://ostechnix.com/wp-content/uploads/2021/07/Sample-script.png)](https://ostechnix.com/wp-content/uploads/2021/07/Sample-script.png) 

Sample script

Take a look at the above image. It looks weird, right?

Let us format this script using `shfmt` like below:

$ shfmt dummy.sh

Shfmt will start to format the given script.

Here is the output of the above script before and after the optimization:

 [![Format shell programs using shfmt](https://ostechnix.com/wp-content/uploads/2021/07/Format-shell-programs-using-shfmt.png)](https://ostechnix.com/wp-content/uploads/2021/07/Format-shell-programs-using-shfmt.png) 

Format shell programs using shfmt

From the above output, you can see our script is nicely formatted.

You may wonder why the indentation is set to **tab**. This is default and modifiable.

### 3.1. Custom Indentation

I always follow **[google shell script style docs](https://google.github.io/styleguide/shellguide.html#indentation)** and set the indentation to **2 spaces** instead of tabs.

To set custom indentation use `-i` flag. Let's see what the help menu has to say about this `-i` flag:

 [![Custom indentation using shfmt](https://ostechnix.com/wp-content/uploads/2021/07/Custom-indentation-using-shfmt.png)](https://ostechnix.com/wp-content/uploads/2021/07/Custom-indentation-using-shfmt.png) 

Custom indentation using shfmt

Any value greater than zero is passed with `-i` flag is the amount of spaces that will be used to intend.

$ shfmt -i 2 scriptname.sh

 [![Set indentation using shfmt](https://ostechnix.com/wp-content/uploads/2021/07/Set-indentation-using-shfmt.png)](https://ostechnix.com/wp-content/uploads/2021/07/Set-indentation-using-shfmt.png) 

Set indentation using shfmt

### 3.2. Diff style output

If you need information on what exactly has been formatted you can use `-d` flag. Take a look at the below image, it shows what is formatted in green color with **`+`** symbol.

 [![Diff style output](https://ostechnix.com/wp-content/uploads/2021/07/Diff-style-output.png)](https://ostechnix.com/wp-content/uploads/2021/07/Diff-style-output.png) 

Diff style output

### 3.3. List scripts to be formatted

You can use the `-l` flag which will get the list of scripts that needs to be formatted.

To demonstrate this, I am going to create three script files. I left the second and third scripts unformatted. And I have given a lot of space in the `echo` statement of the 2nd and 3rd files.

 [![Input scripts](https://ostechnix.com/wp-content/uploads/2021/07/Input-scripts.png)](https://ostechnix.com/wp-content/uploads/2021/07/Input-scripts.png) 

Input scripts

Now if I run the shfmt command with the `-l` flag, it should pick my second sample 2 and 3 files only:

**$ shfmt -l sample*.sh**
sample2.sh
sample3.sh

 [![List of scripts to be formatted](https://ostechnix.com/wp-content/uploads/2021/07/List-of-scripts-to-be-formatted.png)](https://ostechnix.com/wp-content/uploads/2021/07/List-of-scripts-to-be-formatted.png) 

List of scripts to be formatted

### 3.4. Write output to file

By default, Shfmt writes the output of the formatted script to stdout, which is the terminal. If you wish to write the output to a file, you can use `-w` flag.

$ shfmt -w scriptname.sh

### 3.5. Find shell scripts in the path

With `-f` flag, shfmt will scan the given directory recursively and will find all the shell scripts.

It doesn't matter whether a script has the extension `.sh` or not. Shfmt can recognize all the shell scripts even if they don't have extensions.

**$ shfmt -f /home/ostechnix**
/home/ostechnix/.config/envman/load.sh
/home/ostechnix/.local/bin/webi
/home/ostechnix/Downloads/sampleshell
/home/ostechnix/dummy.sh

### 3.6. Shfmt can detect errors too

Shfmt is not just for formatting shell scripts. It can also spot the errors in the scripts too.

Take a look at the below image, where my braces to terminate the function are missing and shfmt spots it.

 [![Shfmt can detect syntax errors in scripts](https://ostechnix.com/wp-content/uploads/2021/07/Shfmt-can-detect-syntax-errors-in-scripts.png)](https://ostechnix.com/wp-content/uploads/2021/07/Shfmt-can-detect-syntax-errors-in-scripts.png) 

Shfmt can detect syntax errors in scripts

You can also use the bash built-in syntax check feature by using `-n` flag which will validate your code and  
list all the errors.

$ bash -vn scriptname.sh

### 3.7. Shfmt in external editors

In real-time, you can any one of the text editors of your choice such as Vim, Atom, Sublime Text, Vs code, etc. Some of these text editors might have native support to format bash scripts.

Each code editor has a plugin that integrates with shfmt. Go to the GitHub official repository (link given at the end) and at the bottom of the page, you will see the list of plugins for each text editor that uses shfmt underneath.

## Conclusion

In this guide, we have seen what is Shfmt and how to format Shell programs using Smfmt with practical examples. Shfmt will be a very useful tool to keep your scripts clean, neat, and organized. Integrate with text editors and you will have a very smooth workflow in creating the scripts.