class Liquid {
  float x,y,w,h,c;
  
  Liquid() {
    w = random(width*0.1,width);
    h = random(height*0.1,height*0.4);
    x = random(0,width - w);
    y = height - h;
    c = random(1.5,3);
  }

  
  
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0,127);
    rect(x,y,w,h);
  }
  
  void ShowC(){
    print("Fluide : " + c);
    println();
  }
}