function sRGB_gamma(value) {
	// Returns the sRGB-compressed version of value(expected value: 0-1)
	if (value<0.0031308) {
		result=12.92*value;}
	else {
		result=1.055*pow(value, 1/2.4)-0.055;
		}
	return result;
	}

function sRGB_gamma_inv(value) {
	// Returns the sRGB-de-compressed version of value(expected value: 0-1)
	if (value<0.04045){
		result=value/12.92;
		} 
	else {
		result=pow((value+0.055)/1.055, 2.4);
		}
	return result;
	}