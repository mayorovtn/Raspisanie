
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Дни неделди</title>
</head>

<body>

    
    <?php

            try {
                
                require_once "connect.php";


                $sql = "SELECT * FROM dni";
                $result = $conn->query($sql);

                echo"<div class='container'>";  
                                  
                    echo "<div class='row'> 
                        <div class='col'>#</div>
                        <div class='col'>День</div>
                        <div class='col'></div>
                        <div class='col'></div>";     
                    echo "</div>";
                
                
              
                    while ($row = $result->fetch()){

                        echo "<div class='row'>";
                            echo "<div class='col'>".$row['idDen']."</div>";
                            echo "<div class='col'>".$row['Den']."</div>";
                            echo "<div class='col'><a href = 'deletedni.php?id=".$row['idDen']."'>Удалить</a></div>";
                            echo "<div class='col'><a href = 'editdni.php?id=".$row['idDen']."'>Изменить</a></div>";
                        echo "</div>";

                    }
                      
                echo "</div>";

            }

            catch (PDOExeption $e){

            print "Ошибка: ". $e->getMessage(). "</br>";
            }


        ?>

</body>
</html>