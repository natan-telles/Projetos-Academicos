#include<stdio.h>
#define MAX 100100
int tam, vetor[MAX],vetorOrdenado[MAX];

void merge(int v[], int inicio, int meio, int fim, int aux[]){
    // conquista

    
    int i = inicio, j = meio+1, k = inicio;
    while (i <= meio && j <= fim) {
        if (v[i] <= v[j]) {
            aux[k] = v[i];
            i++;
            k++;
        } else {
            aux[k] = v[j];
            j++;
            k++;    
        }
    }
    
    // se a metade inicial não foi toda consumida, faz o append.
    while (i <= meio) {
        aux[k] = v[i];
        i++;
        k++;
    }
    while(j <= fim){
        aux[k] = v[j];
        j++;
        k++;
    }
    for (int p = inicio; p <= fim; p++) {
        v[p] = aux[p];
    }
}

void mergeSort(int v[],int inicio, int fim, int aux[]){
    // divisao

    // chamada recursiva (chama ela mesma)
    if(inicio < fim){
        int meio = (inicio+fim)/2;
        mergeSort(v,inicio,meio,aux);
        mergeSort(v,meio+1,fim,aux);
        merge(v,inicio,meio,fim,aux);
    }
}

main(){
    scanf("%d",&tam);
    for(int i=0;i<tam;i++) scanf("%d",&vetor[i]);
    for(int i=0;i<tam;i++) printf("%d ",vetor[i]);
    printf("\n");
    mergeSort(vetor,0,tam-1,vetorOrdenado);
    for(int i=0;i<tam;i++) printf("%d ",vetorOrdenado[i]);
}