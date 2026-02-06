/*
 * Author: Marcos Moritz
 * Preset filters in processing
 * See documentation in https://processing.org/reference/filter_.html
 *
*/

PImage geranios;
int filter = 0;
String filterName = "No filter";


void setup(){
		size(600, 317);
		geranios = loadImage("geranios.jpg");
		image(geranios, 0, 0);
		fill(0, 0, 255);
}

void draw(){
		if (frameCount % 120 == 0) {
				filter++;
				filter = filter % 9;
				//filter = floor(random(0, 8));
		}

		image(geranios, 0, 0);
		applyFilter();
		textAlign(CENTER);
		textSize(32);
		text(filterName, width/2, height/2);
}

class Filter {
		int id;
		int frames;
		String name;
}

void applyFilter(){
		switch(filter) {
		case 0:
				// no filter
				break;
		case 1:
				filter(THRESHOLD);
				filterName = "THRESHOLD";
				break;
		case 2:
				filter(GRAY);
				filterName = "GRAY";
				break;
		case 3:
				filter(OPAQUE);
				filterName = "OPAQUE";
				break;
		case 4:
				filter(INVERT);
				filterName = "INVERT";
				break;
		case 5:
				filter(POSTERIZE, 30);
				filterName = "POSTERIZE";
				break;
		case 6:
				filter(BLUR);
				filterName = "BLUR";
				break;
		case 7:
				filter(ERODE);
				filterName = "ERODE";
				break;
		case 8:
				filter(DILATE);
				filterName = "DILATE";
				break;
		default:
				filterName = "No Filter";
				break;
		}
}