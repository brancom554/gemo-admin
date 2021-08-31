<?php
require_once(_APPS_PATH.'/classes/Database.php');

class User{
    function seConnecter(string $telephone, $passwords){
        $sql = "SELECT firstname,lastname,encrypted_password,is_manager,company_id,company_token FROM users WHERE phone_number= $telephone";
        $db = new Database();
        $data['user'] = $db->DisplaysDataDb($sql);
        if (is_array($data['user'])) {
            if (password_verify($passwords,$data['user']['encrypted_password'])) {
                $_SESSION['username'] = $data['user']['firstname'].' '.$data['user']['lastname'];
                $_SESSION['access'] = $data['user']['is_manager'];
                $_SESSION['company'] = $data['user']['company_id'];
                $_SESSION['companie_token'] = $data['user']['company_token'];
                if ($_SESSION['access'] == '1') {
                    //$sql = "SELECT licence_id,licence_nb_equipement FROM users,licences,licence_types WHERE users.company_id = licences.created_for_company_id AND licences.licence_type_id = licence_types.licence_type_id AND phone_number= $telephone";
                    $sql = "SELECT licence_id,licence_nb_equipment FROM licences lic LEFT JOIN users u ON lic.created_for_company_id = u.company_id JOIN licence_types types ON lic.licence_type_id = types.licence_type_id WHERE u.phone_number= $telephone";
                    $data['licence'] = $db->DisplaysDataDb($sql);
                    if (!empty($data['licence']['licence_nb_equipement'])) {
                        $_SESSION['equipement'] = $data['licence']['licence_nb_equipement'];
                    }
                    if (!empty($data['licence']['licence_id'])) {
                        $_SESSION['licence'] = $data['licence']['licence_id'];
                    }
                    
                    header('Location:/dashboard');
                    exit;
                }elseif ($_SESSION['access'] == '2') {
                    header('Location:/super/compagnies');
                    exit;
                }else {
                    header('Location:/connecter');
                    exit;
                }
            }
            else {
                return $error = "Le numéro ou le mots de passe est incorrect.";
            }
        }
    }

    public function SessionExiste():boolean
    {
        # code...
    }
}