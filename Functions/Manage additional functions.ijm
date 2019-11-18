/* Auxiliary function to document additional functions installed
 * If the function includes lines starting with [tab]//[space]
 * these lines will also be listed as documentation strings
 * 
 */

function listFunctions(){
	// Lists additional functions installed, and any docstrings
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

	