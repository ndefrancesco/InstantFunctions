# InstantFunctions
A set of custom [**Fiji**](fiji.sc) IJ1 macro functions including a mechanism to automate their installation.

*This project is currently under development*

## Overview
This function set consists of two components:
* A  _**Functions/**_  folder containing a collection of .ijm files containing one ore more related IJ1 macro functions.
* An _**install_custom_functions_folder.ijm**_ file that sits in Fiji's  _**macros/Autorun/**_ folder, which is executed on startup and loads all the custom functions as additional functions.

The new functions will be available to any script written in the [ImageJ macro language](https://imagej.nih.gov/ij/developer/macro/macros.html). 

Additionally, they will be suggested by the [code autocompletition](https://forum.image.sc/t/auto-code-completion-for-ij-macro/11642) that is already built-in within Fiji's script editor. [Thanks to [@haesleinhuepf](https://github.com/haesleinhuepf)'s efforts] 


## Installation:

To install this set, just download the repository and copy the _**Autorun/**_ and _**Functions/**_ folders -with all the files inside them- into the macro folder of a Fiji installation.

## Usage:

Simply include any of the additional functions in your IJ1 macro code.

There are a couple of helper functions to aid in the usage:

* __`listFunctions()`__: If executed, it will provide a list of the available additional functions inside Fiji's log, along with any doc strings available.

* __`reloadFunctions()`__: this will reload all the functions within the _**Functions/**_ folder without the need to restart Fiji.

These functions can be run from the REPL pane in the script editor (click on the _persistent_ checkbox), or by launching the Script Interpreter in `Plugins > Scripting > Script Interpreter` and choosing *IJ1 Macros* as language in the dropdown list.

You can include your own functions by adding extra .ijm files in the _**Functions/**_ folder. The will be available after restarting Fiji. Optionally, you can execute the custom function `reloadFunctions()`, which will refresh the all custom functions present. This is particularly handy while testing/developping new functions.
If you include new functions, it is recommended to add one or more documentation strings rigth after the function declaration. This doc strings will be shown by the Script editor's autocompletition, and will also be listed when calling `listFunctions()`.

## Distribution:

If you want to share some macro code you made which includes custom functions, you should also distribute _**install_custom_functions_folder.ijm**_, which should be copied inside _**macros/Autorun/**_, and any .ijm files containing the custom functions you used, which should be placed inside _**macros/Functions/**_.
