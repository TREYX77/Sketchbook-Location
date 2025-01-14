String[] choices = {"Rock", "Paper", "Scissors"};
String playerChoice = "";
String computerChoice = "";
String result = "";

void setup() {
  size(400, 400); 
  textAlign(CENTER, CENTER); 
  textSize(20); 
}

void draw() {
  background(255,130,200); 


  fill(0); 
  text("Press 1 for Rock, 2 for Paper, 3 for Scissors", width / 2, height / 2 - 100);


  text("Your choice: " + playerChoice, width / 2, height / 2 - 50);
  text("Computer's choice: " + computerChoice, width / 2, height / 2);


  text(result, width / 2, height / 2 + 50);
}

void keyPressed() {
 
  if (key == '1' || key == '2' || key == '3') {
    int playerIndex = key - '1'; 
    playerChoice = choices[playerIndex];

   
    int computerIndex = int(random(3)); 
    computerChoice = choices[computerIndex]; 

  
    result = determineWinner(playerIndex, computerIndex);
  }
}

String determineWinner(int playerIndex, int computerIndex) {
 
  if (playerIndex == computerIndex) {
    return "Tie";
  }
 
  else if ((playerIndex == 0 && computerIndex == 2) ||
           (playerIndex == 1 && computerIndex == 0) || 
           (playerIndex == 2 && computerIndex == 1)) { 
    return "W";
  }
 
  else {
    return "L";
  }
}


//https://youtu.be/DyqMglmrido?si=WLdIzyhwDorH3OtC klein hulp
