-- create a trigger that decreses the quantity of an item every time a new order is made

DELIMITER//

CREATE TRIGGER decrease_item_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    DECLARE item_id INT;
    DECLARE order_quantity INT;

    - Get the item_id and order_quantity from the inserted order
    SELECT NEW.item_id, NEW.quantity INTO item_id, order_quantity;

    UPDATE items
    SET quantity = quantity - order_quantity
    WHERE id = item_id;
END//

DELIMITER;
