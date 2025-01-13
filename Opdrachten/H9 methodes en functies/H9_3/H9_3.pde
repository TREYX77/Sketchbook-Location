int mijnGetal;


void setup() {
  println(GEM(19,30));
  mijnGetal = GEM(35,45);
  println(mijnGetal);
}

void draw(){
  
}

int GEM(int getal1, int getal2){
 int antwoord;
 
 antwoord = (getal1 + getal2)/2;
 return antwoord;
}
