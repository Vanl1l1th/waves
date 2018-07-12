// Sine Wave
// Daniel Shiffman <http://www.shiffman.net>
import nervoussystem.obj.*;

// Two wave objects
Wave wave0;
Wave wave1;
int a2=0;
int dy=10;
boolean record=false;
boolean record2=false;
float x1=40; float x2=40; float x3=40; float x4=40;
void setup() {
  size(1250,800,P3D);
  smooth();
  lights();
  //directionalLight(51, 102, 126,-1,0,0);
//spotLight(255,255,255,450,0,0,0,1,0,PI/2,600);
 //camera();
//directionalLight(255,255,255,0.3,0.3,0.4);
  // Initialize a wave with starting point, width, amplitude, and period
  wave0 = new Wave(new PVector(0,0),-40,100,600);//upper curve (pos,spacing,amp,per)
  
 // wave1 = new Wave(new PVector(150,250),300,20,100);

}

void draw() {
  background(0);
  //ellipse(x1,dy,10,10);
  //ellipse(x2,dy+20,10,10);
  //ellipse(x3,dy+40,10,10);
  if(frameCount%5==0&&record){beginRecord("nervoussystem.obj.OBJExport", "wave_"+frameCount+".obj");}
 //room();
  // Update and display waves
  wave0.calculate();
  pushMatrix();
  
  translate(200,1200,-600);
  rotate(PI/2);
  //rotateX(PI/2);
  wave0.display();
  popMatrix();
 // wave1.calculate();
 // wave1.display();
if(frameCount%5==0&&record){endRecord();}
if(frameCount%4==0&&record2){saveFrame("wave_"+frameCount);}
//if(frameCount%5==0){saveFrame("wave_an"+frameCount);}
//if(frameCount==400){exit();}
}
void room(){
  pushMatrix();
  translate(500,150,-200);
  //rotateX(0.5);
  rotateY(PI/2);
  stroke(0);
  //fill(100);
  box(500,600,10);
  popMatrix(); 
  pushMatrix();
  translate(500,30);
  box(300,10,300);
  popMatrix();
  pushMatrix();
  translate(400,250,-7);
  box(500,500,10);
  popMatrix();
  
}
void mouseDragged(){
 wave0.manipulate(x1,x2,x3/10);
 if(abs(mouseX-x1)<10&&abs(mouseY-dy)<10){x1=mouseX;}
 if(abs(mouseX-x2)<10&&abs(mouseY-(dy+20))<10){x2=mouseX;}
 if(abs(mouseX-x3)<10&&abs(mouseY-(dy+40))<10){x3=mouseX;}
}

void keyPressed(){
 if(key=='3'){record=true;} 
 if(key=='2'){record2=true;}
}