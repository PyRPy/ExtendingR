// 08_struct_point.cpp 
#include <iostream> 
#include <cmath> 
using namespace std; 

struct Point {
    double x, y;
}; 

int main() {
    Point blank;
    blank.x = 3.0;
    blank.y = 4.0;
    cout << blank.x << ", " << blank.y << endl; 
    double distance = sqrt(blank.x * blank.x + blank.y * blank.y);
    cout << distance << endl; 
}