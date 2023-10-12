-- create a trigger that decreses the quantity of an item every time a new order is made

CREATE TRIGGER tr_decrease AFTER INSERT ON orders FOR EACH ROW UPDATE items SET quantity = quantity - NEW.number WHERE NAME = NEW.item_name;
