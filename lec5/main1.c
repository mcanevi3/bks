#include <stdio.h>
#include <math.h>
//ulimit -s
int main()
{
    int len=8176*1024-10*1024;
    printf("len:%d\n",len);
    char dizi[len];
    int i=0;
    for(i=0;i<len;i++)
    {
        dizi[i]='x';
    }

    return 0;
}