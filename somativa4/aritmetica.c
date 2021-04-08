#include <stdio.h>
#include <string.h>

int main() {

    unsigned int N1, N2, N3, check = 1;
    unsigned int expoente = 1;

    scanf("%u %u %u", &N1, &N2, &N3);

    for(int i = 2; i * i <= N3; i++) {
        if(N3 % i == 0) {
            check = 0;
        }
    }

    int n1 = N1 % N3;
    int n2 = N2;

    while(n2 > 0) {
        if(n2 % 2 == 1) {
            expoente = (expoente * n1) % N3; // expoente *= n1 % N3
        }
        n2 = n2 / 2;
        n1 = (n1 * n1) % N3; 
    }

    if(N1 > 65535 || N2 > 65535 || N3 > 65535)
        printf("Entradas invalidas.\n");
    else if(check != 1)
        printf("O modulo nao eh primo.\n");
    else
        printf("A exponencial modular %d elevado a %d (mod %d) eh %d.\n", N1, N2, N3, expoente);

    return 0;
}