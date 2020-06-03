#include <deque>
#include <iostream>
#include <algorithm>

int main() {
    using namespace std;
    deque<int> intDeque;

    intDeque.push_back(3); // bottom
    intDeque.push_back(4);
    intDeque.push_back(5);

    intDeque.push_front(2); // top
    intDeque.push_front(1);
    intDeque.push_front(0);

    // display
    for (size_t count = 0; count < intDeque.size(); ++ count) {
        cout << "element [" << count << "] = ";
        cout << intDeque[count] << endl; 
    }
    cout << endl; 

    intDeque.pop_front();
    intDeque.pop_back(); 

    cout << "after erasing: " << endl;

    for (auto element = intDeque.begin(); element != intDeque.end(); ++element) {
        size_t Offset = distance(intDeque.begin(), element);
        cout << "element [" << Offset << "] = " << *element << endl;
    }

    cout << "clear the deque content: " << endl;
    intDeque.clear();
    if (intDeque.empty()) 
        cout << "the container is now empty" << endl;

    return 0;
}