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
    car.vertex(0,30);
    
    
    
    
    
    
    
    car.endShape(CLOSE);
  }
  
  void render()
  {
    shape(car,400,500);
  }
}