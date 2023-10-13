<?php 

error_reporting(E_ALL);
ini_set('display_errors', 1);

require("../Controllers/controller.php");

if(isset($_POST['action'])) {

    $tableToOutput;
    $action = $_POST['action'];
    $controller = new Controller();
    $htmlOutput;

//Checks which action is sent
    if($action == "showBookings") {

        $htmlOutput = '<tr><th>Reservation Id</th><th>Customer Id</th><th>Table Id</th><th>Reservation date</th><th>Reservation time</th><th>Max capacity</th></tr>';
        $tableToOutput = "Reservations";
        $result = $controller->getTable("SELECT * FROM $tableToOutput");

        if($result->num_rows > 0) { 
           
            while (($row = $result->fetch_assoc()) !== null) { 
                $htmlOutput.= "<tr>";
                foreach ($row as $columnName => $columnValue) { 
                    $htmlOutput.= "<td>" . $columnValue . "</td>";
                } 
                $htmlOutput.= "</tr>";
            }
           
            echo $htmlOutput;
            } else { 
            echo "0 results"; 
            } 
            $controller->closeConnection();

    } else if($action == "showTables") {

        $htmlOutput = '<tr><th>Table Id</th><th>Location</th><th>Restaurant ID</th><th>Capacity</th></tr>';
        $tableToOutput = "Tables";
        $result = $controller->getTable("SELECT * FROM $tableToOutput");

        if($result->num_rows > 0) {
            while(($row = $result->fetch_assoc()) !== null) {
                $htmlOutput.= "<tr>";
                foreach ($row as $columnName => $columnValue) {
                    $htmlOutput.= "<td>$columnValue</td>";
                }
                $htmlOutput.= "</tr>";
            }

            echo $htmlOutput;
        }else {
            echo "0 results";
        }
        $controller->closeConnection();

    } else if ($action == "showCustomers") {

        $htmlOutput = '<tr><th>Customer Id</th><th>First name</th><th>Last name</th><th>Phone number</th></tr>';
        $tableToOutput = "Customer";
        $result = $controller->getTable("SELECT * FROM $tableToOutput");

        if($result->num_rows > 0 ) {

            while(($row = $result->fetch_assoc()) !== null ) {
                $htmlOutput.= "<tr>";
                foreach ($row as $columnName => $columnValue) {
                    $htmlOutput.= "<td>$columnValue</td>";
                }
                $htmlOutput.= "</tr>";
            }
            echo $htmlOutput;
        } else {
            echo "0 results";
        }

    } else {
        echo "Nothing to show";
    }

};