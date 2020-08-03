#include <stdio.h>
int main(int argc, char *argv[])
{
    int distance = 100;
    float power = 2.345f;
    double super_power = 56789.4532;
    char initial = 'A';
    char first_name[] = "zed";
    char last_name[] = "shaw";

    printf("you are %d miles away.\n", distance);
    printf("you have %f levels of power.\n", power);
    printf("you have %f awesome super powers.\n", super_power);
    printf("i have an initial %c.\n", initial);
    printf("i have a first name %s.\n", first_name);
    printf("i have a last name %s.\n", last_name);
    printf("my whole name is %s %c. %s. \n", 
            first_name, initial, last_name);

    int bugs = 100;
    double bug_rate = 1.2;
    printf("you have %d bugs at the imagineary rate of %f.\n", 
            bugs, bug_rate);
    long universe_of_defects = 1L * 1024L * 1024L * 1024L;
    printf("the entire universe has %ld bugs.\n", universe_of_defects);

    double expected_bugs = bugs * bug_rate;
    printf("you are expeced to have %f bugs.\n", expected_bugs);
    double part_of_universe = expected_bugs / universe_of_defects;
    printf("that is only a %e portion of the universe.\n", part_of_universe);
    // just a demo
    char nul_byte = '\0';
    int care_percentage = bugs * nul_byte;
    printf("which means you should care %d%%.\n", care_percentage);

    return 0;
    
}