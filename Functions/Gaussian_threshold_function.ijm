/* Gaussian threshold
 * Nicolás De Francesco, Feb 2019
 * nicolasdefrancesco@gmail.com - image.sc: @NicoDF - github:@NicoDF
 * 
 * This function fits a Gaussian to the histogram and uses its
 * mean and standard deviation (times a factor) to set a threshold.
 * 
 * 
 * It works on images dominated by a background distribution, with a 
 * small percentage of pixels standing out. If a ROI is already defined, 
 * the histogram only includes pixels inside of it.
 * 
 * It works on 8-bit, 16-bit, RGB (24bit) and 32-bit images.
 * 
 * The factor can be negative, which might be used in brightfield images.
 * 
 * options(separated by spaces):
 * 		plot: plots the fitting function
 * 		bins=NN: sets the number of bins to NN (default is 64)
 * 		params: returns an array instead of a single value: {threshold, mean, SD, r2} 
 */

function setGaussianThreshold(sdfactor, options) {
	// Fits a Gaussian to the image histogram and uses its mean and standard deviation
	// (multiplied by sdfactor) to set a threshold, which is also returned.
	// options (separated by spaces): plot, bins=NN (default 64), params
	
	options=split(options, " ");
 	doPlot=false;
 	nBins=64;
 	params=false;
 	
 	for (i=0; i<options.length; i++){
 		if(options[i]=="plot") doPlot=true;
 		if(options[i]=="params") params=true;
 		else if (startsWith(options[i], "bins=")) nBins=parseInt(substring(options[i], 5));	
 		}
 	
	getHistogram(values, counts, nBins);
	Fit.doFit("Gaussian", values, counts);
	
	meanBkg=Fit.p(2);
	sdBkg=Fit.p(3);	
	r2=Fit.rSquared();
	
	thres=meanBkg+sdfactor*sdBkg;
	setThreshold(thres, 1e30);
	
	if(doPlot) Fit.plot;

	if(params) {
		return newArray(thres, meanBkg, sdBkg, r2);
		}
	else {
		return thres;
		}		
 	}
