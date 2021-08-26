<?php

class Licence
{
    function generateLicence(int $var):string
    {
        $key = implode('-', str_split(substr(strtolower(md5(microtime().rand(1000, 9999))), 0, 25), 5));
        return $key;
    }
}
