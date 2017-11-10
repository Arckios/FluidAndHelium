Mover[] movers = new Mover[50];
Mover Balloon;
Liquid liquid;
Float Wind = 0.0;
boolean LiquidShow = false;
boolean keypressed = false;

void setup() {
  size(800, 600);
  
  //Ball
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(2, 4), random(width), random(height));
  }
  
  //Balloon
  Balloon = new Mover(random(4,6),random(width),height/2);
  
  //Liquid
  liquid = new Liquid();
}

//Wind Button
void ButtonClickAction()
{
    if (mousePressed && mouseButton == LEFT) {
      Wind = 0.1;
    }
    else if (mousePressed && mouseButton == RIGHT) {
     Wind = -0.1;
    } 
    else{
      Wind = 0.0;
    }
}

void draw() {
  
  background(255);
  
   if(LiquidShow){
    liquid.display();
   }
   
  //Ball
  for (int i = 0; i < movers.length; i++) {
    
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    PVector wind = new PVector(Wind,0);
    float c = 0.05;

    movers[i].applyForce(gravity);
    movers[i].applyForce(wind);
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
    ButtonClickAction();
    
  //Liquid
    if(LiquidShow){
      if (movers[i].isInside(liquid)) {
        movers[i].drag(liquid);
      }
    }
  }
  
  //Balloon
      PVector gravity2 = new PVector(0, -0.05*Balloon.mass);
      PVector wind = new PVector(Wind,0);
      float c = 0.05;
      
      Balloon.applyForce(gravity2);
      Balloon.applyForce(wind);
      Balloon.update();
      Balloon.display();
      Balloon.checkEdges();
      ButtonClickAction();
}

//Key
  void keyPressed() {
    if (key == ' ' &&  keypressed == false) {
      keypressed = true;
      if(!LiquidShow){
      liquid = new Liquid();
      liquid.ShowC();
      }
      LiquidShow = !LiquidShow;
    }
    if(key == 'r'){
      LiquidShow = false;
      setup();
    }
  }
  
  void keyReleased(){
    keypressed = false;
  }