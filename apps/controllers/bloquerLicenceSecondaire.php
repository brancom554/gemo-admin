<?php
require _APPS_PATH.'/classes/Database.php';


if (isset($url_array[4])) {
    $db = new Database();
    $conn = $db->connectDb();
    $data=[
        'is_active'=> 0,
        'id' => $url_array[4],
    ];
    
    try {
        if ($conn->beginTransaction()) {
            $sql = 'UPDATE licences SET is_active=:is_active WHERE licence_id=:id';
            $query = $conn->prepare($sql);
            if ($query->execute($data)) {
                if ($conn->commit()) {
                    header('Location:/licences');
                    exit;
                }
            }else {
                echo "pas enrégistrer";
            }
        }
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
    
}