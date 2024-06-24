<?php
#print_r($_REQUEST); 

if (isset($_POST['submit']) && !empty($_POST['usuario']) && !empty($_POST['senha'])) {
    require_once "../Banco.php";

    $usuario = $_POST['usuario'];
    $senha = $_POST['senha'];
    #echo $usuario." ".$senha;

    $sql = "SELECT nome, senha FROM usuarios WHERE nome = '$usuario' and senha = '$senha';";
    $result = $conexao->query($sql);
    #print_r($result);
    if(mysqli_num_rows($result) < 1){
        #print_r("Nao existe no banco");
        header('Location: ../redirect/failed_login.php');
    }else{
        #print_r("Existe no banco");
        header('Location: ../nav/home.html');
    }
    
}else{
    header('Location: ../nav/login.php');
}    