<?php
	include 'conn.php';

	$username = $_POST['username'];
 	$password = $_POST['password'];

	$query = $conn->query("SELECT * FROM user WHERE username='".$username."' AND password='".$password."'");

	$result = array();
	while($fetchData=$query->fetch_assoc()){
		$result[] = $fetchData;
	}
	echo json_encode($result);
?>