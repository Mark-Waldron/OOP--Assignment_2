class Player
{
  PShape body;
  PShape chassie;
  PShape wheels;
  //PShape Axel_right;
  
  Player()
  {
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
    body.vertex(0,0);
    body.vertex(140,0);
    body.vertex(140,30);
   
    //backend
    body.vertex(85,30);
    body.vertex(95,90);
    body.vertex(95,150);
    
    //bonnit
    body.vertex(95,300);
    body.vertex(70,360);
    body.vertex(45,300);
    
    //backend_2
    body.vertex(45,90);
    body.vertex(55,30);
    
    //end point
    body.vertex(0,30); 
    body.endShape(CLOSE);
    
    
    
   
    //chassie kit
    chassie = createShape();
    chassie.beginShape();
    chassie.fill(0);
    
    //back left
    chassie.vertex(85,180);
    chassie.vertex(120,120);
    chassie.vertex(120,150);
    chassie.vertex(85,210);
    
    //front left
    chassie.vertex(85,240);
    chassie.vertex(120,300);
    chassie.vertex(120,330);
    chassie.vertex(85,270);
    
    //back right
    chassie.vertex(55,180);
    chassie.vertex(20,120);
    chassie.vertex(20,150);
    chassie.vertex(55,210);
    
    //front right
    chassie.vertex(55,240);
    chassie.vertex(20,300);
    chassie.vertex(20,330);
    chassie.vertex(55,270);
    chassie.endShape(CLOSE);
    
    
    
    //wheels
    wheels = createShape();
    wheels.beginShape();
    wheels.fill(0);
    
    //back left
    
    wheels.vertex(120,110);
    wheels.vertex(140,110);
    wheels.vertex(140,160);
    wheels.vertex(120,160);
   
   
    
    wheels.endShape(CLOSE);
    
    
  }
  
  void render()
  {
    shape(body,400,40);
    shape(chassie,400,40);
    shape(wheels,400,40);
    //shape(Axel_right,400,40);
  }
}