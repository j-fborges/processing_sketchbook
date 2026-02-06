//fazer um programa com um walker que é a média de duas particulas aleatórias

Walker w1;
Particle p1,p2, p3;

float aspx, aspy, asvx, asvy, acpx, acpy;

float limit;
int fn, fnRecord, fnLimit;
int tryIndex;
boolean registered;
Table params, paramsDecoy;
void setup(){
  size(2000, 1000);
  background(255);
  frameRate(60*4);
  
  paramsDecoy = loadTable("params.csv", "header");
  if(paramsDecoy != null){
  loadData();
  } else {
  params = new Table();
  
  params.addColumn("tryIndex");
  params.addColumn("frameNumberLimit");
  params.addColumn("frameNumberRecord");
  params.addColumn("pivotX");
  params.addColumn("pivotY");
  params.addColumn("sateliteX");
  params.addColumn("sateliteY");
  params.addColumn("sateliteVelX");
  params.addColumn("sateliteVelY");
  
  saveTable(params, "data/params.csv");
  }
  fn = 0;
  w1 = new Walker();
  
  p1 = new Particle();
  p2 = new Particle();
  acpx = width/2;
  acpy = height/2;
  p1.init(acpx, acpy);
  
  aspx = width/2 + 200;
  aspy = height/2 +0;
  
  p2.init(aspx,aspy);
  
  w1.init();
  
  
  p1.mass = 5000;
  p1.sz = 1;
  p2.mass = 100;
  p2.sz = 10;
  
  asvx = p2.vel.x = 1;
  asvy = p2.vel.y = -5;
  //setLength(p2.vel, 10);
  //setAngle(p2.vel, -PI/2);
  fnLimit =2641;
  registered = true;
}

void draw(){
  //background(255);
  //println( frameCount );
  
  if(p2.pos.x < width && p2.pos.x > 0 && p2.pos.y > 0 && p2.pos.y < height && registered == true){
    fn +=1;
    p1.update();
  p2.update();
 
  p2.gravitateTo2(p1);
  p1.display();
  p2.display();
  } else {
    //println("ok");
   fnRecord =fn;
   registered = false;
  }
  
  
  //println(getMag(p2.pos));
  
  
  
  if(registered == false){
    if(fnRecord >= fnLimit){
      TableRow newRow = params.addRow();
      
      newRow.setInt("tryIndex" , params.lastRowIndex());
      newRow.setInt("frameNumberRecord", fnLimit);
      newRow.setFloat("pivotX", acpx);
      newRow.setFloat("pivotY", acpy);
      newRow.setFloat("sateliteX", aspx);
      newRow.setFloat("sateliteY", aspy);
      newRow.setFloat("sateliteVelX", asvx);
      newRow.setFloat("sateliteVelY", asvy);
      
      saveTable(params, "data/params.csv");
          if(fnRecord > fnLimit){
        fnLimit = fnRecord;
      }
 }
     restart();
    
  }
  
  
}

void keyPressed(){
  if(key == 'q' || key == 'Q'){
    //background(255);
    fn = 0;
    
    acpx = width/2;
    acpy = height/2;
    p1.init(acpx, acpy);
    
    aspx = random((width/2)- (width/8), width/2 + (width/8));
    aspy = random((height/2) - (width/8), (height/2)+ (width/8));
  
    p2.init(aspx,aspy);
    
    asvx = p2.vel.x = random(-2,2);
    asvy = p2.vel.y = random(-2,2);
    println(aspx + " || " + aspy);
  }
}

void restart(){
  println( frameCount );
  //background(255);
    fn = 0;
    fnRecord = 0;
    
    acpx = width/2;
    acpy = height/2;
    p1.init(acpx, acpy);
    
    aspx = random((width/2)- (width/8), width/2 + (width/8));
    aspy = random((height/2) - (width/8), (height/2)+ (width/8));
  
    p2.init(aspx,aspy);
    
    asvx = p2.vel.x = random(-2,2);
    asvy = p2.vel.y = random(-2,2);
    registered = true;
}

void loadData(){
  params = loadTable("params.csv", "header");
  TableRow row;
  row = params.getRow(params.lastRowIndex());
  if(params.lastRowIndex() <= 0) { fnLimit = 2641; } else {
  fnLimit = row.getInt("frameNumberRecord");
  }
}
