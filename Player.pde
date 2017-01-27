class Player
{
  
  
  PVector pos;
  PVector forward;
  float theta;
  float size;
  float radius;
  
  PShape body;
  PShape chassie;
  PShape wheels_1;
  PShape wheels_2;
  PShape wheels_3;
  PShape wheels_4;
  PShape accessories;
  PShape lines;
  PShape lines_2;
  //PShape Axel_right;
  
  Player(float x, float y, float theta, float size)
  {
    
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.theta = theta;
    this.size = size;
    radius = size / 2;
    

    
    create();
  }
  
  void create()
  {
    /*
    Axel_right = createShape();
    Axel_right.beginShape();
    Axel_right.fill(255);
    
    Axel_right.curveVertex(95, 150);
    Axel_right.curveVertex(95, 150);
    Axel_right.curveVertex(85, 210);
    Axel_right.curveVertex(80, 225);
    Axel_right.curveVertex(85, 240);
    Axel_right.curveVertex(95, 300);
    Axel_right.curveVertex(95, 300);
    
    Axel_right.endShape(CLOSE);
    */
    

    
    //Body kit  
    body = createShape();
    body.beginShape();
    body.fill(0);
    
    //spoiler
    body.vertex(0,0);
    body.vertex(140,0);
    body.vertex(140,30);
   
    //backend
    body.vertex(85,30);
    body.vertex(95,90);
    body.vertex(95,150);
    
    //bonnit
    body.vertex(95,300);
    body.vertex(70,360);
    body.vertex(45,300);
    
    //backend_2
    body.vertex(45,90);
    body.vertex(55,30);
    
    //end point
    body.vertex(0,30); 
    body.endShape(CLOSE);
    
    
    
   
    
    //wheels
    wheels_1 = createShape();
    wheels_1.beginShape();
    wheels_1.fill(204, 51, 0);
    
    //back left
    
    wheels_1.vertex(120,110);
    wheels_1.vertex(140,110);
    wheels_1.vertex(140,160);
    wheels_1.vertex(120,160);
    wheels_1.endShape(CLOSE);
   
    //front left
    wheels_2 = createShape();
    wheels_2.beginShape();
    wheels_2.fill(204, 51, 0);
    
    wheels_2.vertex(120,290);
    wheels_2.vertex(140,290);
    wheels_2.vertex(140,340);
    wheels_2.vertex(120,340);
    wheels_2.endShape(CLOSE);
    
    
    //back right
    wheels_3 = createShape();
    wheels_3.beginShape();
    wheels_3.fill(204, 51, 0);
    
    wheels_3.vertex(20,110);
    wheels_3.vertex(0,110);
    wheels_3.vertex(0,160);
    wheels_3.vertex(20,160);
    wheels_3.endShape(CLOSE);
    
    //front right
    wheels_4 = createShape();
    wheels_4.beginShape();
    wheels_4.fill(204, 51, 0);
    wheels_4.vertex(20,290);
    wheels_4.vertex(0,290);
    wheels_4.vertex(0,340);
    wheels_4.vertex(20,345);
    wheels_4.endShape(CLOSE);
    
    
    
    //accessories 
    accessories = createShape();
    accessories.beginShape();
    accessories.fill(0);
    
    
    accessories.vertex(95,300);
    accessories.vertex(95,350);
    accessories.vertex(70,300);
    accessories.vertex(45,350);
    accessories.vertex(45,300);
    
    accessories.endShape(CLOSE);
    
    
    lines = createShape();
    lines.beginShape(POINTS);
    lines.vertex(95, 90);
    lines.vertex(120, 30);
    lines.endShape(CLOSE);
    
    lines_2 = createShape();
    lines_2.beginShape(POINTS);
    lines_2.vertex(45, 90);
    lines_2.vertex(20, 30);
    lines_2.endShape(CLOSE);
    
    
    //chassie kit
    chassie = createShape();
    chassie.beginShape();
    chassie.fill(153, 153, 102);
    
    
    //back left
    chassie.vertex(85,180);
    chassie.vertex(120,120);
    chassie.vertex(120,150);
    chassie.vertex(85,210);
    
    //front left
    chassie.vertex(85,240);
    chassie.vertex(120,300);
    chassie.vertex(120,330);
    chassie.vertex(85,270);
    
    //back right
    chassie.vertex(55,180);
    chassie.vertex(20,120);
    chassie.vertex(20,150);
    chassie.vertex(55,210);
    
    //front right
    chassie.vertex(55,240);
    chassie.vertex(20,300);
    chassie.vertex(20,330);
    chassie.vertex(55,270);
    chassie.endShape(CLOSE);
    
    
    
  }
  
  void render()
  {
    pushMatrix(); 
    translate(pos.x, pos.y);
    rotate(theta); 
    
    
    shape(chassie,0,0);
    shape(body,0,0);
    shape(wheels_1,0,0);
    shape(wheels_2,0,0);
    shape(wheels_3,0,0);
    shape(wheels_4,0,0);
    shape(accessories,0,0);
    shape(lines,0,0);
    shape(lines_2,0,0);
    //shape(Axel_right,400,40);
    
    popMatrix();
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y  = -cos(theta);
    if (checkKey('w'))
    {
      pos.sub(forward);
    }
    if (checkKey('s'))
    {
      pos.add(forward);
    }
    if (checkKey('a'))
    {
      theta -= 0.01f;
    }
    if (checkKey('d'))
    {
      theta += 0.01f;
    }
    
  }
  
}
  
  