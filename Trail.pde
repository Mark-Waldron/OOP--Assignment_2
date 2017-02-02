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
 }
   
  void create()
  {
    ellipse(pos.x,pos.y,30,30);
  }
  
  void render()
  {
     pushMatrix();
     translate(pos.x, pos.y);
     ellipse(pos.x,pos.y,30,30);
     popMatrix();
     
  }
  
  void update()
  {
    accel = PVector.div(force, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    force.x = force.y = 0;
    velocity.mult(0.99f);
    elapsed += timeDelta;
  }
  
}