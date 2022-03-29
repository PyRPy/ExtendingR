// vectors in cpp 
// http://www.math.uaa.alaska.edu/~afkjm/csce211/handouts/SeparateCompilation.pdf
// in cmd terminal : g++ main.cpp Time.cpp then run a.exe

#include <iostream>
using namespace std; 
#include "Time.h"

int main() {
    Time currentTime(9, 14, 30.0);
    currentTime.increment(500.0);
    currentTime.print();
    
    return 0;
}