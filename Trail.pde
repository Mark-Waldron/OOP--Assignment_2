class Trail extends Physics
{
  PShape trail;
  
  Trail(float x, float y)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    accel = new PVector(0,0);
    velocity = new PVector(0,0);
    force = new PVector(0,0);
    
    create();
 }
   
 void create()
 {
   trail = createShape();
   trail.beginShape();
   trail.vertex(70,30);
   trail.endShape(CLOSE);
 }
 
  
 void render()
 {
     pushMatrix();
     translate(pos.x, pos.y);
     shape(trail,0,0);
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