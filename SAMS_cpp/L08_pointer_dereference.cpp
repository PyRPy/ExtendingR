#include <iostream>
using namespace std;

int main() {
    int age = 30;
    int dogsAge = 9;

    cout << "integer age = " << age << endl; 
    cout << "integer dogsage = " << dogsAge << endl; 

    int* pointsToInt = &age; 
    cout << "pointsToInt points to age" << endl; 

    cout << "pointsToInt = 0x" << hex << pointsToInt << endl; // pointer
    cout << "*pointsToInit = " << dec << *pointsToInt << endl; // value pointed 

    pointsToInt = &dogsAge;
    cout << "pointsToInt poinst to dogsAge now" << endl; 
    cout << "pointsToInt = 0x" << hex << pointsToInt << endl; 
    cout << "*pointsToInt = " << dec << *pointsToInt << endl; 

    return 0;
}