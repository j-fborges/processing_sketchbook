PImage quadros;
int SpriteSheetWidth  = 1296;
int SpriteSheetHeight = 288;

int frameWidth  = 72;
int frameHeight = 72;

int currentFrame;

int animationFPS = 30;
float msToChangeJoeFrame = 33.3333333; 
float timeSinceLastDraw;
int lastMillis;


void setup(){
 size(2000,1000);
 quadros = loadImage("JoeSpritesheet.png");
 currentFrame = 0;
 lastMillis = millis();
}

void draw(){
  background(0);
  
  
  image(quadros.get(currentFrame*frameWidth, 0,
      frameWidth, frameHeight), mouseX, mouseY);
      
      timeSinceLastDraw = millis() - lastMillis;
      msToChangeJoeFrame -= timeSinceLastDraw;
      
        if(msToChangeJoeFrame < 0) {
    currentFrame++;
    msToChangeJoeFrame = 1000/animationFPS;
  }
  
    if(currentFrame > 17) {
    currentFrame = 0;
  }
    
  lastMillis = millis();
  
  if(keypressed){
    quadro = quadro +1
  }
}