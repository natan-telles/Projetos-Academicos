<!DOCTYPE html>
<html lang="pt-Br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
    <form action="../validacao/validacao_login.php" method="post">
        <a class="voltar" href="../nav/home.php">Voltar</a>    
        <h3>Entrar</h3>
        <h5 style="color: red;">Usuario e/ou Senha incorretos !</h5>
        <div class="textbox">
            <input type="text" name="usuario" id="usuario" required>
            <label for="usuario">Usuario</label>
        </div>

        <div class="textbox">
            <input type="password" name="senha" id="senha" required>
            <label for="senha">Senha</label>
        </div>

        <input class="button" type="submit" name="submit" value="Fazer Login">
    </form>

    <!--
        video base para criacao do sistema:
        https://www.youtube.com/watch?v=15CXhnQkilY&list=PLSHNk_yA5fNjoIRNHV-3FprsN3NWPcnnK&index=4
    -->
</body>

</html>