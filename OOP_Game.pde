
int stage = 1;

void setup()
{
  fullScreen();
  background(255);
  img = loadImage("background.jpg");
  
  player_1 = new Player(width / 2, height / 2, 0, 50, 'a', 'd');
  player_2 = new Player(2000,height / 2, 0, 50, 'h','k');
  tyres_1 = new Tyer_Skid(width/2,height/2,0,50, 'a', 'd');
  tyres_2 = new Tyer_Skid(2000,height / 2,0,50, 'h','k');
  trail_1 = new Trail(width/2,height/2,0,50, 'a', 'd');
  trail_2 = new Trail(2000,height / 2,0,50, 'h','k');
  hitbox_1 = new Collision(width/2,height/2,0,50, 'a', 'd');
  hitbox_2 = new Collision(2000,height/2,0,50, 'h', 'k');
  
  physics.add(player_1);
  physics.add(player_2);
  physics.add(tyres_1);
  physics.add(tyres_2);
  physics.add(trail_1);
  physics.add(trail_2);
  physics.add(hitbox_1);
  physics.add(hitbox_2);
  
}

int time = 0;
PImage img;

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
Collision hitbox_2;
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
  if(stage == 1)
  {
    // Images must be in the "data" directory to load correctly
    
   image(img, 0, 0);
   PFont f = createFont("GoudyStout-48",25);
   fill(0);
   textAlign(CENTER);
   textFont(f);
   textSize(25);
   if(time % 5 == 0)
   {
   
   }
   else
   {
   text("Pressing any key to start the game",660,450);
   }
   if(keyPressed == true)
   {
     stage = 2;
   }
  }
  
  
  if(stage == 2)
  {
    
  scale(0.5);
  background(255);
 
  
  
 

  for (int i = physics.size() -1 ; i >= 0  ; i --)
  {
    Physics phy = physics.get(i); 
    phy.update();
    phy.render();    
  }
  
 
  
  }
  
  
  time++;
  
  
}
    









  
 