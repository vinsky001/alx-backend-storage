-- create a trigger that decreses the quantity of an item every time a new order is made

DELIMITER//

CREATE TRIGGER decrease_item_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - 1
    WHERE name = NEW.item_name;
END//

DELIMITER;
