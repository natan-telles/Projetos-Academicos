#vetor com 10 posições
numeros = [0,1,2,3,4,5,6,7,8,9]

#mostra os numeros percorrendo o vetor
for i in range(10):
    print(numeros[i])

print()
    
#comeca um laço no 1, e outro no 2 para comecar as comparações
for i in range(10):
    for l in range(i+1,10):
        if numeros[l] > numeros[i]:
            aux = numeros[i]
            numeros[i] = numeros[l]
            numeros[l] = aux
            
#reeordenado em ordem decrescente por exemplo
for i in range(10):
    print(numeros[i])


