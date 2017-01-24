class Player
{
  PVector pos;
  PVector forward;
  PVector accel;
  float theta;
  float size;
  float radius;
  float mass = 1;

PShape shape;

void create()
{
  shape = createShape();
  shape.beginShape();
  shape.stroke(255);
  shape.noFill();
  shape.strokeWeight(10);
  shape.vertex(-radius, radius);
  shape.vertex(0, -radius);
  shape.vertex(0,0);
  shape.endShape(CLOSE);
}