<?php
require_once(_APPS_PATH.'/classes/Database.php');
$db = new Database();
$sql = 'SELECT firstname,lastname,application_uuid FROM users WHERE company_id ='.$_SESSION['company'].' AND is_manager=0';
$data['marchand'] = $db->DisplayDataDb($sql);

if(file_exists(_VIEW_PATH.$lib->lang."/historique.phtml"))  $view=$lib->lang."/historique.phtml";
else  $view=$iniObj->defaultLang."/historique.phtml";