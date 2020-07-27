import gab.opencv.*;
import processing.video.*;
import java.awt.*;
PImage p1;

import spout.*;

Capture video;
OpenCV opencv;

// DECLARE A SPOUT OBJECT
Spout spout;

void setup() {
  size(640, 480, P3D);//must be added P3D otherwise spout won't work.
  
  textureMode(NORMAL);
  
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  
  p1 = loadImage("rabit.png");
  
  video.start();
  
  // CREATE A NEW SPOUT OBJECT
  spout = new Spout(this);
  spout.createSender("Spout Processing");
}

void draw() {
    background(0, 90, 100);
    noStroke();
    
    // Draw the graphics   
    //spout.sendTexture(p1);
    //image(p1, 0, 0, width, height);
    
    // OPTION 1: SEND THE TEXTURE OF THE DRAWING SURFACE
    // Sends at the size of the window    
  
  
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    image(p1,faces[i].x-20, faces[i].y-10);
    spout.sendTexture();
  }
}

void captureEvent(Capture c) {
  c.read();   
}
