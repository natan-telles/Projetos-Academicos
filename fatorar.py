
def fatorar_numero(numero):
    divisor = 2
    while numero > 1:
        if numero % divisor == 0:
            numero //= divisor
            print(numero)
        else:
            divisor += 1

numero = 300
print(f'Os fatores primos de {numero} são:')
fatorar_numero(numero)
