#include <stdio.h>

int main()
{
    char dizi[3]={'a','b','c'};
    char* adres=&dizi[0];
    int i;
    for(i=0;i<3;i++)
    {
        printf("address:%p\n",adres+i);
    }
    return 0;
}