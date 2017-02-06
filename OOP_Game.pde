void setup()
{
  size(1200,700);
  background(255);
  
  player_1 = new Player(width / 2, height / 2, 0, 50);
  player_2 = new Player(700,700, 0, 50);
  tyres_1 = new Tyer_Skid(width/2,height/2,0,50);
  tyres_2 = new Tyer_Skid(700,700,0,50);
  trail_1 = new Trail(width/2,height/2,0,50);
  trail_2 = new Trail(700,700,0,50);
  hitbox_1 = new Collision(width/2,height/2,0,50);
 
  physics.add(player_1);
  physics.add(player_2);
  physics.add(tyres_1);
  physics.add(tyres_2);
  physics.add(trail_1);
  physics.add(trail_2);
  physics.add(hitbox_1);
}

int time = 0;

ArrayList<Physics> physics = new ArrayList<Physics>();
ArrayList<Tyer_Skid> Tyer_skid_array = new ArrayList<Tyer_Skid>();
ArrayList<Trail> trail_array = new ArrayList<Trail>();

Tyer_Skid tyres_1; 
Tyer_Skid tyres_2; 
Trail trail_1;
Trail trail_2;
Player player_1;
Player player_2;

Collision hitbox_1;
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
 
 
  
  
 

  for (int i = physics.size() -1 ; i >= 0  ; i --)
  {
    Physics phy = physics.get(i); 
    phy.update();
    phy.render();    
  }
  
 
  time++;
  }
    









  
 