abstract class Physics
{
  PVector force;
  float power = 100;
  float fireRate = 2;
  float toPass = 1.0 / fireRate;
  float elapsed = toPass;
  float timeDelta = 1.0f / 60.0f;
  
  PVector pos;
  PVector forward;
  PVector velocity;
  PVector accel;
  
  float theta;
  float size;
  float radius;
  float mass = 1;
  
  int x_axis = -70;
  int y_axis = -340;
  
  char left, right;
  int end = 400;
  
  abstract void update();  
  abstract void render();
    
}