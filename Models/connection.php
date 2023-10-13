<?php

require("Constants.php");

class Database {
    private $connection; 

    public function __construct() {
        $dbInfo = new Constants("localhost", "test", "123456", "RestaurantDataBase");
        $this->connection = new mysqli($dbInfo->getServername(), $dbInfo->getUsername(), $dbInfo->getPassword(), $dbInfo->getDbname());
        if ($this->connection->connect_error) {
            die("Connection failed: " . $connection->connect_error);
    
        }
    }


    public function getData($query) {

        $sqlQuery = $query;

        $result = $this->connection->query($sqlQuery);

        if(!$result) {
            die("Error fetching from DB:" .$connection->error);
        }
        return $result;
    }

    public function closeConnection() {
        $this->connection->close();
    }

}
