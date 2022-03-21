// arry index in cpp and python
// https://runestone.academy/ns/books/published/cpp4python/CollectionData/Arrays.html
#include <iostream>
using namespace std;

int main() {
    int myArray[] = {2, 4, 6, 8};
    for (int i=0; i<4; i++){
        cout << myArray[i] << endl;
    }

    // print out the id / address of array
    for (int i=0; i<=8; i++){
        cout << myArray[i] << endl;
        cout << "id: " << &myArray[i] << endl;
    }

    // how to fix it
    int arrayLength = sizeof(myArray) / sizeof(myArray[0]);
     for (int i=0; i<=arrayLength; i++){
        cout << myArray[i] << endl;
        cout << "id: " << &myArray[i] << endl;
    }

    return 0;
}