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
 
 
  
  
  if(time % 15 == 0)
  {
    trail_array.add(new Trail(trail_1.pos.x,trail_1.pos.y,trail_1.theta,50));
    trail_array.add(new Trail(trail_2.pos.x,trail_2.pos.y,trail_2.theta,50));
  }
  Tyer_skid_array.add(new Tyer_Skid(tyres_1.pos.x, tyres_1.pos.y, tyres_1.theta, 50));
  Tyer_skid_array.add(new Tyer_Skid(tyres_2.pos.x, tyres_2.pos.y, tyres_2.theta, 50));
  
  if(Tyer_skid_array.size() > 5)
  {
    Tyer_skid_array.remove(0);
  }
  
  
  
  if(trail_array.size() > 20)
  {
    trail_array.remove(0);
  }
  
 
  
  /*
  for(int i = 0; i < trail_array.size() ; i++)
  {
    Trail p = trail_array.get(i);
    if(p.pos.x > hitbox.pos.x && p.pos.x < hitbox.pos.x + 140 && p.pos.y > hitbox.pos.y && p.pos.y < hitbox.pos.y + 360)
    {
      background(0);
    }
    else
    {
      background(255);
    }
  }
  */
 
 for(Trail r : trail_array)
 {
   r.render();
 }
  
  
  for(Tyer_Skid t : Tyer_skid_array)
  {
    t.render();
  }

  
  
  trail_1.update();
  trail_1.render(); 
  tyres_1.update();
  tyres_1.render();
 
  
  hitbox_1.render();
  hitbox_1.update(); 
  player_1.render();
  player_1.update();
  player_1.create();
 
  trail_2.update();
  trail_2.render(); 
  tyres_2.update();
  tyres_2.render();
 
  
  
  player_2.render();
  player_2.update();
  player_2.create();
 
  time++;
  }
    









  
 