class Rectangle {
  float x, y;  
  float width, height; 
  

  Rectangle(float x, float y, float width, float height) {
    this.x = x;
      this.y = y;
      this.width = width;
      this.height = height;
  }
  

  void draw() {
    rect(x, y, width, height);
  }
}

void setup() {
  size(400, 400); 
  background(255); 
  
  
  Rectangle rect1 = new Rectangle(50, 50, 100, 150);
    Rectangle rect2 = new Rectangle(200, 100, 80, 120);
     Rectangle rect3 = new Rectangle(300, 200, 50, 50);
  
  fill(0); 
  rect1.draw();
  
  fill(73,221,251); 
  rect2.draw();
  
  fill(223, 123, 0); 
  rect3.draw();
}
