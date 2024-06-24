#include<stdio.h>
#include<string.h>
int pontosturno[4][2], totalpontos[4], desempate1=2;
char times[4][20], classificacao[4][20];
int x,y,turno = 1;
char campeao[20], vicecampeao[20], piortime[20];

void  trocar_posicao(){
    int temp_pontos = totalpontos[x];
    char temp_time[20];
    strcpy(temp_time, times[x]);

    totalpontos[x] = totalpontos[y];
    strcpy(times[x], times[y]);

    totalpontos[y] = temp_pontos;
    strcpy(times[y], temp_time);   
}

main(){	
	printf("DIGITE OS NOMES DOS 4 TIMES PARTICIPANTES: \n");
	for (x=0;x<=3;x++){
		gets(times[x]);
	}
	printf("\n\n");
	
	printf("DIGITE AS PONTUACOES EM CADA TURNO: \n\n");
	for (y=0;y<=1;y++){
		printf("Pontuacao do %d turno: \n",turno);
		for (x=0;x<=3;x++){
			printf("%s : ",times[x]);
			scanf("%d",&pontosturno[x][y]);
			totalpontos[x] = totalpontos[x] + pontosturno[x][y];	
		}
		turno++;
		printf("\n\n");
	}		
	printf("===========================================================");
	printf("\n\n");
	
	printf("PONTUACAO TOTAL DOS TIMES: \n\n");
	for(x=0;x<=3;x++){
		printf("%s | 1o turno: %d | 2o turno: %d | TOTAL: %d\n",times[x], pontosturno[x][0], pontosturno[x][1], totalpontos[x]);
	}
	printf("\n\n");
	printf("CLASSIFICACAO FINAL DO CAMPEONATO: \n\n");
	
	//classificação
	for (x = 0; x < 3; x++) {
        	for (y = x + 1; y < 4; y++) {
            		if (totalpontos[y] > totalpontos[x]) {
                		trocar_posicao();
            		}   			    
            		//desempate pelo 2º turno     	    
            		if(totalpontos[y] == totalpontos[x]){
    				if(pontosturno[y][1] > pontosturno[x][1]){
        				trocar_posicao();
    				} 
    			}
		}
    	}
    
    // Preencher a classificação com os times ordenados
    for (x = 0; x < 4; x++) {
        strcpy(classificacao[x], times[x]);
        if(x==0){
        	strcpy(campeao,times[x]);
		} else if(x==1){
			strcpy(vicecampeao,times[x]);
		} else if(x==3){
			strcpy(piortime,times[x]);
		}
    }
    
    for (x = 0; x < 4; x++) {
    	int pos = x+1;
        printf("%dº - %s : %d\n", pos,classificacao[x], totalpontos[x]);
    }
	
	printf("\n");
	printf("Campeao:      %s [%d pts]\n",campeao,totalpontos[0]);	
	printf("Vice-campeao: %s [%d pts]\n",vicecampeao,totalpontos[1]);
	printf("Pior time:    %s [%d pts]\n",piortime,totalpontos[3]);			
}
