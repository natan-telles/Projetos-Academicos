"""
Restrições
•0 ≤ V ≤ 2000
•1 ≤ A ≤ 1000
•1 ≤ F ≤ 1000
•1 ≤ P ≤ 1000
"""

V = int(input())
A = int(input())
F = int(input())
P = int(input())
cont = 0
valor = V

if(A <= valor):
    cont+=1
    valor-= A
if(F <= valor):
    cont+=1
    valor-=F
if(P <= valor):
    cont+=1
    valor-=P

print(cont)
