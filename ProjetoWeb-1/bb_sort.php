<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Numeros </title>
</head>

<body class='bg-dark'>

    <style>
        .tabela {
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -175px 0 0 -146px;
        }

        .texto {
            color: white;
        }
    </style>

    <?php
    $i = 0;
    $j = 0;
    $k = 0;
    $dados = [];
    $aux = 0;

    foreach ($_GET as $posicao) {
        $dados[$i] = $posicao;
        $i++;
    }

    for ($j = 0; $j < $i; $j++) {
        for ($k = 0; $k < $i; $k++) {
            if ($dados[$j] > $dados[$k]) {
                $aux = $dados[$j];
                $dados[$j] = $dados[$k];
                $dados[$k] = $aux;
            }
        }
    }
    ?>

    <div class="tabela">
        <table class="table" border="1">
            <?php
            echo "<tr><td class='bg-primary'><div class='texto'>Numeros ordenados em ordem <b>decrescente</b></div><td><tr>";
            for ($j = 0; $j < $i; $j++) {
                echo "<td>$dados[$j]<td><tr>";
            }
            ?>
        </table>
    </div>

</body>

</html>