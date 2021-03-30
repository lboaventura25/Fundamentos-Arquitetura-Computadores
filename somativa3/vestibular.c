#include <stdio.h>

int main() {

    int N, contador = 0;
    char gabarito[1000], resposta[1000];

    scanf("%d", &N);
    getchar();

    for(int i = 0; i < N; i++) {
        scanf("%c", &gabarito[i]);
    }

    getchar();

    for(int i = 0; i < N; i++) {
        scanf("%c", &resposta[i]);
    }

    for(int i = 0; i < N; i++) {
        if(gabarito[i] == resposta[i])
            contador++;
    }

    printf("%d\n", contador);

    return 0;
}