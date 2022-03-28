// vectors in cpp 
// https://runestone.academy/ns/books/published/thinkcpp/Chapter10/toctree.html

#include <iostream>
#include <cstdlib>
using namespace std; 
int main(){
    for (int i=0; i < 4; i++) {
        int x = rand();
        cout << x << endl;
    }

    // generate some random numbers between 0 and 9
    cout << "random number between 0 and 9: ";
    int upperBound = 9;
    for (int i=0; i < 10; i++) {
        int x = rand();
        int y = x % upperBound;
        cout << y << " ";
    }

    cout << " " << endl;
    cout << "random number between 0 and 1: ";
    for (int i = 0; i < 10; i++) {
        int x = rand();
        double y = double(x) / RAND_MAX;
        cout << y << " ";
    }
    
    return 0;
}