INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Miss', 'Jenny', 'Stones', '27 Rowan Avenue', 'Hightown', 'NT2 1AQ', '023 9876');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Mr', 'Andrew', 'Stones', '52 The Willows', 'Lowtown', 'LT5 7RA', '876 3527');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Miss', 'Alex', 'Matthew', '4 The Street', 'Nicetown', 'NT2 2TX', '010 4567');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Mr', 'Adrian', 'Matthew', 'The Barn', 'Yuleville', 'YV67 2WR', '487 3871');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Mr', 'Simon', 'Cozens', '7 Shady Lane', 'Oakenham', 'OA3 6QW', '514 5926');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Mr', 'Neil', 'Matthew', '5 Pasture Lane', 'Nicetown', 'NT3 7RT', '267 1232');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Mr', 'Richard', 'Stones', '34 Holly Way', 'Bingham', 'BG4 2WE', '342 5982');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Mrs', 'Ann', 'Stones', '34 Holly Way', 'Bingham', 'BG4 2WE', '342 5982');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Mrs', 'Christine', 'Hickman', '36 Queen Street', 'Histon', 'HT3 5EM', '342 5432');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Mr', 'Mike', 'Howard', '86 Dysart Street', 'Tibsville', 'TB3 7FG', '505 5482');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Mr', 'Dave', 'Jones', '54 Vale Rise', 'Bingham', 'BG3 8GD', '342 8264');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Mr', 'Richard', 'O''Neill', '42 Thatched Way', 'Winersby', 'WB3 6GQ', '505 6482');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Mrs', 'Laura', 'Hardy', '73 Margarita Way', 'Oxbridge', 'OX2 3HX', '821 2335');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Mr', 'Bill', 'O''Neill', '2 Beamer Street', 'Welltown', 'WT3 8GM', '435 1234 ');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone)
    VALUES ('Mr', 'David', 'Hudson', '4 The Square', 'Milltown', 'MT2 6RT', '961 4526');

INSERT INTO item (description, cost_price, sell_price)
    VALUES ('Wood Puzzle', 15.23, 21.95);

INSERT INTO item (description, cost_price, sell_price)
    VALUES ('Rubik Cube', 7.45, 11.49);

INSERT INTO item (description, cost_price, sell_price)
    VALUES ('Linux CD', 1.99, 2.49);

INSERT INTO item (description, cost_price, sell_price)
    VALUES ('Tissues', 2.11, 3.99);

INSERT INTO item (description, cost_price, sell_price)
    VALUES ('Picture Frame', 7.54, 9.95);

INSERT INTO item (description, cost_price, sell_price)
    VALUES ('Fan Small', 9.23, 15.75);

INSERT INTO item (description, cost_price, sell_price)
    VALUES ('Fan Large', 13.36, 19.95);

INSERT INTO item (description, cost_price, sell_price)
    VALUES ('Toothbrush', 0.75, 1.45);

INSERT INTO item (description, cost_price, sell_price)
    VALUES ('Roman Coin', 2.34, 2.45);

INSERT INTO item (description, cost_price, sell_price)
    VALUES ('Carrier Bag', 0.01, 0.0);

INSERT INTO item (description, cost_price, sell_price)
    VALUES ('Speakers', 19.73, 25.32);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('6241527836173', 1);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('6241574635234', 2);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('6264537836173', 3);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('6241527746363', 3);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('7465743843764', 4);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('3453458677628', 5);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('6434564564544', 6);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('8476736836876', 7);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('6241234586487', 8);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('9473625532534', 8);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('9473627464543', 8);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('4587263646878', 9);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('9879879837489', 11);

INSERT INTO barcode (barcode_ean, item_id)
    VALUES ('2239872376872', 11);

INSERT INTO orderinfo (customer_id, date_placed, date_shipped, shipping)
    VALUES (3, '2000-03-13', '2000-03-17', 2.99);

INSERT INTO orderinfo (customer_id, date_placed, date_shipped, shipping)
    VALUES (8, '2000-06-23', '2000-06-24', 0.00);

INSERT INTO orderinfo (customer_id, date_placed, date_shipped, shipping)
    VALUES (15, '09-02-2000', '2000-2-09-', 3.99);

INSERT INTO orderinfo (customer_id, date_placed, date_shipped, shipping)
    VALUES (13, '2000-09-03', '2000-09-10', 2.99);

INSERT INTO orderinfo (customer_id, date_placed, date_shipped, shipping)
    VALUES (8, '2000-07-21', '2000-07-24', 0.00);

INSERT INTO orderline (orderinfo_id, item_id, quantity)
    VALUES (1, 4, 1);

INSERT INTO orderline (orderinfo_id, item_id, quantity)
    VALUES (1, 7, 1);

INSERT INTO orderline (orderinfo_id, item_id, quantity)
    VALUES (1, 9, 1);

INSERT INTO orderline (orderinfo_id, item_id, quantity)
    VALUES (2, 1, 1);

INSERT INTO orderline (orderinfo_id, item_id, quantity)
    VALUES (2, 10, 1);

INSERT INTO orderline (orderinfo_id, item_id, quantity)
    VALUES (2, 7, 2);

INSERT INTO orderline (orderinfo_id, item_id, quantity)
    VALUES (2, 4, 2);

INSERT INTO orderline (orderinfo_id, item_id, quantity)
    VALUES (3, 2, 1);

INSERT INTO orderline (orderinfo_id, item_id, quantity)
    VALUES (3, 1, 1);

INSERT INTO orderline (orderinfo_id, item_id, quantity)
    VALUES (4, 5, 2);

INSERT INTO orderline (orderinfo_id, item_id, quantity)
    VALUES (5, 1, 1);

INSERT INTO orderline (orderinfo_id, item_id, quantity)
    VALUES (5, 3, 1);

INSERT INTO stock (item_id, quantity)
    VALUES (1, 12);

INSERT INTO stock (item_id, quantity)
    VALUES (2, 2);

INSERT INTO stock (item_id, quantity)
    VALUES (4, 8);

INSERT INTO stock (item_id, quantity)
    VALUES (5, 3);

INSERT INTO stock (item_id, quantity)
    VALUES (7, 8);

INSERT INTO stock (item_id, quantity)
    VALUES (8, 18);

INSERT INTO stock (item_id, quantity)
    VALUES (10, 1);
