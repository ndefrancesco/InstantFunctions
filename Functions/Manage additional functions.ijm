/* Functions to manage and document all the additional functions installed
 */

function listFunctions(){
	// Lists additional functions installed, and any docstring lines at the begining
	// of the code block starting with [tab]//[space]
	lines = split(call("ij.macro.Interpreter.getAdditionalFunctions"),"\n");
	isHeader = false;
	for (i = 0; i < lines.length; i++) {
		fnc=lines[i];
		if(startsWith(fnc, "function ")) {
			isHeader=true;
			fnc=substring(fnc, 8, lengthOf(fnc)-1);
			print("> "+fnc);
			}
		else if(startsWith(fnc, "\t// ")  && isHeader){
			print("   |   "+substring(fnc, 4));
			}
		else {
			if(isHeader) print("");
			isHeader=false;
			}
		}
	}

function reloadFunctions(){
	// Reloads all the additional functions. Avoids restarting Fiji after
	// modifiying the code of other functions.
	libraryPath=getDirectory("macros")+"Library.txt";
	if(File.exists(libraryPath)) {
		library= File.openAsString(libraryPath);
		} else {
		library="";	
		}
	call("ij.macro.Interpreter.setAdditionalFunctions", library);
	runMacro("AutoRun/install_custom_functions_folder.ijm")
	}
	