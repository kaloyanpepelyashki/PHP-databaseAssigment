<?php 

final class Constants {
    private $servername;
    private $username;
    private $password;
    private $dbname;

    function __construct($servername, $username, $password, $dbname) {
        $this->servername = $servername;
        $this->username = $username;
        $this->password = $password;
        $this->dbname = $dbname;
    }

    function getServername() {
        return $this->servername;
    }

    function getUsername() {
        return $this->username;
    }
    
    function getPassword() {
        return $this->password;
    }

    function getDbname() {
        return $this->dbname;
    }
}