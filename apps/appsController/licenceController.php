<?php

    switch ($url_array[3]) {  
        case "secondaire":
            include "secondaireController.php";
            break;
        case "activer":
            include "activer.php";
            break;	
        case "bloquer":
            include "bloquer.php";
            break;	
        case "modifier":
            include "modifier.php";
            break;
        
        default:
            include "licence.php";
            break;
    }