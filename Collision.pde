class Collision extends Physics
{
  //making a hitbox for the collision
  PShape Hit_Box;
  // to determain a winner
  int end = 400;
  
  Collision(float x, float y, float theta, float size, char left, char right)
  {
    /* recording each of these varaiables 
       so that the opject can move with 
       the other opjects from the other classes
    */
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
    
    //calling the create function 
    create();
    
  } 
  
  void create()
  {
    //hitbox around the car
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
    //tranlateing the point around the screen to simulate that the object 
     pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(theta); 
    shape(Hit_Box,0,0);
    popMatrix();
    
  }
  
  void update()
  {
    //direction is allways moving forward 
    forward.x = 2 * sin(theta);
    forward.y  = -2 * cos(theta);
    
    //implementing drift machanic
    drift.add(PVector.mult(forward, -power));
   
     //making the hitbox rotate with the car 
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
    
    //collison detection
    for(int i = 0 ; i < physics.size() ; i ++)
    {
      Physics phy = physics.get(i);
      if (phy instanceof Trail)
      {
        //if the trail is in the hitbox
        if (dist(phy.pos.x, phy.pos.y, this.pos.x, this.pos.y) < 0.4)
        {
          //when it is it decrements
          end--;
          println(end);
        }

      }
    }
    
    //declar the winner when the collision occurs 
    if(end <= 390)
    {
      PFont t = createFont("GoudyStout-48",100);
      fill(0);
      textAlign(CENTER);
      textFont(t);
      textSize(100);
      background(255);
      text("Player 1 Wins",1300,300); 
    }
    
  }
}