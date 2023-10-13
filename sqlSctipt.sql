DROP DATABASE IF EXISTS RestaurantDataBase;
CREATE DATABASE RestaurantDataBase;

USE RestaurantDataBase;

CREATE TABLE Restaurant(
    RestaurantID int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    RestaurantName varchar(50),
    RestaurantLocationTown varchar(50),
    RestaurantLocationStreet varchar(100),
    RestaurantLocationNumber int
    
)ENGINE=InnoDB;

CREATE TABLE Customer (
 	CustomerID int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    CustomerFirstName varchar(50),
    CustomerLastName varchar(100),
    CustomerPhoneNumber varchar(50)
)ENGINE=InnoDB;

CREATE TABLE Tables(
    TableID int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Location varchar(50),
    RestaurantIDRef int,
    Capacity int,

    Foreign Key (RestaurantIDRef) REFERENCES Restaurant (RestaurantID)

)ENGINE=InnoDB;

CREATE TABLE Reservations(
    ReservationID int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    CustomerRefID int NOT NULL,
    TableRefID int NOT NULL,
    ReservationData DATE NOT NULL,
    ReservationTime TIME NOT NULL,
    MaxCapacity int NOT NULL,

    FOREIGN KEY (CustomerRefID) REFERENCES Customer (CustomerID),
    FOREIGN KEY (TableRefID) REFERENCES Tables (TableID)

)ENGINE=InnoDB;



INSERT INTO Restaurant VALUES(NULL, "GrappaDeli", "Aarhus", "Viborg Ringvej", 32);


INSERT INTO Tables VALUES (NULL, "Floor1", 1, 4);

INSERT INTO Tables VALUES (NULL, "Floor1", 1, 3);
INSERT INTO Tables VALUES (NULL, "Floor2", 1, 5);
INSERT INTO Tables VALUES (NULL, "Floor2", 1, 5);
INSERT INTO Tables VALUES (NULL, "Floor1", 1, 4);
INSERT INTO Tables VALUES (NULL, "Floor2", 1, 4);
INSERT INTO Tables VALUES (NULL, "Floor1", 1, 3);
INSERT INTO Tables VALUES (NULL, "Floor2", 1, 4);
INSERT INTO Tables VALUES (NULL, "Floor1", 1, 2);
INSERT INTO Tables VALUES (NULL, "Floor2", 1, 6);
INSERT INTO Tables VALUES (NULL, "Floor1", 1, 5);
INSERT INTO Tables VALUES (NULL, "Floor1", 1, 2);
INSERT INTO Tables VALUES (NULL, "Floor2", 1, 4);
INSERT INTO Tables VALUES (NULL, "Floor2", 1, 5);


INSERT INTO Customer VALUES(Null, "Kalos", "Boros", "08976575");
INSERT INTO Customer VALUES(Null, "Angle", "Spasov", "08998121");
INSERT INTO Customer VALUES(Null, "Marting", "Degn", "50344556");
INSERT INTO Customer VALUES(Null, "Kronos", "Karlov", "44005042");
INSERT INTO Customer VALUES(Null, "Asta", "Fredag", "13442521");
INSERT INTO Customer VALUES(Null, "Drago", "Kostov", "45503342");
INSERT INTO Customer VALUES(Null, "Kristin", "Belorgova", "45663312");
INSERT INTO Customer VALUES(Null, "Kwep", "Jewu", "89441312");
INSERT INTO Customer VALUES(Null, "Greg", "Djorgoff", "66553121");


INSERT INTO Reservations VALUES(NULL, 5, 1, '2023-10-13', '17:00:00', 4);
INSERT INTO Reservations VALUES(NULL, 1, 2, '2023-10-10', '15:45:00', 3);
INSERT INTO Reservations VALUES(NULL, 1, 1, '2023-10-22', '19:30:00', 4);
INSERT INTO Reservations VALUES(NULL, 8, 10, '2023-10-13', '16:40:00', 6);


-- Get Get a list of all bookings for a given customer ordered by date
SELECT * FROM Reservations
WHERE CustomerRefID = 1
ORDER BY ReservationData;


-- Get a list of all bookings for a given tableID, including the customers for a specific date
SELECT Reservations.ReservationID, Customer.CustomerID, Customer.CustomerFirstName
FROM Reservations
JOIN Customer ON Reservations.CustomerRefID = Customer.CustomerID
WHERE Reservations.TableRefID = 1
AND Reservations.ReservationData = "2023-10-22";