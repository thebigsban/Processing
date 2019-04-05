PImage img;
int num_lanterns = 300;
float r = 20;
float h = 40;
float n = 100;
int totalFrames = 200;
int counter = 0;
boolean record = true;
Lantern[] lanterns = new Lantern[num_lanterns];
int canvas = 500;
void setup() {
  size(500, 500, P3D);
  img = loadImage("tangled.png");
  for (int i = 0; i < num_lanterns; i++){
     lanterns[i] = new Lantern(r,h,n,img);
  }
}

void draw() {
  background(0,0,0);
  
  //translate(width / 2, height / 2);
  //rotateY(map(mouseX, 0, width, 0, 1.25*PI));
  //rotateZ(map(mouseY, 0, height, 0, -1.25*PI));
  noStroke();
  fill(255, 255, 255);
  translate(canvas/2, canvas/2, 0);
  float r = 20;
  float h = 40;
  float n = 100;
  float x = 0;
  float y = 0;
  float z1 = 0;
  float z2 = 80;
  //Lantern c1 = new Lantern(r,h,n,x,z1,z1);
  //Lantern c2 = new Lantern(r,h,n,x,z2,y);
  //pushMatrix();
  for (int i = 0; i < num_lanterns; i++){
    pushMatrix();
    lanterns[i].drawLantern();
    //translate(canvas/2, canvas/2, 0);
    lanterns[i].update();
    popMatrix();
  }
  //translate(canvas/2, canvas/2, -3000);
  
  //Lantern c1 = new Lantern(r,h,n);
  //Lantern c2 = new Lantern(r,h,n);
  //noStroke();
  //fill(255, 255, 255);
  
  if (record) {
    saveFrame("output/gif-"+nf(counter, 3)+".png");
    if (counter == totalFrames-1) {
      exit();
    }
  }
  counter++;
  //drawCylinder(20, 20, 40, 100,0,80,0);// Draw a mix between a cylinder and a cone
  //drawCylinder(70, 70, 120, 64); // Draw a cylinder
  //drawCylinder(0, 180, 200, 4); // Draw a pyramid
  //noLoop();
}
