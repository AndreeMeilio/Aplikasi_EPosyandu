<?php
    // required headers
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: access");
    header("Access-Control-Allow-Methods: GET");
    header("Access-Control-Allow-Credentials: true");
    header("Content-type: application/vnd-ms-excel");
    header("Content-Disposition: attachment; filename=Data Pegawai.xls");
    // header('Content-Type: application/json');
    
    // include database and object files
    include_once '../api/config/database.php';
    include_once '../api/objects/imunisasi.php';
    include_once '../fungsi/countUsia.php';

    $loop;
    $database = new Database();
    $db = $database->getConnection();
        
    $imunisasi = new Imunisasi($db);

    $dateFrom = $_GET['fromDate'];
    $dateTo = $_GET['toDate'];

    $imunisasi->fromDate = $dateFrom;
    $imunisasi->toDate = $dateTo;

    $stmt2 = $imunisasi->dataRekap();
    $num2 = $stmt2->rowCount();
    //check if more than 0 record found

        $imunisasi_arr=array();
        $imunisasi_arr["records"]=array();

        while ($row = $stmt2->fetch(PDO::FETCH_ASSOC)){

        extract($row);

        $imunisasi=array(
                "id_imunisasi"=>$id_imunisasi,
                "nama_anak"=>$nama_anak,
                "tanggal_lahir"=>$tgl_lahir_anak,
                "usia_anak"=>$usia_anak,
                "nama_ibu"=>$nama_ibu,
                "alamat"=>$alamat_ibu,
                "berat_badan_umur"=>$berat_badan_umur,
                "berat_badan_berdiri"=>$berat_badan_berdiri,
                "berat_badan_terlentang"=>$berat_badan_terlentang,
                "tinggi_badan"=>$tinggi_badan,
                "tgl_imunisasi"=>$tgl_imunisasi
            );
        array_push($imunisasi_arr["records"], $imunisasi);
        }
       
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cetak Data</title>
</head>
<body>
    <h1><center>FORMAT PENCATATAN IMUNISASI DI POSYANDU</center></h1>

    <table>
        <tr>
            <td>BULAN</td>
            <td>: <?php echo date("M/Y", strtotime($dateFrom))?></td>
        </tr>
        <tr>
            <td>POSYANDU</td>
            <td>: posyandu</td>
        </tr>
        <tr>
            <td>STRATA POSYANDU</td>
            <td>: strata Posyandu</td>
        </tr>
        <tr>
            <td>KELURAHAN</td>
            <td>: Maleer</td>
        </tr>
    </table>

    <table border="1">
        <tr>
            <td rowspan="3">NO</td>
            <td rowspan="3">NAMA BAYI</td>
            <td rowspan="3">TGL LAHIR</td>
            <td rowspan="3">USIA</td>
            <td rowspan="3">NAMA ORANG TUA</td>
            <td rowspan="3">ALAMAT (RT/RW KELURAHAN)</td>
            <td colspan="3"><center>BERAT BADAN</center></td>
            <td rowspan="3">TINGGI BADAN</td>
            <td colspan="14"><center>TANGGAL IMUNISASI</center></td>
            <td rowspan="3">TEMPAT PELAYANAN IMUNISASI</td>
        </tr>
        <tr>
            <td>MENURUT</td>
            <td>DIUKUR</td>
            <td>DIUKUR</td>
            <td rowspan="2">HBO</td>
            <td rowspan="2">BCG</td>
            <td colspan="3">DPT-HB-HiB</td>
            <td colspan="4">POLIO</td>
            <td rowspan="2">IPV</td>
            <td rowspan="2">MR</td>
            <td rowspan="2">DPT BOOSTER</td>
            <td rowspan="2">MR BOOSTER</td>
            <td rowspan="2">VITAMIN A</td>
            
        </tr>
        <tr>
            <td>UMUR</td>
            <td>BERDIRI</td>
            <td>TERLENTANG</td>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
        </tr>
        <?php 
    $no = 1;

    foreach($imunisasi_arr['records'] as $row){
        
    ?>
    <tr>
        <td><?php echo $no++; ?></td>
        <td><?php echo $row['nama_anak'];?></td>
        <td><?php echo $row['tanggal_lahir'];?></td>
        <td><?php echo count_usia($row['tanggal_lahir']);?></td>
        <td><?php echo $row['nama_ibu']?></td>
        <td><?php echo $row['alamat'];?></td>
        <td><?php echo $row['berat_badan_umur'];?> kg</td>
        <td><?php echo $row['berat_badan_berdiri'];?> kg</td>
        <td><?php echo $row['berat_badan_terlentang'];?> kg</td>
        <td><?php echo $row['tinggi_badan'];?> cm</td>
        <td>...HBO</td>
        <td>...BCG</td>
        <td>...DPT-HB-HIB 1</td>
        <td>...DPT-HB-HIB 2</td>
        <td>...DPT-HB-HIB 3</td>
        <td>...POLIO 1</td>
        <td>...POLIO 2</td>
        <td>...POLIO 3</td>
        <td>...POLIO 4</td>
        <td>...IPV</td>
        <td>...MR</td>
        <td>...DPT BOOSTER</td>
        <td>...MR BOOSTER</td>
        <td>...VITAMIN A</td>
        <td>...TEMPAT PELAYANAN IMUNISASI </td>
    </tr>
        <?php } ?>
    </table>
</body>
</html>