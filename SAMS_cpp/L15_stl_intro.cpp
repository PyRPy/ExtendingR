// STL_intro.cpp
#include <iostream>
#include <vector> 
#include <algorithm>
using namespace std;

int main() {
    vector <int> intArray;

    // create an array of integers
    intArray.push_back(50);
    intArray.push_back(2991);
    intArray.push_back(23);
    intArray.push_back(9999);

    cout << "the content of the vector is: " << endl;

    // using an iterator 
    vector <int>::iterator arrIterator = intArray.begin();
    while (arrIterator != intArray.end()) {
        cout << *arrIterator << endl;
        ++ arrIterator;            
    }

    // find the element using algorithm 
    vector <int>::iterator eleFound = find(intArray.begin(), intArray.end(), 2991); 
    if (eleFound != intArray.end()) {
        int elePos = distance(intArray.begin(), eleFound); 
        cout << "value " << *eleFound;
        cout << " found in the vector at position: " << elePos << endl;
    }

    return 0;

}