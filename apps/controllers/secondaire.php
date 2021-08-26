<?php
require_once(_APPS_PATH.'/classes/Database.php');

try {
    $data=[
        'id' => $url_array[4]
    ];
    $db = new Database();
    $q = $db->connectDb();
    $sql = ('SELECT * FROM licences WHERE licence_parent_id=:id');
    $query = $q->prepare($sql);
    $query->execute($data);
    $data['licences'] = $query->fetchAll();
    $types = null;
    $sql = ('SELECT licence_nb_equipement FROM licence_types,licences WHERE licence_types.licence_type_id = licences.licence_type_id AND licence_id='.$url_array[4]);
    $query = $q->prepare($sql);
    $query->execute();
    $d = $query->fetch();
    //var_dump($d);
    $show = false;
    if (count($data['licences']) >= $d['licence_nb_equipement'] ) {
        $show = true;
    }else {
        $show = false;
    }
} catch (PDOException $e) {
    echo $e->errorInfo();
}

if(file_exists(_VIEW_PATH.$lib->lang."/secondaire.phtml"))  $view=$lib->lang."/secondaire.phtml";
else  $view=$iniObj->defaultLang."/secondaire.phtml";