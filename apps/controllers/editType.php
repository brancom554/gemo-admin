<?php
require_once(_APPS_PATH.'/classes/Database.php');

if (isset($_POST['soumettre'])) {
    
    if (empty($_POST['libelle'])) {
        $message="Veuillez sélectionner le libellé";
    }
        $sql = 'UPDATE licence_types SET licence_type_name=:libelle,licence_nb_equipement=:descriptions,licence_nb_transactions_day=:transactions WHERE licence_type_id=:id';
        $data=[
            'id' => $url_array[4],
            'libelle'=> strtoupper($_POST['libelle']),
            'descriptions' => $_POST['equipement'],
            'transactions' => $_POST['transaction']
        ];
        $db = new Database();
        $conn = $db->connectDb();
        if ($conn->beginTransaction()) {
            var_dump($_POST);
            $query = $conn->prepare($sql);
            if ($query->execute($data)) {
                if ($conn->commit()) {
                    header('Location:/configurations/types_licences');
                    exit;
                }
            }
        }
    
}

$data=[
    'id' => $url_array[4]
];
$db = new Database();
$q = $db->connectDb();
$sql = ('SELECT * FROM licence_types WHERE licence_type_id=:id');
$query = $q->prepare($sql);
$query->execute($data);
$data['type'] = $query->fetch();

if(file_exists(_VIEW_PATH.$lib->lang."/children/editType.phtml"))  $view=$lib->lang."/children/editType.phtml";
else  $view=$lib->lang."/children/editType.phtml";