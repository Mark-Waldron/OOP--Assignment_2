class Collision extends Physics
{
  PShape Hit_Box;
  int end = 400;
  Collision(float x, float y, float theta, float size, char left, char right)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    accel = new PVector(0,0);
    velocity = new PVector(0,0);
    force = new PVector(0, 0);
    this.theta = theta;
    this.size = size;
    this.left = left;
    this.right = right;
    radius = size / 2;
    
    create();
    
  } 
  
  void create()
  {
    Hit_Box = createShape();
    Hit_Box.beginShape();
    Hit_Box.noStroke();
    Hit_Box.fill(255,255,255,0);
    Hit_Box.vertex(0 + x_axis ,0 + y_axis);
    Hit_Box.vertex(140 + x_axis,0 + y_axis);
    Hit_Box.vertex(140 + x_axis,360 + y_axis);
    Hit_Box.vertex(0 + x_axis,360 + y_axis);
   
    

    Hit_Box.endShape(CLOSE);
  }
  
  void render()
  {
     pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(theta); 
    shape(Hit_Box,0,0);
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
    
    for(int i = 0 ; i < physics.size() ; i ++)
    {
      Physics phy = physics.get(i);
      if (phy instanceof Trail)
      {
        Trail b = (Trail) phy;
        if (dist(phy.pos.x, phy.pos.y, this.pos.x, this.pos.y) < 0.4)
        {
          end--;
          println(end);
        }
      }
    }
    
  }
}