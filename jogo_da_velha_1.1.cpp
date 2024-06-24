#include<stdio.h>
#include<string.h>
#include<stdlib.h>

char t[3][3];
int i, j, ultima_jogada,posicao,playagain = 1;
char player1[10], player2[10], jogador,winner[10];

void zerar_tabuleiro(){
	for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            t[i][j] = '.';
        }
    }
    ultima_jogada = 9;
}

void mostrar_tabuleiro() {
    printf("\n\t\t\t\t\t\tPosicoes   |   Tabuleiro\n");
    printf("\t\t\t\t\t\t           |            \n");
    printf("\t\t\t\t\t\t0 | 1 | 2  |   %c | %c | %c \n", t[0][0], t[0][1], t[0][2]);
    printf("\t\t\t\t\t\t3 | 4 | 5  |   %c | %c | %c \n", t[1][0], t[1][1], t[1][2]);
    printf("\t\t\t\t\t\t6 | 7 | 8  |   %c | %c | %c \n", t[2][0], t[2][1], t[2][2]);
    printf("\t\t\t\t\t\t           |            \n");
}

void converter_posicoes() {
    if (posicao == 0 && t[0][0] == '.') {
        t[0][0] = jogador;
    } else if (posicao == 1 && t[0][1] == '.') {
        t[0][1] = jogador;
    } else if (posicao == 2 && t[0][2] == '.') {
        t[0][2] = jogador;
    } else if (posicao == 3 && t[1][0] == '.') {
        t[1][0] = jogador;
    } else if (posicao == 4 && t[1][1] == '.') {
        t[1][1] = jogador;
    } else if (posicao == 5 && t[1][2] == '.') {
        t[1][2] = jogador;
    } else if (posicao == 6 && t[2][0] == '.') {
        t[2][0] = jogador;
    } else if (posicao == 7 && t[2][1] == '.') {
        t[2][1] = jogador;
    } else if (posicao == 8 && t[2][2] == '.') {
        t[2][2] = jogador;
    }
}

int fimpartida(){
	if( t[0][0] != '.' && t[0][1] != '.' && t[0][2] != '.' &&
    	t[1][0] != '.' && t[1][1] != '.' && t[1][2] != '.' &&
    	t[2][0] != '.' && t[2][1] != '.' && t[2][2] != '.'){
    		return 1;
		}
	
	
	 if ((t[0][0] == 'X' && t[0][1] == 'X' && t[0][2] == 'X') ||
        (t[1][0] == 'X' && t[1][1] == 'X' && t[1][2] == 'X') ||
        (t[2][0] == 'X' && t[2][1] == 'X' && t[2][2] == 'X') ||
        (t[0][0] == 'X' && t[1][0] == 'X' && t[2][0] == 'X') ||
        (t[1][1] == 'X' && t[0][1] == 'X' && t[0][2] == 'X') ||
        (t[0][1] == 'X' && t[1][1] == 'X' && t[2][1] == 'X') ||
        (t[0][2] == 'X' && t[1][2] == 'X' && t[2][2] == 'X') ||
        (t[0][0] == 'X' && t[1][1] == 'X' && t[2][2] == 'X') ||
        (t[0][2] == 'X' && t[1][1] == 'X' && t[2][0] == 'X')) {
        strcpy(winner, player1);
        mostrar_tabuleiro();
        printf("\nJogador 1 (%s) CAMPEAO!\n",player1);
		return 1;
    }
    
    if ((t[0][0] == 'O' && t[0][1] == 'O' && t[0][2] == 'O') ||
        (t[2][0] == 'O' && t[2][1] == 'O' && t[2][2] == 'O') ||
        (t[1][0] == 'O' && t[1][1] == 'O' && t[1][2] == 'O') ||
        (t[0][0] == 'O' && t[1][0] == 'O' && t[2][0] == 'O') ||
        (t[1][1] == 'O' && t[0][1] == 'O' && t[0][2] == 'O') ||
        (t[0][1] == 'O' && t[1][1] == 'O' && t[2][1] == 'O') ||
        (t[0][2] == 'O' && t[1][2] == 'O' && t[2][2] == 'O') ||
        (t[0][0] == 'O' && t[1][1] == 'O' && t[2][2] == 'O') ||
        (t[0][2] == 'O' && t[1][1] == 'O' && t[2][0] == 'O')) {
        strcpy(winner, player2);
        mostrar_tabuleiro();
        printf("\nJogador 2 (%s) CAMPEAO!\n",player2);
		return 1;
    }
    
	return 0;	
}

int main() {
    zerar_tabuleiro();

    printf("Player 1 (X), digite o seu nome: ");
    scanf("%s", player1);
    printf("Player 2 (O), digite o seu nome: ");
    scanf("%s", player2);

    jogador = 'X';

    do {
        mostrar_tabuleiro();
        
        printf("\nPlayer %c - %s, \nescolha a posicao desejada: ", jogador,jogador == 'X' ? player1 : player2);
        scanf("%d", &posicao);
        while(posicao > 8 || posicao < 0 || posicao == ultima_jogada){
        	printf("Digite posicao valida!\n");
        	scanf("%d",&posicao);
		
		}
		ultima_jogada = posicao;
		
        converter_posicoes();
		
        jogador = (jogador == 'X') ? 'O' : 'X'; // Alternando entre os jogadores
        
	
		if(fimpartida() == 1){
			printf("Deseja jogar novamente? [1-SIM/2-NAO]\n");
	    	scanf("%d",&playagain);
	    	if(playagain == 1){
	    		zerar_tabuleiro();
	    		system("cls");
			}
		}
			
    } while (playagain == 1);
}
