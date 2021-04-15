#include <stdio.h>

int main() {

    float distancia, tempo, media;

    scanf("%f %f", &distancia, &tempo);

    media = distancia / tempo;

    printf("%.2f\n", media);

    return 0;
}