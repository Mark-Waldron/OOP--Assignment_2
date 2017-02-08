abstract class Physics
{
  //drift and glide machanics
  PVector drift;
  float power = 100;
  float fireRate = 2;
  float toPass = 1.0 / fireRate;
  float elapsed = toPass;
  float timeDelta = 1.0f / 60.0f;
  PVector pos;
  PVector forward;
  PVector velocity;
  PVector accel;
  
  //rotate object
  float theta;
  float size;
  float radius;
  float mass = 1;
  
  //moves the point around the frount axcel
  int x_axis = -70;
  int y_axis = -340;
  
  //controll variables 
  char left, right;
  
  //runs the methods 
  abstract void update();  
  abstract void render();
    
}