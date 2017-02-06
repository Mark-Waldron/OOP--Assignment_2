class Trail extends Physics
{
  PShape trail_1;
  PShape trail_2;
  PShape trail_3;
  
  Trail(float x, float y,float theta, float size)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    accel = new PVector(0,0);
    velocity = new PVector(0,0);
    force = new PVector(0,0);
    this.theta = theta;
    this.size = size;
    radius = size / 2;
    
    create();
 }
   
 void create()
 {
    trail_1 = createShape(ELLIPSE,0,0-330,30,30);
    trail_1.setFill(color(0));
    
    
    
    trail_2 = createShape(ELLIPSE,0,0-330,15,15);
    trail_2.setFill(color(122, 122, 82));
    
    trail_3 = createShape(ELLIPSE,0,0-330,5,5);
    trail_3.setFill(color(230, 0, 0));
    
    
   
 }
 
  
 void render()
 {
     pushMatrix();
     translate(pos.x, pos.y);
     rotate(theta);
     shape(trail_1,0,0);
     shape(trail_2,0,0);
     shape(trail_3,0,0);
     popMatrix();
     
  }
  
  void update()
  {
    forward.x = 2 * sin(theta);
    forward.y  = -2 * cos(theta);
    
   
    force.add(PVector.mult(forward, -power));
  
     
    
   
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