<?php

$conn = mysqli_connect("localhost", "root", "", "eposyandu");



    $data = $_POST['saran'];
    
    $nama= htmlspecialchars($data['nama']);
    $kritik = htmlspecialchars($data['kritik']);
    $email = htmlspecialchars($data['email']);
    $tanggal = $data['tanggal'];

    $tambah = mysqli_query($conn, "INSERT INTO ref_bantuan(id_bantuan, nama, pesan, email, tanggal ) 
                                    VALUES('', '$nama','$kritik','$email', '$tanggal' )");
    
    if($tambah){
        echo "saran disimpan";
    } else {
        echo "error";
    }

?>
