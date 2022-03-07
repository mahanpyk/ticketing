<?php
header('Content-type: application/json');
if (
    !empty($_POST['ticketId']) && !empty($_POST['unitId']) && !empty($_POST['description'])
    && !empty($_POST['userId']) && !empty($_POST['date']) && !empty($_POST['isRead']) && !empty($_POST['fullName'])
) {
    $connect = mysqli_connect("localhost", "root", "", "ticketing");
    $connect->set_charset('utf8');
    $ticketId = $_POST['ticketId'];
    $unitId = $_POST['unitId'];
    $description = $_POST['description'];
    $userId = $_POST['userId'];
    $date = $_POST['date'];
    $isRead = $_POST['isRead'];
    $fullName = $_POST['fullName'];

    if (!empty($_POST['replay'])) {
        $replay = $_POST['replay'];
        $sql_query = "UPDATE `tickets` SET `unitId`='$unitId',`description`='$description',`userId`='$userId',`date`='$date',`isRead`='$isRead',`replay`='$replay',`fullName`='$fullName' WHERE ticketId=$ticketId";
    } else {
        $sql_query = "UPDATE `tickets` SET `unitId`='$unitId',`description`='$description',`userId`='$userId',`date`='$date',`isRead`='$isRead',`fullName`='$fullName' WHERE ticketId=$ticketId";
    }
    $result = $connect->query($sql_query) or die("Errorr:" . mysqli_error($connect));
    $connect->close();
    echo json_encode(array('message' => !empty($result) ? 'Update data Successful' : 'Update data Failed'));
} else if (empty($_POST['ticketId'])) {
    echo json_encode(array('message' => 'ticketId not found'));
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
