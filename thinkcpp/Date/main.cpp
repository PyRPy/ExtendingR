#include <iostream>
#include "date.h" 
// https://www.cplusplus.com/forum/beginner/135636/
// how to organize files
int main() {
    int month;
    int year;

    Date startDate; // create a date object 

    std::cout << "\nEnter the start date" << std::endl;
    std::cout << "Month: ";
    std::cin  >> month; 
    std::cout << "year: ";
    std::cin >> year; 

    startDate.setMonth(month);
    startDate.setYear(year);

    startDate.displayDate();


    return 0;
}