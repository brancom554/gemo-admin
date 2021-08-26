<?php

    switch ($url_array[3]) {  
        case "ajouter":
            include "addAgent.php";
            break;		
        case "modifier":
            include "editAddress.php";
            break;
        
        default:
            include "agent.php";
            break;
    }