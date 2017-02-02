void setup()
{
  fullScreen();
  background(255);
  
  player = new Player(width / 2, height / 2, 0, 50);
  

  
}



ArrayList<Tyer_Skid> Tyer_skid_array = new ArrayList<Tyer_Skid>();


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
  
  
  for(Tyer_Skid t : Tyer_skid_array)
  {
    t.render();
    t.update();
  }
  
  player.render();
  player.update();
  player.create();
  
for(int i = 0; i < 10; i++)
{
    if(Tyer_skid_array.size() == 10)
    {
      Tyer_skid_array.remove(0);
    }
    Tyer_skid_array.add(new Tyer_Skid(width / 2, height / 2, 0, 50));
    
    
}





  
 
}