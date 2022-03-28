// vectors in cpp 
// https://runestone.academy/ns/books/published/thinkcpp/Chapter10/toctree.html

#include <iostream>
#include <vector>

using namespace std; 
int main(){
    vector<int> values;
    int c, i, len;
    cin >> c; 

    while (c != -1) {
        values.push_back(c);
        cin >> c;
    }
    len = values.size();
    cout << "your input vector: " << endl;
    for (i=0; i < len; i++) {
        cout << values[i] << endl;
    }
    
    return 0;
}