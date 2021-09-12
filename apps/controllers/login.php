<?php
require_once(_APPS_PATH.'/classes/Database.php');
require_once(_APPS_PATH.'/classes/User.php');


if (isset($_POST['connexion']) ) {
    $token = filter_input(INPUT_POST,'token',FILTER_SANITIZE_STRING);
    $telephone = filter_input(INPUT_POST,'phone',FILTER_SANITIZE_STRING);
    $passwords = filter_input(INPUT_POST,'password',FILTER_SANITIZE_STRING);
    
    if ($token != $_SESSION['token']) {
        $error = "Token expiré";

        /*var_dump($token);
        var_dump($_SESSION['token']);
        return;*/
        
    }else {
        if (empty($_POST['phone'])) {
            $message1 = "Veuillez remplir le champs";
        }
        if (empty($_POST['password'])) {
            $message2 = "Veuillez remplir le champs";
            
        }else {
            $user = new User();
            $error = $user->seConnecter($telephone,$passwords);
            /*$sql = "SELECT firstname,lastname,encrypted_password,is_manager,licence_id,licence_nb_equipement FROM users,licences,licence_types WHERE users.company_id = licences.created_for_company_id AND licences.licence_type_id = licence_types.licence_type_id AND phone_number= $telephone";
            $db = new Database();
            $data['user'] = $db->DisplaysDataDb($sql);
            if (is_array($data['user'])) {
                if (password_verify($passwords,$data['user']['encrypted_password'])) {
                    $_SESSION['username'] = $data['user']['firstname'].' '.$data['user']['lastname'];
                    $_SESSION['access'] = $data['user']['is_manager'];
                    if (!empty($data['user']['licence_nb_equipement'])) {
                        $_SESSION['equipement'] = $data['user']['licence_nb_equipement'];
                    }
                    if (!empty($data['user']['licence_id'])) {
                        $_SESSION['licence'] = $data['user']['licence_id'];
                    }
                    if ($_SESSION['access'] === '1') {
                        header('Location:/dashboard');
                        exit;
                    }else {
                        if ($_SESSION['access'] === '2') {
                            header('Location:/super/compagnies');
                            exit;
                        }else {
                            header('Location:/');
                            exit;
                        }
                    }
                }else {
                    $error = "Le numéro ou le mots de passe est incorrect.";
                }
            }*/
        }
    }
    
}
$_SESSION['token'] = bin2hex(random_bytes(35));


if(file_exists(_VIEW_PATH.$lib->lang."/login.phtml"))  $view=$lib->lang."/login.phtml";
else  $view=$iniObj->defaultLang."/login.phtml";