N = int(input())
i = 1

C = input()
V = int(input())
vencerdorNome = C
vencedorLance = V

while(i < N):
    C = input()
    V = int(input())
    if V > vencedorLance:
        vencedorNome = C
        vencedorLance = V
    i+=1

print(vencedorNome)
print(vencedorLance)

