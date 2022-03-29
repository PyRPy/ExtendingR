#include <iostream>
#include "date.h"

// constructor
Date::Date(int m, int y) {
    setMonth(m);
    setYear(y);
}

// set functions
void Date::setMonth(int m) {
    if (m >=1 && m <= 12)
        month = m;
    else
        month = 1;
}

void Date::setYear(int y) {
    year = y;
}

// get functions 
int Date::getMonth() {
    return month;
}

int Date::getYear() {
    return year;
}

// member functions 
void Date::displayDate() {
    std::cout << month << "/" << year;
}