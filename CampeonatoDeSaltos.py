cont = -1
mediaCampeao = 0

verificar = input('Deseja inicar o programa? [s/n] ')
while verificar != 's' and verificar != 'n':
    print("Digite [s/n]")
    verificar = input('Deseja inicar o programa? [s/n] ')
    
while(verificar == 's'):
    nome_atleta = input('\n\tAtleta: ')
    while nome_atleta == "" :
        nome_atleta = input("Não é permitido resposta nula! Digite novamente: ")
        if nome_atleta != '':
            break
        
    #salto 1 
    salto1 = input('\n\tPrimeiro salto: ')
    while salto1 == "" :
        salto1 = input("Não é permitido resposta nula! Digite novamente: ")
        if salto1 != '':
            break
    salto1 = float(salto1)    
    while salto1 <= 0:
        print("Digite valores positivos!\n")
        salto1 = float(input('\n\tPrimeiro salto: '))
        
    #salto 2    
    salto2 = input('\n\tSegundo salto: ')
    while salto2 == "" :
        salto2 = input("Não é permitido resposta nula! Digite novamente: ")
        if salto2 != '':
            break
    salto2 = float(salto2)    
    while salto2 <= 0:
        print("Digite valores positivos!\n")
        salto2 = float(input('\n\tSegundo salto: '))
        
    #salto 3            
    salto3 = input('\n\tTerceiro salto: ')
    while salto3 == "" :
        salto3 = input("Não é permitido resposta nula! Digite novamente: ")
        if salto3 != '':
            break
    salto3 = float(salto3)    
    while salto3 <= 0:
        print("Digite valores positivos!\n")
        salto3 = float(input('\n\tTerceiro salto: '))
        
    #salto 4          
    salto4 = input('\n\tQuarto salto: ')
    while salto4 == "" :
        salto4 = input("Não é permitido resposta nula! Digite novamente: ")
        if salto4 != '':
            break
    salto4 = float(salto4)    
    while salto4 <= 0:
        print("Digite valores positivos!\n")
        salto4 = float(input('\n\tQuarto salto: '))
              
    #salto 5    
    salto5 = input('\n\tQuinto salto: ')
    while salto5 == "" :
        salto5 = input("Não é permitido resposta nula! Digite novamente: ")
        if salto5 != '':
            break
    salto5 = float(salto5)    
    while salto5 <= 0:
        print("Digite valores positivos!\n")
        salto5 = float(input('\n\tQuinto salto: '))

    melhorSalto = max(salto1,salto2,salto3,salto4,salto5)
    piorSalto = min(salto1,salto2,salto3,salto4,salto5)
    mediaDemaisSaltos = ((salto1+salto2+salto3+salto4+salto5)-(melhorSalto+piorSalto))/3
    
    cont = cont+1
    
    if cont == 0:
        mediaCampeao = mediaDemaisSaltos
        campeao = nome_atleta
        

    if mediaDemaisSaltos >= mediaCampeao:
        mediaCampeao = mediaDemaisSaltos
        campeao = nome_atleta

    print(f'\n\tMelhor Salto: {melhorSalto}m')
    print(f'\tPior Salto: {piorSalto}m')
    print(f'\tMédia dos demais saltos: {mediaDemaisSaltos:.1f}m')
    print(f'\n\tResultado Final:\n\t{nome_atleta}: {mediaDemaisSaltos:.1f}m')

    verificar = input('\nDeseja continuar? [s/n] ')
    while verificar != 's' and verificar != 'n':
        print("Digite [s/n]")
        verificar = input('Deseja inicar o programa? [s/n] ')
        
if (cont == -1):
    print("Não há atleta cadastrado !!")
else:
    print(f'\nATLETA CAMPEÃO: {campeao.upper()}')
