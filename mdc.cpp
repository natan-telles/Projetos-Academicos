#include<stdio.h>

void somaMDC(int A, int B){
    int a,b,r,soma = 0;
    a = A;
    b = B;
    r = a%b;
    soma += r;
    while(r != 0){
        a = b;
        b = r;
        r = a%b;
        soma += r;
    }

    printf("Soma = %d ",soma);
}
main(){
    somaMDC(240,54);
    somaMDC(228,95);
}

// 1) 7
// 2) 30
// 3) 220
// 4) 8
// 5) 57
// 6) 300
