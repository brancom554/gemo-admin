<?php
    switch ($url_array[2]) {  
        case "addType":
            include "addType.php";
            break;	
        case "modifier":
            include "editType.php";
            break;
        
        default:
            include "type.php";
            break;
    }