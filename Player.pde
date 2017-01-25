class Player
{
  PShape car;
  
  Player()
  {
    create();
  }
  
  void create()
  {
    car = createShape();
    car.beginShape();
    car.fill(0);
    
    
    
    
    //spoiler
    car.vertex(0,0);
    car.vertex(140,0);
    car.vertex(140,30);
   
    
    //backend
    car.vertex(85,30);
    car.vertex(95,90);
    car.vertex(95,150);
    car.curveVertex(95,150);
    car.curveVertex(95,150);
    car.curveVertex(85,210);
    car.curveVertex(80,225);
    car.curveVertex(85,240);
    car.curveVertex(95,300);
    car.curveVertex(95,300);
    
    //bonnit
    car.vertex(95,300);
    car.vertex(70,360);
    car.vertex(45,300);
    
    //backend_2
    car.vertex(45,90);
    car.vertex(55,30);
    
    
    
    //end point
    car.vertex(0,30); 
    
    
    
    
    car.endShape(CLOSE);
  }
  
  void render()
  {
    shape(car,400,40);
  }
}