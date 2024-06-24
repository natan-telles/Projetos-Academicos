#include<stdio.h>
#define MAX 100100
int tam1, tam2, vetor1[MAX], vetor2[MAX], uniaoVetores[MAX];

void mergeSort(int v[],int v2[],int t1,int t2){
    int i = 0, j = 0, k = 0;
    int tamanhoVetor1 = t1;
    int tamanhoVetor2 = t2;

    while(i < tamanhoVetor1 && j < tamanhoVetor2){
        if(v[i] < v2[j]){
            uniaoVetores[k] = v[i];
            i++;
            k++;
        }else{
            uniaoVetores[k] = v2[j];
            j++;
            k++;
        }
    }

    while(i < tamanhoVetor1){
        uniaoVetores[k] = v[i];
        i++;
        k++;
    }
    while(j < tamanhoVetor2){
        uniaoVetores[k] = v2[j];
        j++;
        k++;
    }

}

int main(){
    scanf("%d",&tam1);
    scanf("%d",&tam2);
    for(int i=0; i<tam1 ;i++) scanf("%d",&vetor1[i]);
    for(int i=0; i<tam2 ;i++) scanf("%d",&vetor2[i]);

    for (int i = 0; i < tam1 - 1; i++) {
        for (int j = i + 1; j < tam1; j++) {
            if (vetor1[i] > vetor1[j]) {
                int temp = vetor1[i];
                vetor1[i] = vetor1[j];
                vetor1[j] = temp;
            }
        }
    }
    for (int i = 0; i < tam2 - 1; i++) {
        for (int j = i + 1; j < tam2; j++) {
            if (vetor2[i] > vetor2[j]) {
                int temp = vetor2[i];
                vetor2[i] = vetor2[j];
                vetor2[j] = temp;
            }
        }
    }

    mergeSort(vetor1,vetor2,tam1,tam2);
    for(int i=0;i<tam1+tam2;i++) printf("%d",uniaoVetores[i]);
    return 0;
}