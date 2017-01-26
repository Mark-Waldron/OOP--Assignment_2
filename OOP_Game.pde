void setup()
{
  fullScreen();
 
  player = new Player(width / 2, height / 2, 0, 50);
  
}

Player player;
boolean[] keys = new boolean[1000];

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}


void draw()
{
  background(255);
  player.update();
  player.render();
 
}