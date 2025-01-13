size(400, 400); 
  background(255,255,255);
  
  for (int i = 0; i < 10; i++) {
    int x1 = i * 40 + 20;
    int x2 = i * 40 + 20; 
    int y1 = 0; 
    int y2 = 400; 
    
    println(x1 + " | " + y1 + " | " + x2 + " | " + y2); 
    line(x1, y1, x2, y2); 
  }
