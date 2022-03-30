// vectors in cpp 
// https://www.cplusplus.com/reference/algorithm/find/
#include <iostream>
#include <algorithm>
#include <vector> 

using namespace std; 
int main(){
    int myints [] = { 10, 20, 30, 40 };
    int *p; 
    p = find(myints, myints+4, 30);
    if (p != myints + 4)
        cout << "element found in myints: " << *p << '\n';
    else 
        cout << "element not found in myints\n"; 
    
    // use vector and iterator 
    vector<int> myvector (myints, myints+4);
    vector<int>::iterator it; 
    it = find(myvector.begin(), myvector.end(), 30);

    if (it != myvector.end())
        cout << "element found: " << *it << endl; 
    else 
        cout << "element not found" << endl;

    return 0;
}