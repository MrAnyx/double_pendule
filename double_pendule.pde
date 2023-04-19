float x1 = 0;
float y1 = 0;

float x2 = 0;
float y2 = 0;

float L1 = 200;
float L2 = 200;

float m1 = 40;
float m2 = 40;

float a1 = PI/4;
float a2 = PI/8;

float a1_v = 0;
float a2_v = 0;

float a1_a = 0;
float a2_a = 0;


float g = 9.81;

PGraphics canvas;


void setup(){
  size(600,600);
  stroke(0);
  strokeWeight(4);
  
  canvas = createGraphics(600,600);
  
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
  
}


void draw(){
  
  a1_a = (-g*(2*m1+m2)*sin(a1)-m2*g*sin(a1-2*a2)-2 * sin(a1-a2) *m2*(a2_v*a2_v*L2+a1_v*a1_v*L1*cos(a1-a2)))/(L1*(2*m1+m2-m2*cos(2*a1-2*a2)));
  a2_a = (2*sin(a1-a2)*(a1_v*a1_v*L1*(m1+m2)+g*(m1+m2)*cos(a1)+a2_v*a2_v*L2*m2*cos(a1-a2)))/(L2*(2*m1+m2-m2*cos(2*a1-2*a2)));
  
  image(canvas,0,0);
  fill(0);
  translate(300,50);
  
  x1 = L1*sin(a1);
  y1 = L1*cos(a1);
  
  x2 = x1 + L2*sin(a2);
  y2 = y1 + L2*cos(a2);
  
  line(0,0,x1,y1);
  ellipse(x1,y1,20,20);
  
  line (x1,y1,x2,y2);
  ellipse(x2,y2,20,20);
  
  a1_v += a1_a;
  a2_v += a2_a;
  
  a1 += a1_v;
  a2 += a2_v;
  
  canvas.beginDraw();
  canvas.translate(300,50);
  canvas.stroke(0);
  canvas.strokeWeight(4);
  canvas.point(x2,y2);
  canvas.endDraw();
  
  
  

}