#include <stdio.h>
float toplam=0;
float ekle(float);
void yazdir();
int main(void)
{
    ekle(1.25f);
    yazdir();
    ekle(2.0f);
    yazdir();
    return 0;
}
float ekle(float sayi){return toplam+=sayi;}
void yazdir()
{
    printf("%f\n",toplam);
}
