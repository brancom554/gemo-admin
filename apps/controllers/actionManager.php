<?php
require _APPS_PATH.'/classes/Database.php';

if ($url_array[2] == "activer") {
    if (isset($url_array[3])) {
        $date_actif = new DateTime();
        $date_activ = $date_actif->format('y-m-d H:i');
        $db = new Database();
        $conn = $db->connectDb();
        $data=[
            'is_active'=> 1,
            'id' => $url_array[3],

        ];
        
        try {
            
                $sql = 'UPDATE users SET is_active_flag=:is_active WHERE user_id=:id';
                $query = $db->InsertDb($sql,$data);
                
                    if (!is_array($query)) {
                        header('Location:/managers');
                        exit;
                    }
                
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
        
    }
}

if ($url_array[2] == "bloquer") {
    if (isset($url_array[3])) {
        /*$date_actif = new DateTime();
        $date_activ = $date_actif->format('y-m-d H:i');*/
        $db = new Database();
        $conn = $db->connectDb();
        $data=[
            'is_active'=> 0,
            'id' => $url_array[3],
        ];
        
        try {
            $sql = 'UPDATE users SET is_active_flag=:is_active WHERE user_id=:id';
            $query = $db->InsertDb($sql,$data);
                if ($conn->commit()) {
                    header('Location:/managers');
                    exit;
                }
            
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
        
    }
}
