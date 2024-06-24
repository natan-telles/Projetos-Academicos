<!DOCTYPE html>
<html lang="pt-Br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
</head>

<style>

    *{
        box-sizing: border-box;
        border: 0px;
        margin: 0;
        padding: 0;
    }
    
    body{
        background-color: rgb(41, 41, 41);
        font-family: Montserrat;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    h3{
        color: white;
        font-size: 50px;
    }
    .button{
        transition: 0.5s;
    }

    .button:hover{
        background-color: #6a28db;
        color: white;
    }

    a{
        color: white;
        text-decoration: none;
        border: 1px solid white;
        border-radius: 10px;
        background-color: white;
        color: black;
        display: block;
        margin: 20px auto;
        height:40px;
        line-height: 40px;
        width: 300px;
        text-align: center;
        transition: 0.5s;
    }

    form{
        width:400px;
        text-align: center;
    }

    input{
        display: block;
        margin: 25px auto;
        width:250px;
        height:30px;
        font-family: Montserrat;
        border-radius: 10px;
        padding-left:10px;
    }

    .voltar{
        width:30%;
        font-size: 15px;
    }

    .voltar:hover{
        background-color: #6a28db;
        color: white;
    }

    .textbox label{
        position: absolute;
        margin-left: -110px;
        margin-top: -48px;
        transition: 0.5s;
        color: grey;
        font-size: 13px;
    }

    .textbox input:focus ~ label,.textbox input:valid ~ label{
        font-size: 10px;
        transform:translateY(-25px);
        color: white;
    }
    
</style>

<body>
    <form action="../validacao/validacao_cadastro.php" method="post">
        <a class="voltar" href="../nav/home.php">Voltar</a>
        <h3>Cadastro</h3>
        <h5 style="color:red">Senha inconsistente !</h5>
        <div class="textbox">
            <input type="text" id="nome" name="nome" required>
            <label for="nome">Nome</label>
        </div>

        <div class="textbox">
            <input type="text" id="sobrenome" name="sobrenome" required>
            <label for="sobrenome">Sobrenome</label>
        </div>

        <div class="textbox">
            <input type="email" id="email" name="email" required>
            <label for="email">E-mail</label>
        </div>

        <div class="textbox">
            <input type="text" id="cpf" name="cpf" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" minlength="14" maxlength="14" required>
            <label for="cpf">CPF: xxx.xxx.xxx-xx</label>
        </div>

        <div class="textbox">
            <input type="password" id="senha" name="senha" required>
            <label for="senha">Senha</label>
        </div>

        <div class="textbox">
            <input type="password" id="confirmar_senha" name="confirmar_senha" required>
            <label for="confirmar_senha">Confirmar Senha</label>
        </div>

        <input class="button" type="submit" name="submit" value="Cadastrar-se" required>
    </form>

</body>

</html>