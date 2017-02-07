class Player extends Physics
{
  
  PShape body;
  PShape chassie;
  PShape accessories;
  PShape lines;
  PShape lines_2;
  //PShape Axel_right;
  
  
  
  Player(float x, float y, float theta, float size, char left, char right)
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
    body.fill(0,0,0);
    
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
    accessories.fill(0,0,0);
    
    
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
    
     if(time % 15 == 0)
  {
    trail_array.add(new Trail(trail_1.pos.x,trail_1.pos.y,trail_1.theta,50));
    trail_array.add(new Trail(trail_2.pos.x,trail_2.pos.y,trail_2.theta,50));
  }
  //Tyer_skid_array.add(new Tyer_Skid(tyres_1.pos.x, tyres_1.pos.y, tyres_1.theta, 50));
  //Tyer_skid_array.add(new Tyer_Skid(tyres_2.pos.x, tyres_2.pos.y, tyres_2.theta, 50));
  
  //if(Tyer_skid_array.size() > 20)
  {
    //Tyer_skid_array.remove(0);
  }

  if(trail_array.size() > 20)
  {
    trail_array.remove(0);
  }
 
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
  
  