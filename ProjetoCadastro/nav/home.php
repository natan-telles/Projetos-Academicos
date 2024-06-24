<!DOCTYPE html>
<html lang="pt-Br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
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
</style>

<body>

    <form>
        <h3>Bem-vindo</h3><br><br>
        <a class="button" href="cadastro.php">Cadastrar-se</a>
        <a class="button" href="login.php">Entrar</a>
    </form>

    <!--
        video base para criacao do sistema:
        https://www.youtube.com/watch?v=15CXhnQkilY&list=PLSHNk_yA5fNjoIRNHV-3FprsN3NWPcnnK&index=4
    -->
</body>

</html>