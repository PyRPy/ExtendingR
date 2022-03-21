// vectors in cpp 
// Iterating through Vectors
#include <iostream>
#include <vector>
using namespace std; 
int main(){
    int nums[] = {1, 3, 6, 2, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    for (int index=0; index<numsSize; index++){
        cout << nums[index] << endl;
    }
    cout << "use new version of c++" << endl;
    // another way to print
    for (int item:nums) {
        cout << item << endl;
    }

    vector<int> intvector;
    intvector.reserve(50);

    for (int i=0; i<50; i++){
        intvector.push_back(i*i);
        cout << intvector[i] << endl;
    }
    // out of range
    for (int i=0; i<=50; i++){
        cout << intvector[i] << endl;
    }
    return 0;
}