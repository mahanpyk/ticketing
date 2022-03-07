<?php
header('Content-type: application/json');
if (!empty($_GET['unitId'])) {
	$connect = mysqli_connect("localhost", "root", "", "ticketing");
	$connect->set_charset('utf8');
	$unitId = $_GET['unitId'];
	if (!empty($_GET['userId'])) {
		$userId = $_GET['userId'];
	} else {
		echo json_encode(array('message' => 'userId is Empty'));
		$connect->close();
		return;
	}
	if ($userId === "1") { // mainminster
		$sql_query = "SELECT * FROM tickets Order By ticketId ASC";
	} else 	if ($unitId === "8") { //user
		$sql_query = "SELECT * FROM tickets WHERE userId=$userId Order By ticketId DESC";
	} else { // admins
		$sql_query = "SELECT * FROM tickets WHERE unitId=$unitId Order By ticketId ASC";
	}
	$result = $connect->query($sql_query) or die("Errorr:" . mysqli_error($connect));
	$connect->close();
	$readArray = array();
	$unReadArray = array();
	while ($menu = $result->fetch_assoc()) {
		if ($menu['isRead'] == "2") {
			array_push($readArray, $menu);
		} else {
			array_push($unReadArray, $menu);
		}
	}
	echo json_encode(array('readList'=>$readArray,'unReadList'=>$unReadArray));
} else if (empty($_GET['unitId'])) {
	echo json_encode(array('message' => 'unitId is Empty'));
} else {
	echo json_encode(array('message' => 'Bad Request'));
}
