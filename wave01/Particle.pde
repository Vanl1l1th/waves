
class Particle {
  PVector location;
  int a;
  PVector origine= new PVector();
  
  Particle(int angle) {
    location = new PVector(); 
    a=angle; 
  }
  
  void setLocation(float x, float y) {
    location.x = x;
    location.y = y; 
 
  }
  
  void morph(){
   origine.x=sin(radians(a2))*150;
   origine.y=cos(radians(a2))*100;
   origine.z=sin(radians(a2))*100;
  a2+=10;  println(origine.y);
  }
  
  void display() {
    fill(255);
    pushMatrix();
    translate(location.x-1000,location.y-800);
    rotateX(radians(a));
    strokeWeight(0.8);
    //noStroke();
    box(30,25,400);
    //translate(0,0,50);
    //fill(105);
   // box(10,1,50);
    //ellipse(location.x,location.y,16,16); 
    popMatrix();

  }
  
  
}