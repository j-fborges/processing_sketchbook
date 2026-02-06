import processing.sound.*;

String year = nf(year()), month = nf(month()), day = nf(day()), hour = nf(hour()), minute = nf(minute()), second = nf(second());
AudioIn input;
Amplitude rms;

int audioScle;
float audioScleParam = 3.5;

// Declare the sound source and Waveform analyzer variables
SoundFile sample;
Waveform waveform;



// Define how many samples of the Waveform you want to be able to read at once
int samples;
int channels;

  // Load and play a soundfile and loop it.
  
  

  // Create the Waveform analyzer and connect the playing soundfile to it.
  //waveform = new Waveform(this, samples);
  //waveform.input(sample);
  
  //Create an Audio input and grab the 1st channel
    //input = new AudioIn(this, 0);
    
    // start the Audio Input
    //input.start();
    
String [] vals;    
String nVal;    
    
    
void setup(){
  size(0,0);
  sample = new SoundFile(this, "por dentro de um pneu.wav");

  vals = new String [0];
  channels = sample.channels();
  sample.play();
  
  // create a new Amplitude analyzer
    rms = new Amplitude(this);
    
    // Patch the input to an volume analyzer
    rms.input(sample);
    //sample.amp(.7);
    
      audioScle = int( map(rms.analyze(), 0, 2, 0, 300));
}

void draw(){
  if(sample.isPlaying() == true){
  audioScle = int( map(rms.analyze(), 0, 1, 0, 60));
  //audioScle = int( map(rms.analyze(), 0, 3.5, 1, 700));
  nVal = nf(audioScle);
  vals = append(vals, nVal);
  } else {
    saveStrings("values60-1.txt", vals);
    exit();
  }
  
}
