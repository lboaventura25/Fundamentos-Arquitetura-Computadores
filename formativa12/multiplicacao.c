#include <stdio.h>
#include <stdlib.h>

int main() {

    int primeiro, segundo, resultado = 0;
    char sinal = ' ';

    scanf("%d %d", &primeiro, &segundo);

    if(primeiro >= 0 && segundo < 0){
        sinal = '-';
        segundo = segundo * -1; // Unsigned
    }

    if(primeiro < 0 && segundo >= 0) {
        sinal = '-';
        primeiro = primeiro * -1; // Unsigned
    }

    while(primeiro >= 1) {
        if(primeiro % 2 != 0)
            resultado = resultado + segundo;

        segundo = segundo + segundo;
        primeiro = primeiro / 2;
    }

    if(sinal == '-')
        printf("%c%d\n", sinal, resultado);
    else
        printf("%d\n", resultado); 

    return 0;
}