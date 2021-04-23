<?php
  session_start();
  if(!isset($_SESSION['username_petugas'])){
    header("location: http://localhost/Aplikasi_EPosyandu/index.php");
  }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../img/icon/logoremove.png" type="image/x-icon">
    <title>History Vaksin Anak</title>
    <style type="text/css">
        body{
          font-family: "Futura Md BT";
          background-image: url(../img/Menu/bg1.png);
          background-size: cover;
          background-repeat: repeat-y;
        }
    </style>
</head>
<body>
    <?php
        include "../sidebar.html";
    ?>
    
    <form>
        <div class="form-group" style="margin-top: 130px; margin-left: 230px; width: 30%;">
        <table id="ttable" border="0" class="table table-hover table-light table-striped" style="width: 200%;">
            <h1>History Vaksin Anak</h1><br>
            <select class="form-control" id="id_anak" ></select><br>
            <thead class="bg-dark">
                <tr class="text-white">
                    <th>Tanggal Imunisasi</th>
                    <th class="align-middle" width="60%">Nama Vaksin</th>
                </tr>
            </thead>
            <tbody id="content"></tbody>
        </table></div></form>

    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type=text/javascript>
        var id_anak;

        $(document).ready(function(){
            $("#id_anak").load("http://localhost/Aplikasi_EPosyandu/api/HistoryVaksin/optionAnak.php", "func_history=ambil_option_anak");
            
            $("#id_anak").change(function(){
                id_anak = $(this).children("option:selected").val();
                getAllData(id_anak);
            });
        }); 

        function getAllData(id_anak){
            $.ajax({
                type : "GET",
                url : "http://localhost/Aplikasi_EPosyandu/api/HistoryVaksin/readHistoryVaksin.php",
                data : {id_anak : id_anak},
                cache : false,
                success : function(msg){
                    data = msg.records;
                    console.log(msg.records);
                    var content = "";
                    for (let index = 0; index < data.length; index++) {
                        const element = data[index];
                        content+="<tr>";
                        content+= "<td>"+element.tgl_imunisasi+"</td>";
                        content+= "<td>"+element.id_vaksin+"</td>";
                        content+="</tr>";
                    }
                    $("#content").html(content);
                    console.log(content);
                }
            });
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</body>
</html>