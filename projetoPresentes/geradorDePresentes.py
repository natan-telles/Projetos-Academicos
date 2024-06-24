import mysql.connector
from mysql.connector import Error
from random import randint

perguntas = [
    """
    Quando se trata de passatempos, você prefere:
    1) Jogos de vídeo game
    2) Comprar roupas
    3) Ler livros
    4) Praticar esportes ao ar livre
    5) Cozinhar
""",
"""
    Onde você prefere passar suas férias?
    1) Em casa jogando videogame e/ou usando a internet
    2) Apreciando diversos desfiles de moda
    3) Em casa vendo Netflix 
    4) Na praia praticando várias atividades
    5) Em um lugar com uma culinária diferente
""",
"""
    Qual destas atividades você prefere fazer em um fim de semana?
    1) Jogar um novo jogo indie
    2) Fazer compras em um shopping
    3) Ir para um show de stand-up
    4) Praticar esportes como corrida, ciclismo ou escalada
    5) Ir à um novo restaurante/tomar vinho no ar condicionado
""",
    """
    O que mais te interessa em eventos sociais?
    1) Demonstração de novos produtos e tecnologia
    2) Desfiles de moda e lançamentos de roupas
    3) Palestras sobre literatura e cinema
    4) Apresentação de novos produtos esportivos
    5) Degustações de comida e bebida
""",
"""
Quando você está navegando na internet, em qual tipo de site você passa mais tempo?
    1) Sites de notícias e tecnologia
    2) Blogs de moda e beleza
    3) Plataformas de Streaming (YouTube)
    4) Site de apostas (tigrinho...)
    5) Sites de receitas e gastronomia
""",
"""
O que você mais gosta de fazer em uma tarde de domingo?
    1) Assistir vídeos de unboxing de gadgets novos no YouTube
    2) Experimentar looks diferentes e tirar fotos
    3) Maratonar uma série ou assistir a um filme
    4) Jogar uma partida de futebol ou praticar algum esporte
    5) Testar uma nova receita ou fazer um lanche especial
""",
"""
Se você ganhasse uma viagem surpresa, qual seria o seu destino preferido?
    1) Silicon Valley para conhecer as grandes empresas de tecnologia
    2) Paris para ver as últimas tendências da moda
    3) Hollywood para visitar os estúdios de cinema
    4) Aspen para esquiar nas montanhas
    5) Toscana para fazer um tour gastronômico

""",
"""
Qual seria o seu presente ideal de aniversário?
    1) O último lançamento de um smartphone top de linha
    2) Um vale-compras numa loja de roupas de grife
    3) Ingressos para um show ou evento exclusivo
    4) Um kit de acessórios esportivos de alta qualidade
    5) Um jantar em um restaurante estrelado pelo Michelin
""",
"""
O que você mais gosta de fazer com os amigos?
    1) Organizar uma LAN party para jogar juntos
    2) Fazer um desfile de moda improvisado e divertido
    3) Ir ao cinema ou assistir a um show ao vivo
    4) Jogar vôlei ou futebol no parque
    5) Preparar uma refeição gourmet em conjunto
""",
"""
Como você prefere começar seu dia perfeito? 
    1) Lendo as últimas notícias de tecnologia enquanto toma café
    2) Escolhendo a roupa perfeita para o dia
    3) Assistindo a um episódio da sua série favorita
    4) Fazendo uma corrida matinal ou uma sessão de exercícios
    5) Preparando um café da manhã delicioso e saudável
"""
]

def insert(query):
    try:
        conexao = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='presentes'
        )
        cursor = conexao.cursor()
        if conexao.is_connected():
            cursor.execute(query)
            conexao.commit()
    except Error as erro:
        print("Erro ao acessar banco: ",erro)
    finally:
        if conexao.is_connected():
            cursor.close()
            conexao.close()

opcoes = {}
def select(query):
    global cont 
    cont = cont+1
    try:
        conexao = mysql.connector.connect(
            host = 'localhost',
            user ='root',
            password = '',
            database = 'presentes'
        )
        cursor = conexao.cursor()
        if conexao.is_connected():
            cursor.execute(query)
            resultado = cursor.fetchall()
            for i in resultado:
                nome = i[2]
                descricao = i[3]
                preco = i[4]
                link = i[5]
                id_produto = i[0] 
                print(f"""
                      Opção {cont}
                      Nome: {nome}
                      Descricao : {descricao}
                      Preco : R${preco}
                      Link : {link}
                      ID : {id_produto}
                      """)
                opcoes[cont] = id_produto
    except Error as erro:
        print("Erro ao acessar o banco: ",erro)
    finally:
        if conexao.is_connected():
            cursor.close()
            conexao.close()

def verificarEntrada(valor):
    while not valor.isdigit() or int(valor) < 1 or int(valor) > 5:
        valor = input("Escolha uma das alternativas: ")
    return int(valor)


def contarNumeroMaisFrequente():
    primeiro = 0
    aux = 0
    for valor in respostas:
        if respostas.count(valor) >= aux:
            aux = respostas.count(valor)
            primeiro = valor 
    return primeiro
    
def rangeProdutos(categoria):
    if categoria == "Tecnologia":
        return randint(1,10)
    elif categoria == "Moda":
        return randint(11,20)
    elif categoria == "Entretenimento":
        return randint(21,30)
    elif categoria == "Esportes":
        return randint(31,40)
    elif categoria == "Alimentacao":
        return randint(41,50)

cont = 0
id_produto = 0
respostas = []
categorias = ["Tecnologia","Moda","Entretenimento","Esportes","Alimentacao"]

print("\n" + 10*"-"+ "Bem-vindo ao projeto de Banco de dados do 2º bimestre"+10*"-")
print(20*"-"+ "Gerador de ideias para presentes"+21*"-" + "\n")

respostas = []
categoria1 = 0
categoria2 = 0
categoria3 = 0
print("Formulário de Preferências:")
for i in range(10):
    print(perguntas[i])
    respostas.append(verificarEntrada(input("Resposta: ")))

#categoria1
#verificando qual aparece mais dentro das respostas
primeiro = contarNumeroMaisFrequente()

#categoria2
vezes = respostas.count(primeiro)
for i in range(vezes):
    respostas.remove(primeiro)
#print(respostas)
segundo = contarNumeroMaisFrequente()

#categoria3
vezes = respostas.count(segundo)
for i in range(vezes):
    respostas.remove(segundo)
terceiro = contarNumeroMaisFrequente()


#selecionando em relacao a quantidade de categorias
categoria1 = categorias[primeiro-1]
resp = "S"
while resp != "N":
    if segundo > 0:
        categoria2 = categorias[segundo-1]
        if terceiro > 0:
            categoria3 = categorias[terceiro-1]
            print(f"\nCategorias definidas para o presente: {categoria1,categoria2,categoria3}")
            print("*** Sugestões de presentes ***")
            select(f"SELECT * FROM presentes WHERE categoria = '{categoria1}' and id_presente = '{rangeProdutos(categoria1)}';")
            select(f"SELECT * FROM presentes WHERE categoria = '{categoria2}' and id_presente = '{rangeProdutos(categoria2)}';")
            select(f"SELECT * FROM presentes WHERE categoria = '{categoria3}' and id_presente = '{rangeProdutos(categoria3)}';")
        else:
            print(f"\nCategorias definidas para o presente: {categoria1,categoria2}")
            print("*** Sugestões de presentes ***")
            select(f"SELECT * FROM presentes WHERE categoria = '{categoria1}' and id_presente = '{rangeProdutos(categoria1)}';")
            select(f"SELECT * FROM presentes WHERE categoria = '{categoria2}' and id_presente = '{rangeProdutos(categoria2)}';")

    else:
        print(f"\nCategorias definidas para o presente: {categoria1}")
        print("*** Sugestões de presentes ***")
        select(f"SELECT * FROM presentes WHERE categoria = '{categoria1}'  and id_presente = '{rangeProdutos(categoria1)}';")
    
    resp = input("Deseja gerar outra sugestao de presente? [S/N]: ")
    while resp.upper() != 'S' and resp.upper() != "N":
        resp = input("Digite apenas [S/N]!")


presente_escolhido = input("Escolha uma das opções: ")
while presente_escolhido > str(cont) or presente_escolhido <= "0" or presente_escolhido.isspace():
    presente_escolhido = input("Digite opção válida! Opção: ")

#print(opcoes)

while presente_escolhido.isalpha():
    presente_escolhido = input("Digite o numero referente ao presente: ")

id_produto = opcoes[int(presente_escolhido)]
insert(f"INSERT INTO sugestoes (categoria1,categoria2,categoria3,id_presente_escolhido) VALUES ('{categoria1}','{categoria2}','{categoria3}',{id_produto})")

print(f"Presente Escolhido: Opção {presente_escolhido}")
input("*** ENTER para encerrar programa ***")