// roll a dice
void setup() {
  println("ready to roll!");
  rollDice(20);
  rollDice(20);
  rollDice(20);
  rollDice(6);
  println("finished");
}

void rollDice(int numSides) {
  int d = 1 + int(random(numSides));
  println("rolling... " + d);
}
