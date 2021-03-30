#include <stdio.h>

int main() {

    int N;
    char string[1000];

    scanf("%d", &N);
    getchar();

    for(int i = 0; i < N; i++) {
        scanf("%c", &string[i]);
    }

    int inicio = 0, fim = N - 1, check = 1;

    while(inicio < fim) {
        if(string[inicio] != string[fim]) {
            check = 0;
            break;
        }
        fim -= 1; 
        inicio += 1;
    }

    printf("%d\n", check);

    return 0;
}