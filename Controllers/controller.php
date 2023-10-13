<?php 

require("../Models/connection.php");

class Controller {
    private $database;



    public function __construct() {
        $this->database = new Database();
    }

    public function getTable($query) {
        return $this->database->getData($query);
    }

    public function closeConnection() {
        $this->database->closeConnection();
    }
}