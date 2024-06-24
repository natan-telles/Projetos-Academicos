<?php
    #print_r($_REQUEST);
    if(isset($_POST['submit']) && !empty($_POST['nome']) && !empty($_POST['sobrenome']) && !empty($_POST['email']) && 
    !empty($_POST['cpf']) && !empty($_POST['senha']) && !empty($_POST['confirmar_senha'])) 
    {
        require_once "../Banco.php";

        $nome = $_POST['nome'];
        $sobrenome = $_POST['sobrenome'];
        $email = $_POST['email'];
        $cpf = $_POST['cpf'];
        $senha = $_POST['senha'];
        $confirmar_senha = $_POST['confirmar_senha'];
        
        
        if($senha != $confirmar_senha){
            header('Location: ../redirect/password_conflit.php');
        }else{
            //Verificacao do CPF

            //obtenho apenas os digitos do cpf
            $cpf_usuario = "";
            for($i = 0 ; $i <= 13 ; $i++){
                if($i == 3 || $i == 7 || $i ==11){
                    $i+=1;
                }
                $cpf_usuario = $cpf_usuario.$cpf[$i];
            }
            #echo"<br>CPF do usuario: $cpf_usuario"."<br>";

            //cpf gerado [9 digitos]
            $cpf_gerado = "";
            for($i = 0 ; $i <= 8 ; $i++){
                $cpf_gerado = $cpf_gerado.$cpf_usuario[$i];
            }
            #echo "<br>CPF gerado: $cpf_gerado";


            $soma1 = 0;
            $mult = [10,9,8,7,6,5,4,3,2];
            for ($i = 0; $i <= 8; $i++){
                $soma1 = $soma1 + $cpf_usuario[$i]*$mult[$i];
            }
            #echo"$soma1"."<br>";
            if($soma1%11 < 2){
                $digito_verificador1 = 0;
            }else{
                $digito_verificador1 = 11-($soma1%11);
            }
            #echo"<br>Dig1: $digito_verificador1";
            $cpf_gerado = $cpf_gerado.$digito_verificador1;
            #echo"<br>CPF com v1: $cpf_gerado";


            $soma2 = 0;
            $mult2 = [11,10,9,8,7,6,5,4,3,2];
            for ($i = 0; $i <= 9; $i++){
                $soma2 = $soma2 + $cpf_usuario[$i]*$mult2[$i];
            }
            #echo"<br>Soma2: $soma2";
            if($soma2 % 11 < 2){
                $digito_verificador2 = 0;
            }else{
                $digito_verificador2 = 11-($soma2 % 11);
            }
            #echo"<br>Dig2: $digito_verificador2";
            $cpf_gerado = $cpf_gerado.$digito_verificador2;
            #echo"<br>CPF com v2: $cpf_gerado";

            if($cpf_gerado == $cpf_usuario){
                //verificar se ja exite algum usuario com este dados
                $sql = "SELECT cpf,email from usuarios where cpf = '$cpf' or email='$email';";
                $result = $conexao->query($sql);        
                if(mysqli_num_rows($result) > 0){
                    header('Location: ../redirect/already_registered.php');  
                }else{
                    $sql = "INSERT INTO usuarios (nome,sobrenome,email,cpf,senha) VALUES(?,?,?,?,?);";
                    $prepareSql = $conexao->prepare($sql);
                    $prepareSql->bind_param("sssss",$nome,$sobrenome,$email,$cpf,$senha);
                    if($prepareSql->execute()){
                        header('Location: ../redirect/sucessful_register.php');
                    }
                    $prepareSql->close();
                }
            }else{
                header('Location: ../redirect/invalid_cpf.php');
                #echo"invalido";
            }

            //header('Location: ../nav/home.html');
        }

    }else{
        header('Location: ../nav/cadastro.php');
    }