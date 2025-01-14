String[] alphabet = new String[26]; // Array van lengte 26

void setup() {
  size(400, 400); // Stel de grootte van het canvas in
  background(255); // Stel de achtergrondkleur in (wit)
  fill(0); // Stel de tekstkleur in (zwart)
  textSize(20); // Stel de tekstgrootte in
  
  // Vul de array met de letters van het alfabet
  for (int i = 0; i < 26; i++) {
    alphabet[i] = char('A' + i) + ""; // Converteer naar string en voeg toe
  }
  
  // Teken de letters op het canvas
  for (int i = 0; i < alphabet.length; i++) {
    text(alphabet[i], 20 + (i %\ 10) * 35, 50 + (i / 10) * 40); // Plaats de letters in rijen
  }
}
