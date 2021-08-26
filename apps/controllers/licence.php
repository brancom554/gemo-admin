<?php
require_once(_APPS_PATH.'/classes/Database.php');

$db = new Database();
$q = $db->connectDb();
$data['licences'] = $q->query('SELECT * FROM licences l,companies c WHERE l.created_for_company_id = c.company_id')->fetchAll();

if(file_exists(_VIEW_PATH."/licence.phtml")) $view=$lib->lang."/licence.phtml";
else  $view=$lib->lang."/licence.phtml";