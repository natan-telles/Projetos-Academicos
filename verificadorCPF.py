listasCPF = []
verifica = 'S'
cont = -1
qtd_cpf_testado = 0
cpfs_validos = 0
cpfs_invalidos = 0

while(verifica == 'S'):
    cont = cont + 1
    cpf = ''
    while(len(cpf) != 11):
        cpf =  input('\nDigite seu CPF: ')

    cpfUsuario = [cpf[0],cpf[1],cpf[2],cpf[3],cpf[4],cpf[5],cpf[6],cpf[7],cpf[8],cpf[9],cpf[10]]
    mult = [10,9,8,7,6,5,4,3,2]
    soma1 = 0
    soma2 = 0

    for i in range(9):
        soma1 = soma1 + int(cpf[i]) * mult[i]

    if (soma1 % 11 < 2):
        digitoVerificador1 = 0
    else:
        digitoVerificador1 = 11-(soma1%11)

    cpfGerado = [cpf[0],cpf[1],cpf[2],cpf[3],cpf[4],cpf[5],cpf[6],cpf[7],cpf[8],str(digitoVerificador1)]
    mult = [11,10,9,8,7,6,5,4,3,2]
    for i in range(10):
        soma2 = soma2 + int(cpfGerado[i]) * mult[i]

    if (soma2 % 11 < 2):
        digitoVerificador2 = 0
    else:
        digitoVerificador2 = 11 - (soma2%11)

    cpfGerado = [cpf[0]+cpf[1]+cpf[2]+cpf[3]+cpf[4]+cpf[5]+cpf[6]+cpf[7]+cpf[8]+str(digitoVerificador1)+str(digitoVerificador2)]
    if cpf == cpfGerado[0]:
        listasCPF.append({'CPF':[cpf], 'VALIDACAO':'valido'})
        cpfs_validos = cpfs_validos + 1

    else:
        listasCPF.append({'CPF':[cpf], 'VALIDACAO':'invalido'})
        cpfs_invalidos = cpfs_invalidos + 1

    qtd_cpf_testado = qtd_cpf_testado + 1

    verifica = input('Deseja continuar testando? [S/N]: ')
    
print(f'\n-> Qunatidade de CPFs testados: {qtd_cpf_testado}')
if(cpfs_validos > 0):
    print(f'-> Quantidade de CPFs VALIDOS: {cpfs_validos}')

if(cpfs_invalidos > 0):
    print(f'-> Quantidade de CPFs INVALIDOS: {cpfs_invalidos}')

print(f'-> Porcentagem de CPFs :')
if(cpfs_invalidos == 0 and cpfs_validos > 0):
    print(f'\tValidos: {(cpfs_validos/qtd_cpf_testado)*100}%\n')
elif(cpfs_validos == 0 and cpfs_invalidos > 0):
    print(f'\tInvalidos: {(cpfs_invalidos/qtd_cpf_testado)*100}%\n')
elif(cpfs_invalidos > 0 and cpfs_validos > 0):
    print(f'\tValidos: {(cpfs_validos/qtd_cpf_testado)*100}%')
    print(f'\tInvalidos: {(cpfs_invalidos/qtd_cpf_testado)*100}%\n')