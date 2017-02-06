void setup()
{
  size(1200,700);
  background(255);
  
  player = new Player(width / 2, height / 2, 0, 50);
  tyres = new Tyer_Skid(width/2,height/2,0,50);
  trail = new Trail(width/2,height/2,0,50);

  
}
int time = 0;

ArrayList<Physics> physics = new ArrayList<Physics>();
ArrayList<Tyer_Skid> Tyer_skid_array = new ArrayList<Tyer_Skid>();
ArrayList<Trail> trail_array = new ArrayList<Trail>();

Tyer_Skid tyres; 

Trail trail;
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
scale(0.5);
  
  background(255);
  if(time % 15 == 0)
  {
    trail_array.add(new Trail(trail.pos.x,trail.pos.y,trail.theta,50));
  }
  Tyer_skid_array.add(new Tyer_Skid(tyres.pos.x, tyres.pos.y, tyres.theta, 50));
  
  trail.update();
  trail.render(); 
  tyres.update();
  tyres.render();
 
 for(Trail r : trail_array)
  {
    r.render();
  }
  
  
  for(Tyer_Skid t : Tyer_skid_array)
  {
    t.render();
  }
  
  
  player.render();
  player.update();
  player.create();
  
 
  
  
  if(Tyer_skid_array.size() > 20)
  {
    Tyer_skid_array.remove(0);
  }
  
  
  
  if(trail_array.size() > 300)
  {
    trail_array.remove(0);
  }
  
  time++;
    
    
    
}





  
 