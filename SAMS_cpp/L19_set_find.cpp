#include <iostream>
#include <set>
using namespace std;

template <typename T> 
void DisplayContents(const T& container) {
    for (auto element = container.cbegin();
        element != container.cend();
        ++ element) 
        cout << * element << ' ';
    cout << endl; 
}

int main() {
    set<int> setInts{43, 78, -1, 124};
    DisplayContents(setInts);

    auto elementFound = setInts.find(-1);
    if (elementFound != setInts.end())
        cout << "element " << *elementFound << " found!" << endl;
    else 
        cout << "element not found in set!" << endl;
        
    return 0;
}