size(200,200);
background(255,255,255);

int sizeC = 100;

for(int i = 0; i < 5; i++){
  ellipse(100, 100, sizeC,sizeC);
  sizeC = sizeC - 20;
}

line(90,100,110,100); //refference van 10
