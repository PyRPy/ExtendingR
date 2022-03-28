// vectors in cpp 
// https://runestone.academy/ns/books/published/thinkcpp/Chapter10/toctree.html

#include <iostream>
#include <vector>
using namespace std; 

vector<int> randomVector(int n, int upperBound) {
    vector<int> vec(n);
    for (size_t i = 0; i < vec.size(); i++) {
        vec[i] = rand() % upperBound;
    }
    return vec;
}

void printVector(const vector<int>& vec) {
    for (size_t i = 0; i < vec.size(); i++) {
        cout << vec[i] << " ";
    }
}

int howMany(const vector<int>& vec, int value) {
    int count = 0;
    for (size_t i = 0; i < vec.size(); i++) {
        if (vec[i] == value) count++;
    }
    return count;
}

int main(){
    int numValues = 20;
    int upperBound = 10;
    int target = 5;
    srand(100);
    vector<int> vector = randomVector(numValues, upperBound);
    printVector(vector);
    cout << endl;
    cout << "the number " << target << " appears " << howMany(vector, target) << " times in our vector";
    
    // count all the numbers
    cout << "value\thowMany";
    for (int i = 0; i < upperBound; i++) {
        cout << i << '\t' << howMany(vector, i) << endl;
    }
    
    return 0;
}