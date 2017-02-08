class Player extends Physics
{
  //making the the car  
  PShape body;
  PShape chassie;
  PShape accessories;
  PShape lines;
  PShape lines_2;
  //colour for the objects
  float c1;
  float c2; 
  float c3;
  
  
  Player(float x, float y, float theta, float size, char left, char right, float c1, float c2, float c3)
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
    //colour for the objects
    this.c1 = c1;
    this.c2 = c2;
    this.c3 = c3;
    
    radius = size / 2;
    
    //calling the create function
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
    body.fill(c1,c2,c3);
    
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
    
    //accessories 
    accessories = createShape();
    accessories.beginShape();
    accessories.fill(c1,c2,c3);
    
    
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
    
    //tranlateing the point around the screen to simulate that the object 
    pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(theta); 
     
    shape(chassie,0,0);
    shape(body,0,0);
    shape(accessories,0,0);
    shape(lines,0,0);
    shape(lines_2,0,0);
    //shape(Axel_right,400,40);
    popMatrix();
    
     
}
  
  void update()
  {
    
    
     //direction is allways moving forward 
    forward.x = 2 * sin(theta);
    forward.y  = -2 * cos(theta);
    
    //implementing drift machanic
    drift.add(PVector.mult(forward, -power));
   
       
     //making the car rotate 
     if (checkKey(left))
    {
      theta -= 0.05f;
    }
    if (checkKey(right))
    {
      theta += 0.05f;
    }
    
    /* Physics which make the car move around
       and drift
    */
    accel = PVector.div(drift, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    drift.x = drift.y = 0;
    velocity.mult(0.99f);
    elapsed += timeDelta;
  
  //makes a trail by making a new instance then adding it to array list
  if(time % 15 == 0)
  {
    trail_array.add(new Trail(trail_1.pos.x,trail_1.pos.y,trail_1.theta,50, 'a','d'));
    trail_array.add(new Trail(trail_2.pos.x,trail_2.pos.y,trail_2.theta,50, 'h','k'));
  }
  //Tyer_skid_array.add(new Tyer_Skid(tyres_1.pos.x, tyres_1.pos.y, tyres_1.theta, 50));
  //Tyer_skid_array.add(new Tyer_Skid(tyres_2.pos.x, tyres_2.pos.y, tyres_2.theta, 50));
  
  //if(Tyer_skid_array.size() > 20)
  {
    //Tyer_skid_array.remove(0);
  }

  //when the array gets to big removes the last element 
  if(trail_array.size() > 50)
  {
    trail_array.remove(0);
  }
 
 //runs the array
 for(Trail r : trail_array)
 {
   r.render();
 }
  
  
 /* for(Tyer_Skid t : Tyer_skid_array)
  {
    t.render();
  }
 */ 
  }
  
}
  
  