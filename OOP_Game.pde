//counter for the menu 
int stage = 1;

void setup()
{
  fullScreen();
  background(255);
  
  //loading image form the data file 
  img = loadImage("background.jpg");
  img_2 = loadImage("instructions.jpg");
  
  //making a object for each class
  //making 2 for each of the car
  player_1 = new Player(width / 2, height / 2, 0, 50, 'a', 'd',0, 0, 179);
  player_2 = new Player(2000,height / 2, 0, 50, 'j','k', 204, 0, 0);
  tyres_1 = new Tyer_Skid(width/2,height/2,0,50, 'a', 'd');
  tyres_2 = new Tyer_Skid(2000,height / 2,0,50, 'j','k');
  trail_1 = new Trail(width/2,height/2,0,50, 'a', 'd');
  trail_2 = new Trail(2000,height / 2,0,50, 'j','k');
  hitbox_1 = new Collision(width/2,height/2,0,50, 'a', 'd');
  hitbox_2 = new Collision(2000,height/2,0,50, 'j', 'k');
  
  //adding to a array list for physics 
  physics.add(player_1);
  physics.add(player_2);
  physics.add(tyres_1);
  physics.add(tyres_2);
  physics.add(trail_1);
  physics.add(trail_2);
  physics.add(hitbox_1);
  physics.add(hitbox_2);
  
}
//incremnts to run some functions yousing modulus
int time = 0;

//calling the image from the file 
PImage img;
PImage img_2;

//Array list for everything to be stored in 
ArrayList<Physics> physics = new ArrayList<Physics>();
/*Array for tyer skid affect,however when implamented the game runs like a power point
  however a example of how it looked is in a few commits back or in the background of 
  the menu of the game
*/  
ArrayList<Tyer_Skid> Tyer_skid_array = new ArrayList<Tyer_Skid>();
//the array that stores instances of the mine for the trail
ArrayList<Trail> trail_array = new ArrayList<Trail>();

//calling the classes 
Tyer_Skid tyres_1; 
Tyer_Skid tyres_2; 
Trail trail_1;
Trail trail_2;
Player player_1;
Player player_2;
Collision hitbox_1;
Collision hitbox_2;

//boolean to make sure players can click two of the keys 
boolean[] keys = new boolean[1000];

//the logic that makes the keys works
void keyPressed()
{ 
  keys[keyCode] = true;
}
 
//the logic that makes the keys works 
void keyReleased()
{
  keys[keyCode] = false; 
}

//logic to make the keys function 
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
  //to run the menu
  if(stage == 1)
  {
    
    /* a image called that I made in paint by taking a screen grab of 
       my tyer_skid array function working
    */
  
   image(img_2,0,380);
   image(img, 0, 0);
   //setting the fount 
   PFont f = createFont("GoudyStout-48",25);
   //sting the colour of the fount
   fill(0);
   textAlign(CENTER);
   textFont(f);
   textSize(25);
   
   //yousing this to make the text appear to be flashing 
   if(time % 5 == 0)
   {
   
   }
   else
   {
     text("Pressing any key to start the game",670,350);
   }
   
   //pressing any key on the key board makes the game commence
   if(keyPressed == true)
   {
     stage = 2;
   }
  }
  
  
  if(stage == 2)
  {
  //scaling the game down because I draw using pshpe vextors.
  scale(0.5);
  background(255);
 
  
  
 
  //running through everything in the physics array list
  for (int i = physics.size() -1 ; i >= 0  ; i --)
  {
    Physics phy = physics.get(i); 
    phy.update();
    phy.render();    
  }
  
 
  
  }
  
  //the timer thats keeps getting incremnted to keep cetain game functions running 
  time++;
  
  
}
    









  
 