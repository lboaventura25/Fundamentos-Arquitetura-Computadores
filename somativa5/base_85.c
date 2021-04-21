#include <stdlib.h>
#include <stdio.h>

int main() {

    int num, cont = 0;
    char base[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ. :+=^!/*?&<>()[]{}@%$#";

    scanf("%d", &num);

    while(num != 0) {
        int resto = num % 85;

        printf("%c\n", base[resto]);

        cont = cont + 1;
        num = num / 85;
    }

    return 0;   
}