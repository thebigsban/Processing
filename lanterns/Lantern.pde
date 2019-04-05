class Lantern {
  float r;
  float h;
  float n;
  float x;
  float y;
  float z;
  float xvel = random(1)-0.5;
  float yvel = random(1)-0.5;
  float zvel = random(1)-0.5;
  float angle = PI/6;
  float offset1 = random(1000);
  float offset2 = random(1000);
  float offset3 = random(1000);
  float increment = 100;
  float rz = map(noise(offset1),0,1,-angle/2,angle/2);
  float ry = map(noise(offset2),0,1,-angle/2,angle/2);
  float rx = map(noise(offset3),0,1,-angle/2,angle/2);
  float colorscale = map(noise(offset1),0,1,0,1);
  float xyrange;
  PImage texture;
  int range = 1500;
  Lantern(float r, float h, float n, PImage texture){//, float x, float y,float z){
    this.r = r;
    this.h = h;
    this.n = n;
    this.z = random(range)-range;
    this.xyrange = 500-2*z;
    this.x = random(xyrange)-xyrange/2;
    this.y = random(xyrange)-xyrange/2;
    
    this.texture = texture;
  }
  void update(){
    x += xvel;
    y += yvel;
    z += zvel;
    xyrange = 500-2*z;
    xvel += random(0.2)-0.1;
    yvel += random(0.2)-0.1;
    zvel += random(0.05) - 0.025;
    if (xvel > 1){xvel = 1;}
    if (yvel > 1){yvel = 1;}
    if (zvel > 1){zvel = 1;}
    if (xvel < -1){xvel = -1;}
    if (yvel < -1){yvel = -1;}
    if (zvel < -1){zvel = -1;}
    //if (x < -xyrange/2){x = xyrange+x;}
    //if (x > xyrange/2){x = xyrange-x;}
    //if (y < -xyrange/2){y = xyrange+y;}
    //if (y > xyrange){y = xyrange-y;}
    offset1 += increment;
    offset2 += increment;
    offset3 += increment;
    rz = map(noise(offset1),0,1,-angle*2,angle*2);
    ry = map(noise(offset2),0,1,-angle/2,angle/2);
    rx = map(noise(offset3),0,1,-angle/2,angle/2);
    colorscale = map(noise(offset1),0,1,0.8,1);
  }
  void drawLantern() {
    //rotateX(rx);
    //rotateY(ry);
    //rotateZ(rz);
    lights();
    
    noStroke();
    fill(255, 255, 255);
    float angle = 0;
    float angleIncrement = TWO_PI / n;
    pointLight(255*colorscale,255*colorscale,100*colorscale,x,y-h/2+5,z);
    beginShape(QUAD_STRIP);
    texture(texture);
    ambient(0,0,0);
    float yellow = map(z,-range,0,0,40);
    float red = map(z,-range,0,150,255);
    emissive(red,yellow,0);
    
    //stroke(100, 100, 100);
    for (int i = 0; i < n + 1; ++i) {
      float u = img.width / n * i;
      vertex(r*cos(angle)+x, y-h/2, z+r*sin(angle),u,0);
      vertex(r*cos(angle)+x, y+h/2, z+r*sin(angle),u,img.height);
      angle += angleIncrement;
    }
    //fill(
    endShape(CLOSE);
    
    
    angle = 0;
    beginShape(TRIANGLE_FAN);
    ambient(0,0,0);
    fill(0, 0, 0);
    emissive(0,0,0);
    for (int i = 0; i < n + 1; i++){
        vertex(x+r/3 * cos(angle), y+h/2, z+r/3 * sin(angle));
        angle += angleIncrement; 
    }
   // pointLight(255,255,255,0,-h/2+1,0);
    endShape(CLOSE);
    
    beginShape(LINES);
    ambient(0,0,0);
    fill(0, 0, 0);
    emissive(0,0,0);
    stroke(10);
    line(x+r, y+h/2, z, x-r, y+h/2, z);
    ambient(0,0,0);
    fill(0, 0, 0);
    emissive(0,0,0);
    line(x, y+h/2, z+r, x, y+h/2, z-r);
    stroke(10);
    endShape(LINE);
    noLights();
    // If it is not a cone, draw the circular top cap
    //if (r != 0) {
    //  angle = 0;
    //  beginShape(TRIANGLE_FAN);
      
    //  // Center point
    //  vertex(0, 0, 0);
    //  for (int i = 0; i < n + 1; i++) {
    //    vertex(r * cos(angle), 0, r * sin(angle));
    //    angle += angleIncrement;
    //  }
    //  endShape();
    //}
  
    // If it is not a cone, draw the circular bottom cap
    //if (r != 0) {
    //  angle = 0;
    //  beginShape(TRIANGLE_FAN);
  
    //  // Center point
    //  vertex(0, h, 0);
    //  for (int i = 0; i < n + 1; i++) {
    //    vertex(r * cos(angle), h, r * sin(angle));
    //    angle += angleIncrement;
    //  }
    //  endShape();
    //}
    rotateX(-rx);
    rotateY(-ry);
    rotateZ(-rz);
    //popMatrix);
  }
}
