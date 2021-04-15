#include <stdio.h>
#include <stdlib.h>


int main() {

    float custo_fabrica, final, lucro, impostos;
    int porcentagem_lucro, porcentagem_impostos;

    scanf("%f %d %d", &custo_fabrica, &porcentagem_lucro, &porcentagem_impostos);

    lucro = custo_fabrica * porcentagem_lucro;
    lucro = lucro / 100.0;

    impostos = custo_fabrica * porcentagem_impostos;
    impostos = impostos / 100.0;

    final = lucro + impostos;
    final = final + custo_fabrica;

    printf("%f\n", final);

    return 0;
}