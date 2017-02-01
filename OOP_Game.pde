void setup()
{
  fullScreen();
  background(255);
  
  player = new Player(width / 2, height / 2, 0, 50);
  player_tyerskid = new Tyer_Skid(width / 2, height / 2, 0, 50);
  
}



ArrayList<Tyer_Skid> particles = new ArrayList<Tyer_Skid>();


Player player;
Tyer_Skid player_tyerskid;
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
  
  for (int i = particles.size() -1 ; i >= 0  ; i --)
  {
    Tyer_skid = particles.get(i); 
    player_tyerskid.render();
    player_tyerskid.update();
    player_tyerskid.create(); 
  }
  
  
  player.render();
  player.update();
  player.create();
  
 
}