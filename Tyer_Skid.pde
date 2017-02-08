class Tyer_Skid extends Physics
{
  
  PShape wheels_1;
  PShape wheels_2;
  PShape wheels_3;
  PShape wheels_4;
  
 
  
  Tyer_Skid(float x, float y, float theta, float size, char left, char right)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    accel = new PVector(0,0);
    velocity = new PVector(0,0);
    drift = new PVector(0, 0);
    this.theta = theta;
    this.size = size;
    this.left = left;
    this.right = right;
    radius = size / 2;
    
    create();
  }
  
  void create()
  {
    
    //wheels
    wheels_1 = createShape();
    wheels_1.beginShape();
    wheels_1.fill(0);
    
    //back left
    
    wheels_1.vertex(120 + x_axis,110 + y_axis);
    wheels_1.vertex(140 + x_axis,110 + y_axis);
    wheels_1.vertex(140 + x_axis,160 + y_axis);
    wheels_1.vertex(120 + x_axis,160 + y_axis);
    wheels_1.endShape(CLOSE);
   
    //front left
    wheels_2 = createShape();
    wheels_2.beginShape();
    wheels_2.fill(0);
    
    wheels_2.vertex(120 + x_axis,290 + y_axis);
    wheels_2.vertex(140 + x_axis,290 + y_axis);
    wheels_2.vertex(140 + x_axis,340 + y_axis);
    wheels_2.vertex(120 + x_axis,340 + y_axis);
    wheels_2.endShape(CLOSE);
    
    
    //back right
    wheels_3 = createShape();
    wheels_3.beginShape();
    wheels_3.fill(0);
    
    wheels_3.vertex(20 + x_axis,110 + y_axis);
    wheels_3.vertex(0 + x_axis,110 + y_axis);
    wheels_3.vertex(0 + x_axis,160 + y_axis);
    wheels_3.vertex(20 + x_axis,160 + y_axis);
    wheels_3.endShape(CLOSE);
    
    //front right
    wheels_4 = createShape();
    wheels_4.beginShape();
    wheels_4.fill(0);
    wheels_4.vertex(20 + x_axis,290 + y_axis);
    wheels_4.vertex(0 + x_axis,290 + y_axis);
    wheels_4.vertex(0 + x_axis,340 + y_axis);
    wheels_4.vertex(20 + x_axis,345 + y_axis);
    wheels_4.endShape(CLOSE);
  
  }
  
  void render()
  {
    

    pushMatrix(); 
    
    translate(pos.x, pos.y);
    rotate(theta);
    
    shape(wheels_1,0,0);
    shape(wheels_2,0,0);
    shape(wheels_3,0,0);
    shape(wheels_4,0,0);
   
    popMatrix();
 
    
  }
  
  void update()
  {
    
    
    forward.x = 2 * sin(theta);
    forward.y  = -2 * cos(theta);
    
    drift.add(PVector.mult(forward, -power));
  
    if (checkKey(left))
    {
      theta -= 0.05f;
    }
    if (checkKey(right))
    {
      theta += 0.05f;
    }
    
    accel = PVector.div(drift, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    drift.x = drift.y = 0;
    velocity.mult(0.99f);
    elapsed += timeDelta;
  }
    
  
  
}