<?php
 
    $conn = new mysqli("localhost", "root", "", "termproject");

    //Check Connection 
    if($conn -> connect_error){
        die("การเชื่อมต่อฐานข้อมูลล้มเหลว: ". $conn -> connect_error);
        return;
    }else{
        //echo "Connected Complete..!!";
        //exit();
    }

?>