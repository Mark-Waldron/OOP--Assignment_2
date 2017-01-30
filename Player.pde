class Player
{
  
  PVector force;
  float power = 100;
  float fireRate = 2;
  float toPass = 1.0 / fireRate;
  float elapsed = toPass;
  float timeDelta = 1.0f / 60.0f;
  
  PVector pos;
  PVector forward;
  PVector velocity;
  PVector accel;
  
  
  float theta;
  float size;
  float radius;
  float mass = 1;

  
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
  
  int x_axis = -70;
  int y_axis = -340;
  
  Player(float x, float y, float theta, float size)
  {
    
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    accel = new PVector(0,0);
    velocity = new PVector(0,0);
    force = new PVector(0, 0);
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
    body.vertex(0 + x_axis,0 + y_axis);
    body.vertex(140 + x_axis,0 + y_axis);
    body.vertex(140 + x_axis,30 + y_axis);
   
    //backend
    body.vertex(85 + x_axis,30 + y_axis);
    body.vertex(95 + x_axis,90 + y_axis);
    body.vertex(95 + x_axis,150 + y_axis);
    
    //bonnit
    body.vertex(95 + x_axis,300 + y_axis);
    body.vertex(70 + x_axis,360 + y_axis);
    body.vertex(45 + x_axis,300 + y_axis);
    
    //backend_2
    body.vertex(45 + x_axis,90 + y_axis);
    body.vertex(55 + x_axis,30 + y_axis);
    
    //end point
    body.vertex(0 + x_axis,30 + y_axis); 
    body.endShape(CLOSE);
    
    
    
   
    
    //wheels
    wheels_1 = createShape();
    wheels_1.beginShape();
    wheels_1.fill(204, 51, 0);
    
    //back left
    
    wheels_1.vertex(120 + x_axis,110 + y_axis);
    wheels_1.vertex(140 + x_axis,110 + y_axis);
    wheels_1.vertex(140 + x_axis,160 + y_axis);
    wheels_1.vertex(120 + x_axis,160 + y_axis);
    wheels_1.endShape(CLOSE);
   
    //front left
    wheels_2 = createShape();
    wheels_2.beginShape();
    wheels_2.fill(204, 51, 0);
    
    wheels_2.vertex(120 + x_axis,290 + y_axis);
    wheels_2.vertex(140 + x_axis,290 + y_axis);
    wheels_2.vertex(140 + x_axis,340 + y_axis);
    wheels_2.vertex(120 + x_axis,340 + y_axis);
    wheels_2.endShape(CLOSE);
    
    
    //back right
    wheels_3 = createShape();
    wheels_3.beginShape();
    wheels_3.fill(204, 51, 0);
    
    wheels_3.vertex(20 + x_axis,110 + y_axis);
    wheels_3.vertex(0 + x_axis,110 + y_axis);
    wheels_3.vertex(0 + x_axis,160 + y_axis);
    wheels_3.vertex(20 + x_axis,160 + y_axis);
    wheels_3.endShape(CLOSE);
    
    //front right
    wheels_4 = createShape();
    wheels_4.beginShape();
    wheels_4.fill(204, 51, 0);
    wheels_4.vertex(20 + x_axis,290 + y_axis);
    wheels_4.vertex(0 + x_axis,290 + y_axis);
    wheels_4.vertex(0 + x_axis,340 + y_axis);
    wheels_4.vertex(20 + x_axis,345 + y_axis);
    wheels_4.endShape(CLOSE);
    
    
    
    //accessories 
    accessories = createShape();
    accessories.beginShape();
    accessories.fill(0);
    
    
    accessories.vertex(95 + x_axis,300 + y_axis);
    accessories.vertex(95 + x_axis,350 + y_axis);
    accessories.vertex(70 + x_axis,300 + y_axis);
    accessories.vertex(45 + x_axis,350 + y_axis);
    accessories.vertex(45 + x_axis,300 + y_axis);
    
    accessories.endShape(CLOSE);
    
    
    lines = createShape();
    lines.beginShape(POINTS);
    lines.vertex(95 + x_axis, 90 + y_axis);
    lines.vertex(120 + x_axis, 30 + y_axis);
    lines.endShape(CLOSE);
    
    lines_2 = createShape();
    lines_2.beginShape(POINTS);
    lines_2.vertex(45 + x_axis, 90 + y_axis);
    lines_2.vertex(20 + x_axis, 30 + y_axis);
    lines_2.endShape(CLOSE);
    
    
    //chassie kit
    chassie = createShape();
    chassie.beginShape();
    chassie.fill(153, 153, 102);
    
    
    //back left
    chassie.vertex(85 + x_axis,180 + y_axis);
    chassie.vertex(120 + x_axis,120 + y_axis);
    chassie.vertex(120 + x_axis,150 + y_axis);
    chassie.vertex(85 + x_axis,210 + y_axis);
    
    //front left
    chassie.vertex(85 + x_axis,240 + y_axis);
    chassie.vertex(120 + x_axis,300 + y_axis);
    chassie.vertex(120 + x_axis,330 + y_axis);
    chassie.vertex(85 + x_axis,270 + y_axis);
    
    //back right
    chassie.vertex(55 + x_axis,180 + y_axis);
    chassie.vertex(20 + x_axis,120 + y_axis);
    chassie.vertex(20 + x_axis,150 + y_axis);
    chassie.vertex(55 + x_axis,210 + y_axis);
    
    //front right
    chassie.vertex(55 + x_axis,240 + y_axis);
    chassie.vertex(20 + x_axis,300 + y_axis);
    chassie.vertex(20 + x_axis,330 + y_axis);
    chassie.vertex(55 + x_axis,270 + y_axis);
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
    forward.x = 2 * sin(theta);
    forward.y  = -2 * cos(theta);
    
   
    force.add(PVector.mult(forward, power));      
    
   
    if (checkKey('a'))
    {
      theta -= 0.05f;
    }
    if (checkKey('d'))
    {
      theta += 0.05f;
    }
    
    accel = PVector.div(force, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    force.x = force.y = 0;
    velocity.mult(0.99f);
    elapsed += timeDelta;
    
  }
  
}
  
  