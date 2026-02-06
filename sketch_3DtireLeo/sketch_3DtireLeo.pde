float a, b, c,s;
float x,y,z, w;
String year = nf(year()), month = nf(month()), day = nf(day()), hour = nf(hour()), minute = nf(minute()), second = nf(second());
PShape tire;


import processing.sound.*;


AudioIn input;
Amplitude rms;

Table radList;
float r1 = 0, rc;
int elpsNum, elpsIndex, elpsH, elpsF, pElpsF;
int [] elpHIndex, sizeOrder;
FloatList radOrder, radGroup;

boolean ordered;
PGraphics animation;
int audioScle;
float audioScleParam = 3.5;

  int ellipseNumber = 20;                  //control
  int rLimit = 700;                        //control

//elps[elps.length-1] -- anchor

 String [] impVals;
 int [] readyVals;
 int audioValIndex;
 int frameIndex;


void setup(){
  size(1920, 1080, P3D);
  //fullScreen(P3D);
  //noFill();
  noStroke();
  //stroke(255);
  //fill(255,255,255,50);
  //perspective(PI,float(width)/float(height), 1000, 1000 );
  tire = loadShape("data/Car_tire_2REALIGN.obj");
  background(255);
  
  
  
  //Create an Audio input and grab the 1st channel
   // input = new AudioIn(this, 0);
    
    // start the Audio Input
    //input.start();
    
    // create a new Amplitude analyzer
    //rms = new Amplitude(this);
    
    // Patch the input to an volume analyzer
    //rms.input(input);
    //input.amp(.7);
    
    readyVals = new int [0];
  impVals = loadStrings("values3DLeo.txt");
  for(int i = 0; i< impVals.length; i++){
    int nVal = int(impVals[i]);
    readyVals = append(readyVals, nVal);
  }
  
}

void draw(){
  
  
  if(keyPressed){
     if(key == 'q'){
      audioScleParam += .1;
    }
    
    if(key == 'a'){
      audioScleParam -= .1;
        if(audioScleParam <= 0){
          audioScleParam = .1;
        }
    } 
  }
  
  //audioScle = int( map(rms.analyze(), 0, audioScleParam, 1, 700));
  
  audioScle=1;
  //audioScle = int( map(rms.analyze(), 0, 2, 1, pframesN));
  if(frameIndex>60*10){
    audioScle = readyVals[audioValIndex];
    
    if(audioValIndex >= readyVals.length-1){
      audioScle=1;
    } else { audioValIndex+=1; }
  }

  a+= .01;
  b+= .001;
  c += .001;
  s += .01;
//background(255);
//lights();
if(mousePressed && mouseButton == RIGHT) {stroke(255); strokeWeight(.5);}else noStroke();
if(mousePressed && mouseButton == LEFT){ x = random(50, 750); y = random(50, 750); z =random(50, 750); w=200;}
if(w>1)w=w*.99;
spotLight(255,255,255,500,2000,450, 500, 500, 500, PI/12,.1);
pointLight(255,255,255,500,1000,350);
//directionalLight(255,255,255,300,500,500);
//shininess(500*sin(s));
//spotLight(200*sin(c), 30, 70, 0,0,-100, 150,150,0, PI, 0);
//spotLight(255,255,255,0,0,-100, 150,150,0, PI, 0);
spotLight(255,255,255,700,600,500, 500,500,500, PI/2, 1);
spotLight(255,255,255,300,600,500, 500,500,500, PI/2, 1);
camera(500 , 450 , 350, 500, 500, 500,  0.0, 1, -1);
       
       //camera(500, 500, 500, 400, 400, 0.0, 0.0, 1, 0.0);
       perspective(PI/(3), ((width*1.05)+((map((.01*audioScle), .2, 1.8,-3000, 3000 ))))/height, ((height/10.0) / tan(PI*60.0/360.0))/10.0, ((height/2.0) / tan(PI*60.0/360.0))*10.0);
        
       
       for(float i = 0; i < 800; i += 40+w){
         for(float j = 0; j < 800; j += 40+w){
           for(float k = 0; k < 800; k += 40+w){
             
           //pushMatrix();
  translate(i, j, k);
  //rotateX(b);
  
  //rotateY(PI/3);
  //box(15*sin(dist(i,j,k,500,500, 500)+a));
  //sphere(30*sin(dist(i,j,k,500,500, 500)+a));
  translate(-i,-j,-k);
  //popMatrix();
  

  
           }
         }
       }
      
       translate(500, 500, 500);
       rotateY(b);
       //scale((lerp(0, 30, (.001*audioScle)+.10)));
       scale((map((.01*audioScle), .2, 1.2,2, 8 )));
       specular(255);
       shininess(1000);
       emissive(255);
       ambient(255);
       shape(tire);
       translate(-500, -500, -500);
      // println("ok");
      // save("data/frames/"+ year + month + day + hour + minute + second+ "/" + year + month + day + hour + minute + "3dSpiral"+frameCount+".jpg");
       //if(keyPressed){
      // save("data/still/"+ year + month + day + hour + minute + second+ "/" + year + month + day + hour + minute + "3dSpiral"+frameCount+".jpg");
      // }
      // if(frameCount >= 60*60){
      //  exit(); 
     //  }
     
    // save("data/renderframes/"+ year + month + day + hour + minute + second+ "/" + year + month + day + hour + minute + "3dTire"+frameCount+".jpg"); //-------
  //println(frameRate);
  
  //text(nf(audioScle), 1000, 700);
  
  frameIndex+=1;
  //if(frameIndex>=5399) exit();
     
     
}
