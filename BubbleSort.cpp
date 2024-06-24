#include <cstdio> // scanf e printf

#define MAXN 1100 // defino que MAXN é 1100

int n, a, b, vetor[MAXN]; // declaro as variáveis que vou usar

void bubble_sort(){ // declaro a função void buble_sort
    int ordenado=0; // inicializo "ordenado" como 0, para que o loop comece     
    while(ordenado==0){ // enquanto ordenado for 0        
        ordenado=1; // suponho que o vetor estáordenado
         
        for(int i=1; i<n; i++) // e checo para todas as posições, exceto a última
            if(vetor[i]>vetor[i+1]){ // se não há inversão entre vetor[i] e vetor[i+1]
                
				// se houver, troco os valores de vetor[i] e vetor[i+1]
                int tmp=vetor[i];
                vetor[i]=vetor[i+1];
                vetor[i+1]=tmp;
                
				ordenado=0; // e salvo que o vetor não está ordenado
            }
    }
}

int main(){	
	scanf("%d", &n); // leio o valor de n	
	for(int i=1; i<=n; i++) scanf("%d", &vetor[i]); // leio os elementos do vetor	
	bubble_sort(); // chamo a bubble_sort
	for(int i=1; i<=n; i++) printf("%d ", vetor[i]); // imprimo os elementos do vetor, que agora estarão ordenados
	printf("\n"); // e imprimo uma quebra de linha no fim da entrada
	return 0;
}