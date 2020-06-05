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
    set <int> setInts{202, 151, -999, -1};
    setInts.insert(-1);
    cout << "contents of the set: " << endl; 
    DisplayContents(setInts); 

    multiset <int> msetInts;
    msetInts.insert(setInts.begin(), setInts.end());
    msetInts.insert(-1); // duplicate 

    cout << "contents of the multiset: " << endl; 
    DisplayContents(msetInts);

    cout << "number of instances of '-1' in the multiset are: '";
    cout << msetInts.count(-1) << "'" << endl;   

    return 0;
}