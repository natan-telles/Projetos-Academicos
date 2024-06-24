#include<stdio.h>
int n,fatorado;

int fatorial(int num){
    if(num == 1){
        return 1;
    }
    return (num * fatorial(num-1));
}

main(){
    scanf("%d",&n);
    fatorado = fatorial(n);
    printf("Fatorial de %d = %d",n,fatorado);
}
