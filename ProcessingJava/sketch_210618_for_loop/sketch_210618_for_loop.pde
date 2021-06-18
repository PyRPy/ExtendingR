// use a for loop
size(480, 120); // this window size is defined for textbook size
strokeWeight(8);
for (int i = 20; i < 400; i += 60) {
  line(i, 40, i + 60, 80);
}
