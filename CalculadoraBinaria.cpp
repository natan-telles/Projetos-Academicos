#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#define MAX_BINARY_DIGITS 20

int main() {
    char binary[MAX_BINARY_DIGITS + 1]; // Vetor para armazenar o número binário (limite máximo + caractere nulo)
    int funcao = 0;
    int i, retorno, retorno2, retorno3;
    
    printf("1 = decimal para binario\n2 = binario para decimal\n3 = sair\n");
    while (funcao != 3) {
    	
        printf("\nDigite para escolher a funcao: [1, 2 ou 3]\n");
        scanf("%d", &funcao);
        while (funcao != 1 && funcao != 2 && funcao != 3) {
            printf("DIGITE VALOR ADEQUADO: [1, 2 ou 3]\n");
            retorno3 = scanf("%d", &funcao);
            if(retorno3 == 0){
            	//printf("DIGITE VALOR ADEQUADO: [1, 2 ou 3]\n");	
            	fflush(stdin);
			}else{
				retorno3 = 1;
			}
            
            if (funcao == 3) {
                break;
            }
        }
		// Função 1
        if (funcao == 1) {
        	system ("cls");
        	printf("1 = decimal para binario\n2 = binario para decimal\n3 = sair\n\n");
        	
            int decimal, binario = 0, resto, digito = 1;

            printf("Digite um numero decimal: [0 < n < 9999]\n");
            do {
                retorno = scanf("%d", &decimal);
                if (retorno == 0) {
                    printf("Digite apenas numeros!\n");
                    fflush(stdin);
                } else {
                    retorno = 1;
                }
            } while (retorno == 0);

            while (decimal > 9999 || decimal < 0) {
                printf("Entrada invalida. Digite dentro da margem estipulada!\n");
                scanf("%d", &decimal);
            }
			// Trabsforma em binario
            while (decimal > 0) {
                resto = decimal % 2;
                decimal = decimal / 2;
                binario = binario + resto * digito;
                digito = digito * 10;
            }

            printf("O numero em binario e: %d\n", binario);
        // Função 2
        } else if (funcao == 2) {
        	system ("cls");
        	printf("1 = decimal para binario\n2 = binario para decimal\n3 = sair\n\n");
            int decimal2 = 0, binario2 = 0, resto2;
            printf("Digite um numero binario: ");
            scanf("%20s", binary);


            // Verifica cada dígito do número binário
            for (i = 0; binary[i] != '\0'; i++) {
                while (binary[i] != '0' && binary[i] != '1') {
                    printf("Valor invalido. Digite apenas numeros binarios!\n");
                    scanf("%20s", binary);
                }
            }

			// Transforma em decimal
            int tamanho = i;
            for (i = tamanho - 1; i >= 0; i--) {
                resto2 = binary[i] - '0';
                decimal2 += resto2 * pow(2, tamanho - 1 - i);
            }

            printf("O numero correspondente em decimal = %d\n", decimal2);
            decimal2 = 0;
        }
    }
    return 0;
}
