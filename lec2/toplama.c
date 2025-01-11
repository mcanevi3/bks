#include <stdio.h>
float topla(float x,float y){return x+y;}
void yazdir(float x,float y,float z)
{
    printf("%f+%f=%f\n",x,y,z);
}
int main(void)
{
    float a=3,b=4,toplam=0;
    toplam=topla(a,b);
    yazdir(a,b,toplam);
    return 0;
}