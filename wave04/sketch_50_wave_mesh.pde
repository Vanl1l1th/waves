import nervoussystem.obj.*;
int cv=50; int cu=50; 
float minv=-300; float maxv=300;
float minu=-300; float maxu=300;
boolean record=false;
PVector[][] points = new PVector[cv+1][cu+1];
int angle=0;
void setup(){
 background(0);
 fill(255);
 lights();
 strokeWeight(1);
 size(800,800,P3D); 
 for(int iv=0; iv<=cv;iv++){
 for(int iu=0; iu<=cu;iu++){
  float v= map(iv,0,cv,minv,maxv);
  float u=map(iu,0,cu,minu,maxu);
  
  points[iv][iu]=new PVector();
  points[iv][iu].x=v;
  points[iv][iu].y=u;
  points[iv][iu].z=30*(cos(u)*cos(v));
 }
 }
}
void draw(){
  //scale(20);
 // beginRecord("nervoussystem.obj.OBJExport","01.obj");
 background(255);
 //rotateX(PI/3);
 pushMatrix();
 //rotateY(radians(35));
 for(int iv=0;iv<cv;iv++){
  beginShape(QUAD_STRIP);
  for(int iu=0;iu<=cu;iu++){
    //translate(100,0);
   vertex(400+points[iv][iu].x,points[iv][iu].y+400,points[iv][iu].z);
   vertex(400+points[iv+1][iu].x,points[iv+1][iu].y+400,points[iv+1][iu].z); 
  }
  endShape(); 
 } if(record&&frameCount%3==0){saveFrame("wave_"+frameCount);}
 popMatrix(); //endRecord();
 animation();
}
void animation(){
 for(int iv=0; iv<=cv;iv++){
 for(int iu=0; iu<=cu;iu++){
  float v= map(iv,0,cv,minv,maxv);
  float u=map(iu,0,cu,minu,maxu); 
  points[iv][iu].z=30*(cos(u+radians(angle))*cos(v+radians(angle)));
 }}
 angle++;
}
void keyPressed(){
 if(key=='2'){
 record=true;}
}