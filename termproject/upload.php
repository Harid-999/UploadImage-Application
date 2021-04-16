<?php 
    include 'conn.php';
    $image[] = $_FILES['image']['name'];
    $tmpFile[] = $_FILES['image']['tmp_name'];

    $code = $_POST['code'];
    
    foreach ($image as $key => $value) {
        foreach ($tmpFile as $key => $tmpFilevalue) {
            if (move_uploaded_file($tmpFilevalue, 'img/'.$value)) {
                $save = $conn->query("INSERT INTO img(image, code) VALUES('".$value."', '".$code."')");
                if ($save) {
                    echo json_encode(array("message"=>"Success"));
                }else{
                    echo json_encode(array("message"=>"Error ".mysqli_error($conn)));
                }
            }
        }
    }
 
?>