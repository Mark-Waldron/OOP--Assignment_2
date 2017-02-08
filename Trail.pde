class Trail extends Physics
{
  //making the trail
  PShape trail_1;
  PShape trail_2;
  PShape trail_3;
  
  Trail(float x, float y,float theta, float size, char left, char right)
  {
    
    /* recording each of these varaiables 
       so that the opject can move with 
       the other opjects from the other classes
    */  
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    accel = new PVector(0,0);
    velocity = new PVector(0,0);
    drift = new PVector(0,0);
    this.theta = theta;
    this.size = size;
    this.left = left;
    this.right = right;
    radius = size / 2;
    
     //calling the create function
    create();
 }
   
 void create()
 {
    trail_1 = createShape(ELLIPSE,0,0-430,30,30);
    trail_1.setFill(color(0));
    
    
    
    trail_2 = createShape(ELLIPSE,0,0-430,15,15);
    trail_2.setFill(color(122, 122, 82));
    
    trail_3 = createShape(ELLIPSE,0,0-430,5,5);
    trail_3.setFill(color(230, 0, 0));
    
    
   
 }
 
  
 void render()
 {
     //tranlateing the point around the screen to simulate that the object 
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
    //direction is allways moving forward 
    forward.x = 2 * sin(theta);
    forward.y  = -2 * cos(theta);
    
     //implementing drift machanic
    drift.add(PVector.mult(forward, -power));
  
     
    
     //making the mines move position 
     if (checkKey(left))
    {
      theta -= 0.05f;
    }
    if (checkKey(right))
    {
      theta += 0.05f;
    }
    
    /* Physics that make the mines fallow 
       the car as it gose around 
    */
    accel = PVector.div(drift, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    drift.x = drift.y = 0;
    velocity.mult(0.99f);
    elapsed += timeDelta;
    
  
    
  }
  
}