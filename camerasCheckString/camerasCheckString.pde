import processing.video.*;
String[] cameras = Capture.list();
 
 float camwidth ;
     float camheight ;
 
if (cameras.length == 0) {
  println("There are no cameras available for capture.");
  exit();
} 
else {
  println("Available cameras:");
  for (int i = 0; i < cameras.length; i++) {
    // Search where the fps number is
    int p = cameras[i].indexOf("fps=");
    // Search where the width begins
    int q = cameras[i].indexOf("size=");
    // Search where the width ends and height begins
    int r = cameras[i].indexOf("x");
    // Search where the height ends
    int s = cameras[i].indexOf(",fps");
 
    println("fps= " + cameras[i].substring(p+4));
    // transforms the numeral string into an int
    int fps = Integer.parseInt(cameras[i].substring(p+4));
 
    println("width= " + cameras[i].substring(q+5, r));
    println("height= " + cameras[i].substring(r+1, s));
 
    // test the fps... I'm not overly picky.
    if ( fps > 20) {
      // if the fps is faster than 20, select it as camera height&width!
      camwidth = Integer.parseInt(cameras[i].substring(q+5, r));
     camheight = Integer.parseInt(cameras[i].substring(r+1, s));
    }
    println(cameras[i]);
    saveStrings("nouns.txt", cameras[i]);
  }
}
 
//Capturecam = new Capture(this, camwidth , camheight);
