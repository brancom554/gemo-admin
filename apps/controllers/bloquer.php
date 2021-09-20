<?php
require _APPS_PATH.'/classes/Database.php';

if (isset($url_array[3])) {
    $db = new Database();
    $conn = $db->connectDb();
    $data=[
        'is_active'=> 0,
        'id' => $url_array[3]
    ];
    $sql = 'UPDATE licences SET is_active=:is_active WHERE licence_id=:id';
    $query = $conn->prepare($sql);
    if ($query->execute($data)) {
        header('Location:/licences');
        exit;
    }
}