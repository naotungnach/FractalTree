private double fractionLength = .8; 
private int smallestBranch = 12;
private double branchAngle = 0.4; 

public void setup() 
{   
  size(640,450);    
  noLoop(); 
} 
public void keyPressed(){
  if (key == 'n'){
    branchAngle = branchAngle - 0.1;
    redraw();
  }
  if (key == 'm'){
    //if (branchAngle < 0.9){
    //  branchAngle = branchAngle + 0.1;
    //  redraw();
    //}
    branchAngle = branchAngle + 0.1;
    redraw();
  }
}
public void draw() 
{   
  background(0);   
  stroke(250,30,0);   
  strokeWeight(0.4);
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2);
  stroke(30,250,0);
  strokeWeight(0.2);
  line(500,400,500,300);
  drawBranches(500,300,50,3*Math.PI/2);
  stroke(0,250,200);
  line(150,400,150,300);
  drawBranches(150,300,50,3*Math.PI/2);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1;
  double angle2;
  angle1 = angle + branchAngle;
  angle2 = angle - branchAngle;
  branchLength = branchLength*fractionLength;
  int endX1, endY1, endX2, endY2, endx3, endy3, endx4, endy4;
  endX1 = (int)(branchLength*Math.cos(angle1) + x);
  endY1 = (int)(branchLength*Math.sin(angle1) + y);
  endX2 = (int)(branchLength*Math.cos(angle2) + x);
  endY2 = (int)(branchLength*Math.sin(angle2) + y);
  endx3 = (int)x;
  endy3 = (int)y;
  line(x,y,endX1, endY1);
  line(x,y,endX2, endY2);
  line(x,y,endx3,endy3);
  if (branchLength > smallestBranch){
    drawBranches(endX1,endY1,branchLength, angle);
    drawBranches(endX2, endY2, branchLength, angle);
    drawBranches(endx3, endy3, branchLength, angle);
} 
}
