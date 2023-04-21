explain query;
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
ALTER TABLE customers ADD INDEX idx_customerName(customerName);
ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';
ALTER TABLE customers DROP INDEX idx_full_name;
delimiter //
create procedure findAllCustomers()
begin
select * from customers;
end
//delimiter ;
call findAllCustomers();
delimiter //
drop procedure if exists `findAllCustomers` //
create procedure findAllCustomers()
begin
select * from customers where customerNumber = 175;
end
//
call findAllCustomers();
delimiter //
create procedure cusById
(in cusNum int(11))
begin
select * from customers where customerNumber = cusNum;
end
// delimiter;
call cusById(175);
delimiter //
create procedure getCustomersCountByCity(
in in_city varchar(50),
out total int
)
begin
SELECT count(customerNumber)

    INTO total

    FROM customers

    WHERE city = in_city;
    end//
    delimiter;
    CALL GetCustomersCountByCity('Lyon',@total);
    select total@;
    delimiter //
    CREATE PROCEDURE SetCounter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;

SET @counter = 1;

CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; 
