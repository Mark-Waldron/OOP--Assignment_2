void setup()
{
  fullScreen();
 
  player = new Player();
  
}

Player player;


void draw()
{
  background(255);
  player.render();
 
}