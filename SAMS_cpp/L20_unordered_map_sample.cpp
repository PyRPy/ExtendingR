#include <unordered_map>
#include <iostream>
#include <string>
using namespace std; 

template <typename T1, typename T2> 
void DisplayContents (unordered_map<T1, T2>& cont) {
    cout << "unordered map contains: " << endl;
    for (auto element = cont.cbegin();
        element != cont.cend(); 
        ++ element )
    cout << element->first << " -> " << element->second << endl; 
    cout << "number of pairs, size(): " << cont.size() << endl; 
    cout << "bucket count = " << cont.bucket_count() << endl; 
    cout << "current load factor: " << cont.load_factor() << endl; 
    cout << "max load factor = " << cont.max_load_factor() << endl;

}

int main() {
    unordered_map<int, string> umapIntToStr;
    umapIntToStr.insert(make_pair(1, "One"));
    umapIntToStr.insert(make_pair(45, "Forty Five"));
    umapIntToStr.insert(make_pair(1001, "Thousand One"));
    umapIntToStr.insert(make_pair(-2, "Minus Two"));
    umapIntToStr.insert(make_pair(-1000, "Minus One Thousand"));
    umapIntToStr.insert(make_pair(100, "One Hundred"));
    umapIntToStr.insert(make_pair(12, "Twelve"));
    umapIntToStr.insert(make_pair(-100, "Minus One Hundred"));

    DisplayContents<int, string>(umapIntToStr);
    cout << "inserting one more element" << endl; 
    umapIntToStr.insert(make_pair(300, "three hundred"));
    DisplayContents<int, string>(umapIntToStr); 

    cout << "enter key to find: ";
    int key = 0;
    cin >> key; 

    auto element = umapIntToStr.find(key);
    if (element != umapIntToStr.end()) {
        cout << "key " << element->first << " points to value: ";
        cout << element->second << endl;
    } else {
        cout << "sorry, pair with key " << key << " not in map" << endl; 
    }


    return 0;
}