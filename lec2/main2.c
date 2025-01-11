#include <stdio.h>
float sin(float x)
{
    return x-x*x*x/(3.0f*2.0f)+x*x*x*x*x/(5.0f*4.0f*3.0f*2.0f);
}

int main(void)
{
    float PI=3.14f;
    float x=30;
    float y=0;
    y=sin(x*PI/180);
    printf("sin(%f)=%f\n",x,y);

    return 0;
}