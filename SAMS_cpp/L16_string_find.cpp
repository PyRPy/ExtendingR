#include <string>
#include <iostream>
int main() {
    using namespace std;
    string sampleStr ("good day string ! today is beautiful");
    cout << "sample string is:" << endl << sampleStr << endl << endl; 
    
    // find 'day'
    size_t charPos = sampleStr.find("day", 0);
    if (charPos != string::npos)
        cout << "first instance \"day\" at pos. " << charPos << endl;
    else 
        cout << "substring not found." << endl; 

    cout << "locating all instance of substring \"day\"" << endl; 
    size_t subStrPos = sampleStr.find("day", 0);
    while (subStrPos != string::npos) {
        cout << "\"day\" found at position " << subStrPos << endl; 

        size_t nSearchPosition = subStrPos + 1; 
        subStrPos = sampleStr.find("day", nSearchPosition);
    }
    return 0;

}