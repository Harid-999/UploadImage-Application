<?php 
	include 'conn.php';

	$code = $_POST['code'];
	$num=0;
	$query = $conn->query("SELECT code FROM img WHERE code like '".$code."' ");

	$result = array();
	while($fetchData=$query->fetch_assoc()){
		$result[] = $fetchData;
		$num++;
	}
	echo json_encode($num);
?>