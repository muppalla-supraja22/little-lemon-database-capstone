USE LittleLemonDB;

DROP PROCEDURE IF EXISTS GetMaxQuantity;

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity
    FROM Orders;
END //

DELIMITER ;

CALL GetMaxQuantity();
DROP PROCEDURE IF EXISTS ManageBooking;

DELIMITER //

CREATE PROCEDURE ManageBooking(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE booking_count INT DEFAULT 0;

    START TRANSACTION;

    SELECT COUNT(*)
    INTO booking_count
    FROM Bookings
    WHERE BookingDate = booking_date
      AND TableNumber = table_number;

    IF booking_count > 0 THEN
        SELECT CONCAT(
            'Table ', table_number,
            ' is already booked - booking cancelled'
        ) AS BookingStatus;

        ROLLBACK;
    ELSE
        SELECT CONCAT(
            'Table ', table_number,
            ' is available'
        ) AS BookingStatus;

        COMMIT;
    END IF;
END //

DELIMITER ;

CALL ManageBooking('2022-10-10', 5);
DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN booking_id INT,
    IN new_booking_date DATE
)
BEGIN
    START TRANSACTION;

    UPDATE Bookings
    SET BookingDate = new_booking_date
    WHERE BookingID = booking_id;

    COMMIT;

    SELECT CONCAT(
        'Booking ', booking_id, ' updated'
    ) AS Confirmation;
END //

DELIMITER ;

CALL UpdateBooking(4, '2022-12-17');
DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //

CREATE PROCEDURE AddBooking(
    IN booking_id INT,
    IN customer_id INT,
    IN table_number INT,
    IN booking_date DATE
)
BEGIN
    START TRANSACTION;

    INSERT INTO Bookings
        (BookingID, BookingDate, TableNumber, CustomerID)
    VALUES
        (booking_id, booking_date, table_number, customer_id);

    COMMIT;

    SELECT CONCAT(
        'New booking ', booking_id, ' added'
    ) AS Confirmation;
END //

DELIMITER ;

CALL AddBooking(9, 3, 4, '2022-12-30');
DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN booking_id INT
)
BEGIN
    START TRANSACTION;

    DELETE FROM Bookings
    WHERE BookingID = booking_id;

    COMMIT;

    SELECT CONCAT(
        'Booking ', booking_id, ' cancelled'
    ) AS Confirmation;
END //

DELIMITER ;

CALL CancelBooking(9);