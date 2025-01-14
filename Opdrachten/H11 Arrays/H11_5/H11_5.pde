String Znaam = "Jan";
Boolean gevonden = false;
String[] naam = {"Jan", "Boris", "Geert", "nogiemand"};

void setup(){
  for(int i = 0; i < naam.length; i++){
    if(Znaam == naam[i]){
    gevonden = true;
    }
  }   
  
   if(gevonden);
  println(gevonden);

 }
 
