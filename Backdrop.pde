class Backdrop
{
  PShape Backdrop;
  
  Backdrop()
  {
    
    
    Backdrop = createShape();
    Backdrop.beginShape();
    Backdrop.fill(255);
    Backdrop.vertex(0,0);
    Backdrop.vertex(0,width);
    Backdrop.vertex(height,width);
    Backdrop.vertex(height,0);
    Backdrop.endShape(CLOSE);
    
    
    
  }
  
  void render()
  {
    shape(Backdrop,0,0);
  }
}