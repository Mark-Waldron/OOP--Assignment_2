class Player
{
  PShape body;
  
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
    
    
    
  }
  
  void render()
  {
    shape(body,400,40);
    //shape(Axel_right,400,40);
  }
}