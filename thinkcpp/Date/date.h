// how to organize files
#ifndef DATE_H
#define DATE_H 

class Date {
    public:
    Date(int = 1, int = 2000);

    void setMonth(int);
    void setYear(int);

    int getMonth();
    int getYear();

    void displayDate();
    
    private:
    int month;
    int year;
};
#endif 
