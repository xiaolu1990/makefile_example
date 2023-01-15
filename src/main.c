#include "main.h"
#include <math.h>

int var = 0;

int main()
{
    printf("Hello World!\n");
    printf("sth\n");

    var = add(CONST_X, CONST_Y);

    printf("%d + %d = %d\n", CONST_X, CONST_Y, var);

    printf("CONST_Z = %d\n", CONST_Z);

    foo();

    double a = 2.0;
    double sqrt_a;
    sqrt_a = sqrt(a);
    printf("Square root of %.2lf is %.2lf \n", a, sqrt_a);

    return 0;
}