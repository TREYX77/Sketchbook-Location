int output = 0;
int x1 = 0;
int x2 = 1;

for(int i = 0; i < 30; i++){
  output = x1 + x2;
  println(output);
  x1 = x2;
  x2 = output;
  
}
