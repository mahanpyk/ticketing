<?php
header('Content-Type: application/json; charset=utf-8');
if (!empty($_POST['username']) &&  !empty($_POST['password'])) {
	$connect = mysqli_connect("localhost", "root", "", "ticketing");
	$connect->set_charset('utf8');
	$username = $_POST['username'];
	$password = $_POST['password'];
	$sql_query = "SELECT * FROM users WHERE username='$username' AND password ='$password'";
	$result = $connect->query($sql_query) or die("Errorr:" . mysqli_error($connect));
	$connect->close();
	$menu = $result->fetch_assoc();
	if (!empty($menu)) {
		$arrayResualt =	array(
			'message' => 'Login Successful',
			'data' => array(
				'userId' => $menu['userId'],
				'unitId' => $menu['unitId'],
				'fullName' => $menu['fullName']
			)
		);
	} else {
		$arrayResualt =	array('message' => 'Login Failed');
	}
	echo json_encode($arrayResualt);
} else if (empty($_POST['username'])) {
	echo json_encode(array('message' => 'UserName is Empty'));
} else if (empty($_POST['password'])) {
	echo json_encode(array('message' => 'Password is Empty'));
} else {
	echo json_encode(array('message' => 'Bad Request'));
}
