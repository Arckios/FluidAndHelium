class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x , float y) {
    mass = m;
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0,127);
    ellipse(position.x,position.y,mass*16,mass*16);
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = width;
      velocity.x *= -0.9;
    } else if (position.x < 0) {
      position.x = 0;
      velocity.x *= -0.9;
    }

    if (position.y > height) {
      velocity.y *= -0.9;
      position.y = height;
    } else if (position.y < 0) {
      position.y = 0;
      velocity.y *= -0.9;
    }
  }
  
    boolean isInside(Liquid l) {
    if (position.x>l.x && position.x<l.x+l.w && position.y>l.y && position.y<l.y+l.h)
    {
      return true;
    } else {
      return false;
    }
  }
  
  void drag(Liquid l) {

    float speed = velocity.mag();
    float dragMagnitude = l.c/10 * speed * speed;

    PVector drag = velocity.get();
    drag.mult(-1);
    drag.normalize();

    drag.mult(dragMagnitude);

    // Apply the force.
    applyForce(drag);
  }

}