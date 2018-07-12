import nervoussystem.obj.*;
int cv=30; int cu=30; 
float a=100; float b=100; float c=100;
float by=20;
float minv=-a; float maxv=a;
float minu=-b; float maxu=b;
PVector[][] points = new PVector[cv+1][cu+1];
int angle=0;
boolean record2=false; boolean record3=false;
void setup(){
 lights();
 strokeWeight(1);
 size(800,800,P3D); 
 for(int iv=0; iv<=cv;iv++){
 for(int iu=0; iu<=cu;iu++){
  float v= map(iv,0,cv,-800,800);
  float u=map(iu,0,cu,-800,800);
  
  points[iv][iu]=new PVector();
  points[iv][iu].x=c*(cos(u)*cos(v));
  points[iv][iu].y=c*(sin(u)*cos(v));
  points[iv][iu].z=c*(sin(v));
 }
 }
}
void draw(){
   background(255);
 if(record2==false){ ellipse(a,by,10,10);
  ellipse(b,by+30,10,10);
  ellipse(c,by+50,10,10);}
  if(record3==false){noFill();}
if(frameCount%10==0&&record3){beginRecord("nervoussystem.obj.OBJExport",frameCount+".obj");}
 for(int iv=0;iv<cv;iv++){
  beginShape(QUAD_STRIP);
  for(int iu=0;iu<=cu;iu++){
   vertex(400+points[iv][iu].x,points[iv][iu].y+300,points[iv][iu].z);
   vertex(400+points[iv+1][iu].x,points[iv+1][iu].y+300,points[iv+1][iu].z); 
  }
  endShape(); 
 }
 animation2();
 if(frameCount%10==0&&record3){endRecord();}
 if(frameCount%2==0&&record2){saveFrame("gifan_"+frameCount);}
}

void animation2(){
  for(int iv=0; iv<=cv;iv++){
 for(int iu=0; iu<=cu;iu++){
  float v= map(iv,0,cv,-a,a);
  float u=map(iu,0,cu,-b,b); 
  points[iv][iu].z=c*(sin(v+(radians(angle))));
 }}
 angle++;
}
void animation(){
 for(int iv=0; iv<=cv;iv++){
 for(int iu=0; iu<=cu;iu++){
  float v= map(iv,0,cv,-a,a);
  float u=map(iu,0,cu,-b,b); 
  points[iv][iu].z=c*(sin(v+(radians(angle))));
  points[iv][iu].y=c*(sin(u+(radians(angle)))*cos(v+(radians(angle))));
  points[iv][iu].x=c*(cos(u+(radians(angle)))*cos(v+(radians(angle))));
 }}
 angle++;
}
void mouseDragged(){
  if(abs(mouseX-a)<10&&abs(mouseY-by)<10){
   a=mouseX; }
  
  if(abs(mouseX-b)<10&&abs(mouseY-(by+30))<10){
    b=mouseX; 
  }
  
 if(abs(mouseX-c)<10&&abs(mouseY-(by+50))<10){
    c=mouseX;
  }  
  animation();
 println("a: "+a); println("b: "+b); println("c: "+c);  
}

void keyPressed(){
 if(key=='2'){record2=true;}
 if(key=='3'){fill(0); record3=true;}
}