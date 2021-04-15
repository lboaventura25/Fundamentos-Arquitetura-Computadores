#include <stdio.h>

int main() {

    int N;
    float numero, peso, resultado = 0.0;

    scanf("%d", &N);

    for(int i = 0; i < N; i++) {
        scanf("%f %f", &numero, &peso);

        resultado += (numero * peso);
    }

    printf("%f\n", resultado);

    return 0;
}