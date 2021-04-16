<?php 
    include 'conn.php';

    $img = $conn->query("SELECT * FROM img");

    $list = array();
    while($rowData=$img->fetch_assoc()){
        $list[] = $rowData;
    }
    
    echo json_encode($list);

?>