<?php

    switch ($url_array[3]) {  
        case "ajouter":
            include "addManager.php";
            break;	
        case "modifier":
            include "modifier.php";
            break;
        
        default:
            include "manager.php";
            break;
    }