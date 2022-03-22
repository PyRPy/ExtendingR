// hash table or map in cpp 
// https://runestone.academy/ns/books/published/cpp4python/CollectionData/toctree.html
#include <iostream>
#include <unordered_map>
#include <string>
using namespace std; 
int main(){
    unordered_map<string, string> spnumbers;

    // to match numbers in EN to ES
    spnumbers = {{"one", "uno"}, {"two", "dos"}};
    spnumbers["three"] = "tres";
    spnumbers["four"] = "cuatro";
    spnumbers["five"] = "cinco";

    cout << "one is ";
    cout << spnumbers["one"] << endl;
    cout << spnumbers.size() << endl;
    cout << "use a loop to print all keys and values: " << endl;
    for (auto i=spnumbers.begin(); i!=spnumbers.end(); i++){
        cout << i->first << ":";
        cout << i->second << endl;
    }

    return 0;
}