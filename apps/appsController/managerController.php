<?php

    switch ($url_array[2]) {  
        case "activer":
            include "actionManager.php";
            break;
        case "bloquer":
            include "actionManager.php";
            break;
        case "ajouter":
            include "addManager.php";
            break;	
        case "password":
            include "editPassword.php";
            break;
        
        default:
            include "manager.php";
            break;
    }