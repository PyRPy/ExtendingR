#include <iostream>
#include <unordered_set>
using namespace std;

template <typename T> 
void DisplayContents(const T& container) {
    cout << "unordered set contains: ";
    for (auto element = container.cbegin();
        element != container.cend();
        ++ element) 
        cout << * element << ' ';
    cout << endl; 

    cout << "number of elements, size() = " << container.size() << endl; 
    cout << "bucket count = " << container.bucket_count() << endl; 
    cout << "max load factor = " << container.max_load_factor() << endl; 
    cout << "load factor: " << container.load_factor() << endl << endl;
}

int main() {
    unordered_set<int> usetInts{1, -3, 2017, 300, -1, 989, -300, 9};
    DisplayContents(usetInts);

    usetInts.insert(999);
    DisplayContents(usetInts); 

    cout << "enter int you want to find in this set: ";
    int input = 0;
    cin >> input;
    
    auto elementFound = usetInts.find(input);
    if (elementFound != usetInts.end())
        cout << "element " << *elementFound << " found!" << endl;
    else 
        cout << "element not found in set!" << endl;
        
    return 0;
}