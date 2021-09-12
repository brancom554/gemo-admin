<?php
require_once(_APPS_PATH.'/classes/Database.php');

/*$sql = 'SELECT optypes.libelle,userop.operation_date,op.libelle as descriptions FROM user_operations userop INNER JOIN operations op ON op.operation.id = userop.operation_id
INNER JOIN operation_type optypes ON optypes.operation_type = op.operation_type_id INNER JOIN users u ON u.user_id = userop.created_by_user_id
INNER JOIN licences lic ON lic.application_uuid = userop.application_uuid WHERE lic.licence_parent_id ='.$_SESSION['licence'].' LIMIT 3';*/
$sql = "SELECT ops.libelle,opt.operation_date,opt.network_operator_name FROM operations opt INNER JOIN operation_types ops ON ops.operation_type_id = opt.operation_type_id WHERE  opt.company_token ='".$_SESSION['companie_token']."' ORDER BY opt.operation_date DESC LIMIT 3";
$sql2 = "SELECT count(licence_key) AS licence_total FROM licences";
$sql3 = "SELECT count(licence_key) AS licence_total FROM licences WHERE is_active = 1";
$total = 0;
$db = new Database();
try {
    $data['operations'] = $db->DisplayDataDb($sql);
    $data['licence_total'] = $db->DisplaysDataDb($sql2);
    $data['licence_active'] = $db->DisplaysDataDb($sql3);
    $total = (int) $data['licence_total']['licence_total'];
    $total_active = (int) $data['licence_active']['licence_total'];
} catch (\Throwable $th) {
    //throw $th;
}

if(file_exists(_VIEW_PATH.$lib->lang."/dashboard.phtml"))  $view=$lib->lang."/dashboard.phtml";
else  $view=$iniObj->defaultLang."/dashboard.phtml";