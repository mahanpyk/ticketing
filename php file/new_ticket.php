<?php
header('Content-type: application/json');
if (
    !empty($_POST['unitId']) && !empty($_POST['description']) && !empty($_POST['userId'])
    && !empty($_POST['date']) && !empty($_POST['isRead']) && !empty($_POST['fullName'])
) {
    $connect = mysqli_connect("localhost", "root", "", "ticketing");
    $connect->set_charset('utf8');
    $unitId = $_POST['unitId'];
    $description = $_POST['description'];
    $userId = $_POST['userId'];
    $date = $_POST['date'];
    $isRead = $_POST['isRead'];
    $fullName = $_POST['fullName'];

    $sql_query = "INSERT INTO `tickets`(`unitId`, `description`, `userId`, `date`, `isRead`, `fullName`) VALUES ('$unitId','$description','$userId','$date','$isRead','$fullName')";

    $result = $connect->query($sql_query) or die("Errorr:" . mysqli_error($connect));
    $connect->close();
    echo json_encode(array('message' => !empty($result) ? 'insert data Successful' : 'insert data Failed'));
} else if (empty($_POST['unitId'])) {
    echo json_encode(array('message' => 'unitId not found'));
} else if (empty($_POST['description'])) {
    echo json_encode(array('message' => 'description not found'));
} else if (empty($_POST['userId'])) {
    echo json_encode(array('message' => 'userId not found'));
} else if (empty($_POST['date'])) {
    echo json_encode(array('message' => 'date not found'));
} else if (empty($_POST['isRead'])) {
    echo json_encode(array('message' => 'isRead not found'));
} else if (empty($_POST['fullName'])) {
    echo json_encode(array('message' => 'fullName not found'));
} else {
    echo json_encode(array('message' => 'Bad Request'));
}
