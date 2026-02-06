import java.util.Date;
import processing.video.*;

Movie m;
float mLgth;
float maxCutIntervalSet = 8;
float interval, nInterval, mPoint, minTresh, maxInter, interPoint,
intSpeed,
mDur;
boolean nP = true;
int interCount;
int curIntCount;
PGraphics res;
int totalRefVideos = 60; // numero de videos na pasta

int curVidInd;
String id = nf(year()) + nf(month()) +nf(day()) +nf(hour()) + nf(minute()) + nf(second()) + nf(second());

String [] cutsData;
String nCutData;
PImage curFrame , curVid;
float curVidWdth, curVidHght, curVidResProportion, htScaleProp;

String[] filenames = listFileNames("C:/Users/1511 IRON/Documents/Processing/randomVideoEditor1/data/reference");
PrintWriter output;

void setup(){
  size(1280, 720);
  output = createWriter("positions.txt"); 
  ArrayList<File> allFiles = listFilesRecursive("C:/Users/1511 IRON/Documents/Processing/randomVideoEditor1/data/reference");

  for (File f : allFiles) {
    output.print("Name: " + f.getName());
    output.print("Full path: " + f.getAbsolutePath());
    output.print("Is directory: " + f.isDirectory());
    output.print("Size: " + f.length());
    String lastModified = new Date(f.lastModified()).toString();
    output.print("Last Modified: " + lastModified);
    output.print("-----------------------");
  }
  
  output.flush();
  output.close();
  
  filenames = listFileNames("C:/Users/1511 IRON/Documents/Processing/randomVideoEditor1/data/reference");
  
  m = new Movie(this,   "reference/" + filenames[curVidInd] );
  
  m.loop(); //<>//
  m.read();
  //size(m.width, m.height, JAVA2D);
  //PImage tst = m.get();
  res = createGraphics(width, height);
  //mDur = m.duration();
  cutsData = new String [0];
  nCutData = "maxDur = "+ mDur;
  cutsData = append(cutsData, nCutData);

}

void draw(){
  if(nP){
    //minTresh = random(3, 10);
   //m.stop();
   curIntCount = 0;
   curVidInd += 1;
   m.stop();
   //m = new Movie(this, curVidInd + ".mp4");
   m = new Movie(this,  "reference/" + filenames[curVidInd]); //<>//
   m.loop();
   m.read();
   mPoint = random(m.duration() - 5);
   maxInter = m.duration() - mPoint;
   if(maxInter > maxCutIntervalSet){
     interval = random(maxCutIntervalSet);
   } else {
     interval = random(maxInter);
   }
   
   nP = false;
   spdSet();
   interPoint = mPoint + interval;
   m.jump(mPoint);
   m.loop(); //necessário aqui pra que o programa funcione.
   m.speed(intSpeed);
   interCount += 1;
   
   curVid = m.get();
   curVidWdth = curVid.width;
   curVidHght = curVid.height;
   curVidResProportion = curVidWdth/curVidHght;
   htScaleProp = height/curVidHght;
   //nCutData = "cutN: " + interCount + "cutPoint: "+ mPoint + "realcutPoint: "+ m.time() ;
   //cutsData = append(cutsData, nCutData);
   //println(interCount);
  } else {
    if(intSpeed >0){
      if(m.time() >= interPoint || curIntCount >= interval*60){
        nP = true;
        mPoint = 0;
        maxInter = 0;
        interPoint = 0;
      }
    } else {
      if(m.time() <= interPoint || curIntCount >= interval*60){
        nP = true;
        mPoint = 0;
        maxInter = 0;
        interPoint = 0;
        intSpeed = 0;
      }
    }
  }
  curIntCount += 1;
  if(curVidResProportion < 1.8 && curVidResProportion > 1.6){
  
  res.beginDraw();
  res.image(m, 0,0, width, height);
  res.endDraw();
  res.save("data/frames/" +id+ "/frame"+frameCount+".jpg");
  
  } else {
    
  curFrame = m.get();
  
  curFrame.resize(round(curVidWdth * htScaleProp), round(curVidHght * htScaleProp));
  
  
  res.beginDraw();
  res.pushMatrix();
  res.translate(width/2, height/2);
  
  res.image(curFrame, -curFrame.width/2,-curFrame.height/2);
  res.popMatrix();
  res.endDraw();
  res.save("data/frames/" +id+ "/frame"+frameCount+".jpg");
    
  }
  
  if(frameCount >= 60*60){
    exit();
    println("done");
  }
  /*if(keyPressed){
    
    saveStrings(id+"data.txt", cutsData);
    
    exit();
    println("done");
  }*/
}

void spdSet(){
  float spdDir;
  spdDir = random(-1,1);
  
  if(spdDir >= 0){
    intSpeed = random(0.25,3);
  } else {
    intSpeed = random(-0.25,-3);
  }
}

void movieEvent(Movie m) {
  m.read();
}

/*@ Override void exit() {
  for (Movie m : movies)  m.stop();
  super.exit();
}
*/

String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}

ArrayList<File> listFilesRecursive(String dir) {
  ArrayList<File> fileList = new ArrayList<File>(); 
  recurseDir(fileList, dir);
  return fileList;
}

void recurseDir(ArrayList<File> a, String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    // If you want to include directories in the list
    a.add(file);  
    File[] subfiles = file.listFiles();
    for (int i = 0; i < subfiles.length; i++) {
      // Call this function on all files in this directory
      recurseDir(a, subfiles[i].getAbsolutePath());
    }
  } else {
    a.add(file);
  }
}
  
  
