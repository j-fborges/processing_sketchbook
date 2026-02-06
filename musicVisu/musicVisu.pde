var sound, fft, amplitude, r = 130, dr = 70;

function preload(){ 
  sound = loadSound('Maari.mp3');
} 

function setup(){
  createCanvas(400,400); 
  fft = new p5.FFT();
  fft.setInput(sound);
  sound.play();
  amplitude = new p5.Amplitude();
  amplitude.setInput(sound);
}
 
function draw(){
  background(50,30);
  translate(width/2,height/2);  
  let waveform = fft.waveform();
  fill(255,80);
  ellipse(0,0,150*amplitude.getLevel(),150*amplitude.getLevel());
  noFill();
  beginShape();
  stroke(255,100); // waveform is red
  strokeWeight(1);
  for (let i = 0; i< waveform.length; i+=15){
    let ang = i*360/waveform.length;
    let x = (r)*cos(radians(ang));
    let y = (r)*sin(radians(ang));
    let a = map( waveform[i], -1, 1, r-dr, r+dr)*cos(radians(ang));// ;
    let b = map( waveform[i], -1, 1, r-dr, r+dr)*sin(radians(ang));// ;
    vertex(a,b);
    push();
    strokeWeight(1);
    stroke(255,100);
    line(x, y, a, b);
    pop();
    push();
    stroke(255);
    strokeWeight(2);
    point(a, b);
    pop();
  }
  endShape();  
}

function mousePressed(){
  if(!sound.isPlaying())sound.play();
}
