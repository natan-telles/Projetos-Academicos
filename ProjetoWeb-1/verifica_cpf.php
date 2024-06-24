<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Document</title>
</head>

<body class="bg-dark">

    <style>
        .cpfValido {
            font-family: Montserrat;
            color: #0F0;
            background-color: green;
        }

        .cpfInvalido {
            font-family: Montserrat;
            color: black;
            background-color: red;
        }

        .content {
            width: 240px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>

    <?php
    $cpf = $_POST['txtCpf'];
    $mult1 = [10, 9, 8, 7, 6, 5, 4, 3, 2];
    $mult2 = [11, 10, 9, 8, 7, 6, 5, 4, 3, 2];
    $soma1 = 0;
    $soma2 = 0;

    #gerando 1º digito verificador
    for ($i = 0; $i < 9; $i++) {
        $soma1 += $cpf[$i] * $mult1[$i];
    }

    if ($soma1 % 11 < 2) {
        $v1 = 0;
    } else {
        $v1 = 11 - ($soma1 % 11);
    }

    #gerando 2º digito verificador
    for ($i = 0; $i < 10; $i++) {
        $soma2 += $cpf[$i] * $mult2[$i];
    }

    if ($soma2 % 11 < 2) {
        $v2 = 0;
    } else {
        $v2 = 11 - ($soma2 % 11);
    }

    #digitos verificadores
    #echo"$v1 - $v2";
    

    if ($v1 == $cpf[9] && $v2 == $cpf[10]) {
        echo "<div class='content'><span class='cpfValido'>CPF Valido: $cpf</span></div>";
    } else {
        echo "<div class='content'><span class='cpfInvalido'>CPF Inválido: $cpf</span></div>";
    }
    ?>

</body>

</html>