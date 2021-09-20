<?php
require_once(_APPS_PATH.'/classes/Database.php');

if (isset($_POST['soumettre'])) {
    
    if (empty($_POST['libelle'])) {
        $message="Veuillez remplir le champs";
    }
    if (empty($_POST['equipement'])) {
        $message="Veuillez remplir le champs";
    }
    if (empty($_POST['transaction'])) {
        $message="Veuillez remplir le champs";
    }
    $sql = 'INSERT INTO licence_types (licence_type_name,licence_nb_equipment,licence_nb_transactions_day) VALUES (:name,:equipement,:transactions)';
    $data=[
        'name'=>strtoupper($_POST['libelle']) ,
        'equipement' => $_POST['equipement'],
        'transactions' => $_POST['transaction']
    ];
        $db = new Database();
        $query = $db->InsertDb($sql,$data);
            if (!is_array($query)) {
                    
                header('Location:/offres');
                exit;
             }  
    
}

if(file_exists(_VIEW_PATH.$lib->lang."/children/addType.phtml"))  $view=$lib->lang."/children/addType.phtml";
else  $view=$lib->lang."/children/addType.phtml";