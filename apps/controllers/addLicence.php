<?php
require_once(_APPS_PATH.'/classes/Licence.php');
require_once(_APPS_PATH.'/classes/Database.php');

if (isset($_POST['soumettre'])) {
    
    if (!isset($_POST['societe'])) {
        return $message="Veuillez sélectionner la societe";
    }
    if (!isset($_POST['licence_fin'])) {
        return $message="Veuillez sélectionner la date d'expiration";
    }
    if (isset($_POST['equipement'])) {
        $equipement= 1;
    }
    if (!empty($_POST['licence_fin'])) {
        $date_fin = new DateTime($_POST['licence_fin']);
        $date_expiration = $date_fin->format('y-m-d H:i');
    }
    if (isset($_POST['actif'])) {
        $actif=1;
        $date_actif = new DateTime();
        $date_activ = $date_actif->format('y-m-d H:i');
    }else{
        $actif=0;
        $date_activ = null;
    }
    $date = new DateTime();
    $db = new Database();
    $conn = $db->connectDb();
    $r = $conn->prepare('INSERT INTO licences (licence_key,creation_date,is_for_equipement_flag,created_for_company_id,is_active,activation_date,expiration_date,licence_type_id) VALUES (?,?,?,?,?,?,?,?)');
    $r->execute([
        $_POST['licence_key'],
        $date->format('y-m-d H:i'),
        $equipement,
        $_POST['societe'],
        $actif,
        $date_activ,
        $date_expiration,
        $_POST['licence_type']
    ]);
    $licence_id = (int)$conn->lastInsertId();
    $sql ='INSERT INTO licence_features (licence_feature_id,licence_id) VALUES (?,?)';
    $query = $conn->prepare($sql);
    foreach($_POST['services'] as $service){
        $service_id = (int)$service;
        if (!$query->execute([$service_id,$licence_id])) {
            var_dump($query->errorInfo());
        }
    }
    header('Location:/super/licence');
    exit;
}

$db = new Database();
$q = $db->connectDb();
$data['societe'] = $q->query('SELECT company_id,company_name FROM companies')->fetchAll();
$data['services'] = $q->query('SELECT service_id,libelle FROM services')->fetchAll();
$data['type'] = $q->query('SELECT licence_type_id,licence_type_name FROM licence_types')->fetchAll();
$db = null;
$key = new Licence();
$licenceKey = $key->generateLicence(25);

if(file_exists(_VIEW_PATH.$lib->lang."/children/addLicence.phtml"))  $view=$lib->lang."/children/addLicence.phtml";
else  $view=$lib->lang."/children/addLicence.phtml";