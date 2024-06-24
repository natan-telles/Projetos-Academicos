<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Document</title>
</head>

<style>
    .tabela{
        position : absolute;
        top: 50%;
        left: 50%;
        margin: -175px 0 0 -146px;            
    }

    .red{
        color: rgb(114, 1, 1);
      
    }

    .green{
        color: #00FF00;
      
    }

    .yellow{
        color: rgb(196, 124, 0);
    }

    .white{
        color: white;
    }
</style>

<body class = "bg-dark">

    <?php
        $numero = $_GET['txtNumero'];
        $perfeitos = [];
        $divisores = 0;
        $soma = 0;
        $par = 0;
        $impar = 0;
        $aux_primo = 0;

        if($numero%2 == 0){
            $par = 'sim';
            $impar = 'não';
        } else {
            $impar = 'sim';
            $par = 'não';
        }

        for($i = 1; $i < $numero;$i++){
            if($numero % $i == 0){
                $divisores++;            
                $perfeitos[$divisores] = $i;
            }        
        }

        for($i = 1; $i <= $numero;$i++){
            if($numero % $i == 0){
                $aux_primo++;
            }        
        }

        foreach($perfeitos as $posicao){
            $soma += $posicao;
        }

        if($soma == $numero){
            $perfeito = 'sim';
        } else {
            $perfeito = 'não';
        }
        if($aux_primo > 2){
            $primo = 'não';
        } else {
            $primo = 'sim';
        }
    ?>

    <div class="tabela">
        <table class="table table-striped" border="1">
            <tr>
                <td class='bg-primary'><div class="white">Numero recebido</div></td>
                <?php echo"<td class='bg-primary'><div class='white'>$numero</div></td>";?>
            </tr>
            <tr>
                <td>Par</td>
                <?php 
                if($par == "sim"){
                    echo "<td class='bg-success'><div class='green'>$par</div></td>";
                }else{
                    echo "<td class='bg-danger'><div class='red'>$par</div></td>";
                }
                ?>
            </tr>
            <tr>
                <td>Impar</td>
                <?php 
                if($impar == "sim"){
                    echo "<td class='bg-success'><div class='green'>$impar</div></td>";
                }else{
                    echo "<td class='bg-danger'><div class='red'>$impar</div></td>";
                }
                ?>
            </tr>
            <tr>
                <td>Perfeito</td>
                <?php 
                if($perfeito == "sim"){
                    echo "<td class='bg-success' ><div class='green'>$perfeito</div></td>";
                }else{
                    echo "<td class='bg-danger'><div class='red'>$perfeito</div></td>";
                }
                ?>
            </tr>
            <tr>
                <td>Quantidade de divisores</td>
                
                    <?php
                        $String2 = join(",",$perfeitos) ; 
                        echo"<td class='bg-warning'><div class='yellow'> $divisores ($String2)</div></td>";
                    ?>
                
            </tr>
            <tr>
                <td>Primo</td>
                <?php 
                if($primo == "sim"){
                    echo "<td class='bg-success'><div class='green'>$primo</div></td>";
                }else{
                    echo "<td class='bg-danger'><div class='red'>$primo</div></td>";
                }
                ?>
            </tr>
        </table>
    </div>
    <script src="alinhar_div.js"></script>
</body>
</html>