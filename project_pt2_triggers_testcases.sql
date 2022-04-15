/* START Trigger 7*/

    -- negative eg.

BEGIN; 

    delete from delivery_complaint;
    delete from comment_complaint;
    delete from shop_complaint;
    delete from review_version;
    delete from reply_version;
    delete from reply;
    delete from review;
    delete from complaint;
    delete from comment;
    delete from orderline;
    delete from orders;
    delete from sells;
    delete from product;
    delete from shop;
    delete from category;
    delete from manufacturer;
    delete from issued_coupon;
    delete from coupon_batch;
    delete from users;

    insert into users values (1, 'addr1', 'user1', false), (2, 'addr2', 'user2', false);
    insert into shop values (1, 'shop1');
    insert into category values (1, 'cat1', null);
    insert into manufacturer values (1, 'manufacturer1', 'sg');
    insert into product values (1, 'product1', 'product1', 1, 1), (2, 'product2', 'product2', 1, 1);
    insert into sells values (1, 1, timestamp '2022-2-4', 1, 100), (1, 2, timestamp '2022-3-4', 1, 100);
    insert into orders values (1, 1, null, 'addr1', 5), (2, 2, null, 'addr2', 5);
    insert into orderline values (1, 1, 1, timestamp '2022-2-4', 3, 1, 'being_processed', NULL), 
    (2, 1, 2, timestamp '2022-3-4', 3, 1, 'being_processed', NULL);
    insert into comment values (1, 1), (2, 1);
    insert into review values (1, 1, 1, 1, timestamp '2022-2-4'), (2, 2, 1, 1, timestamp '2022-3-4');
    insert into review_version values (1, timestamp '2022-2-5', 'first version of review1', 1), 
    (2, timestamp '2022-3-5', 'first version of review2', 1);
COMMIT;

    -- positive eg.

BEGIN;

    delete from delivery_complaint;
    delete from comment_complaint;
    delete from shop_complaint;
    delete from review_version;
    delete from reply_version;
    delete from reply;
    delete from review;
    delete from complaint;
    delete from comment;
    delete from orderline;
    delete from orders;
    delete from sells;
    delete from product;
    delete from shop;
    delete from category;
    delete from manufacturer;
    delete from issued_coupon;
    delete from coupon_batch;
    delete from users;    

    insert into users values (1, 'addr1', 'user1', false);
    insert into shop values (1, 'shop1');
    insert into category values (1, 'cat1', null);
    insert into manufacturer values (1, 'manufacturer1', 'sg');
    insert into product values (1, 'product1', 'product1', 1, 1), (2, 'product2', 'product2', 1, 1);
    insert into sells values (1, 1, timestamp '2022-2-4', 1, 100), (1, 1, timestamp '2022-3-4', 1, 100);
    insert into orders values (1, 1, null, 'addr1', 5), (2, 1, null, 'addr2', 5);
    insert into orderline values (1, 1, 1, timestamp '2022-2-4', 3, 1, 'being_processed', NULL), 
    (2, 1, 1, timestamp '2022-3-4', 3, 1, 'being_processed', NULL);
    insert into comment values (1, 1), (2, 1);
    insert into review values (1, 1, 1, 1, timestamp '2022-2-4'), (2, 2, 1, 1, timestamp '2022-3-4');
    insert into review_version values (1, timestamp '2022-2-5', 'first version of review1', 1), 
    (2, timestamp '2022-3-5', 'first version of review2', 1);
COMMIT;

    -- for own testing

CREATE DATABASE project2;
DROP DATABASE project2;
DROP TRIGGER review_product_valid on review;

/*END Trigger 7*/

/* START Trigger 8*/

    -- negative eg.

BEGIN;

    delete from delivery_complaint;
    delete from comment_complaint;
    delete from shop_complaint;
    delete from review_version;
    delete from reply_version;
    delete from reply;
    delete from review;
    delete from complaint;
    delete from comment;
    delete from orderline;
    delete from orders;
    delete from sells;
    delete from product;
    delete from shop;
    delete from category;
    delete from manufacturer;
    delete from issued_coupon;
    delete from coupon_batch;
    delete from users;    

    insert into users values (1, 'addr1', 'user1', false);
    insert into shop values (1, 'shop1');
    insert into category values (1, 'cat1', null);
    insert into manufacturer values (1, 'manufacturer1', 'sg');
    insert into product values (1, 'product1', 'product1', 1, 1), (2, 'product2', 'product2', 1, 1);
    insert into sells values (1, 1, timestamp '2022-2-4', 1, 100), (1, 1, timestamp '2022-3-4', 1, 100);
    insert into orders values (1, 1, null, 'addr1', 5), (2, 1, null, 'addr2', 5);
    insert into orderline values (1, 1, 1, timestamp '2022-2-4', 3, 1, 'being_processed', NULL), 
    (2, 1, 1, timestamp '2022-3-4', 3, 1, 'being_processed', NULL);
    insert into comment values (1, 1), (2, 1);
    insert into review values (1, 1, 1, 1, timestamp '2022-2-4'), (2, 2, 1, 1, timestamp '2022-3-4');
    insert into review_version values (1, timestamp '2022-2-5', 'first version of review1', 1), 
    (2, timestamp '2022-3-5', 'first version of review2', 1);
    insert into reply values (2, 1);
    insert into reply_version values (2, timestamp '2022-3-4', 'test');
COMMIT;

    -- positive eg.

BEGIN;

    delete from delivery_complaint;
    delete from comment_complaint;
    delete from shop_complaint;
    delete from review_version;
    delete from reply_version;
    delete from reply;
    delete from review;
    delete from complaint;
    delete from comment;
    delete from orderline;
    delete from orders;
    delete from sells;
    delete from product;
    delete from shop;
    delete from category;
    delete from manufacturer;
    delete from issued_coupon;
    delete from coupon_batch;
    delete from users; 

    insert into users values (1, 'addr1', 'user1', false);
    insert into shop values (1, 'shop1');
    insert into category values (1, 'cat1', null);
    insert into manufacturer values (1, 'manufacturer1', 'sg');
    insert into product values (1, 'product1', 'product1', 1, 1), (2, 'product2', 'product2', 1, 1);
    insert into sells values (1, 1, timestamp '2022-2-4', 1, 100), (1, 1, timestamp '2022-3-4', 1, 100);
    insert into orders values (1, 1, null, 'addr1', 5), (2, 1, null, 'addr2', 5);
    insert into orderline values (1, 1, 1, timestamp '2022-2-4', 3, 1, 'being_processed', NULL), 
    (2, 1, 1, timestamp '2022-3-4', 3, 1, 'being_processed', NULL);
    insert into comment values (1, 1), (2, 1);
    insert into review values (1, 1, 1, 1, timestamp '2022-2-4');
    insert into review_version values (1, timestamp '2022-2-5', 'first version of review1', 1);
    insert into reply values (2, 1);
    insert into reply_version values (2, timestamp '2022-3-4', 'test');
COMMIT;

    -- for own testing

CREATE DATABASE project2;
DROP DATABASE project2;
DROP TRIGGER reply_or_review_valid on comment;


/*END Trigger 8*/

/* START Trigger 9*/

    -- negative eg.

BEGIN;

    delete from delivery_complaint;
    delete from comment_complaint;
    delete from shop_complaint;
    delete from review_version;
    delete from reply_version;
    delete from reply;
    delete from review;
    delete from complaint;
    delete from comment;
    delete from orderline;
    delete from orders;
    delete from sells;
    delete from product;
    delete from shop;
    delete from category;
    delete from manufacturer;
    delete from issued_coupon;
    delete from coupon_batch;
    delete from users; 

    insert into users values (1, 'addr1', 'user1', false);
    insert into shop values (1, 'shop1');
    insert into category values (1, 'cat1', null);
    insert into manufacturer values (1, 'manufacturer1', 'sg');
    insert into product values (1, 'product1', 'product1', 1, 1), (2, 'product2', 'product2', 1, 1);
    insert into sells values (1, 1, timestamp '2022-2-4', 1, 100), (1, 1, timestamp '2022-3-4', 1, 100);
    insert into orders values (1, 1, null, 'addr1', 5), (2, 1, null, 'addr2', 5);
    insert into orderline values (1, 1, 1, timestamp '2022-2-4', 3, 1, 'being_processed', NULL), 
    (2, 1, 1, timestamp '2022-3-4', 3, 1, 'being_processed', NULL);
    insert into comment values (1, 1), (2, 1);
    insert into review values (1, 1, 1, 1, timestamp '2022-2-4');
    insert into review_version values (1, timestamp '2022-2-5', 'first version of review1', 1);
    insert into reply values (2, 1);
COMMIT;

    -- positive eg.

BEGIN;

    delete from delivery_complaint;
    delete from comment_complaint;
    delete from shop_complaint;
    delete from review_version;
    delete from reply_version;
    delete from reply;
    delete from review;
    delete from complaint;
    delete from comment;
    delete from orderline;
    delete from orders;
    delete from sells;
    delete from product;
    delete from shop;
    delete from category;
    delete from manufacturer;
    delete from issued_coupon;
    delete from coupon_batch;
    delete from users; 

    insert into users values (1, 'addr1', 'user1', false);
    insert into shop values (1, 'shop1');
    insert into category values (1, 'cat1', null);
    insert into manufacturer values (1, 'manufacturer1', 'sg');
    insert into product values (1, 'product1', 'product1', 1, 1), (2, 'product2', 'product2', 1, 1);
    insert into sells values (1, 1, timestamp '2022-2-4', 1, 100), (1, 1, timestamp '2022-3-4', 1, 100);
    insert into orders values (1, 1, null, 'addr1', 5), (2, 1, null, 'addr2', 5);
    insert into orderline values (1, 1, 1, timestamp '2022-2-4', 3, 1, 'being_processed', NULL), 
    (2, 1, 1, timestamp '2022-3-4', 3, 1, 'being_processed', NULL);
    insert into comment values (1, 1), (2, 1);
    insert into review values (1, 1, 1, 1, timestamp '2022-2-4');
    insert into review_version values (1, timestamp '2022-2-5', 'first version of review1', 1);
    insert into reply values (2, 1);
    insert into reply_version values (2, timestamp '2022-3-4', 'test');
COMMIT;

    -- for own testing

CREATE DATABASE project2;
DROP DATABASE project2;
DROP TRIGGER reply_valid on reply;

/*END Trigger 9*/

/* START Trigger 10 */

    -- negative eg.

BEGIN;

    delete from delivery_complaint;
    delete from comment_complaint;
    delete from shop_complaint;
    delete from review_version;
    delete from reply_version;
    delete from reply;
    delete from review;
    delete from complaint;
    delete from comment;
    delete from orderline;
    delete from orders;
    delete from sells;
    delete from product;
    delete from shop;
    delete from category;
    delete from manufacturer;
    delete from issued_coupon;
    delete from coupon_batch;
    delete from users; 

    insert into users values (1, 'addr1', 'user1', false);
    insert into shop values (1, 'shop1');
    insert into category values (1, 'cat1', null);
    insert into manufacturer values (1, 'manufacturer1', 'sg');
    insert into product values (1, 'product1', 'product1', 1, 1), (2, 'product2', 'product2', 1, 1);
    insert into sells values (1, 1, timestamp '2022-2-4', 1, 100), (1, 1, timestamp '2022-3-4', 1, 100);
    insert into orders values (1, 1, null, 'addr1', 5), (2, 1, null, 'addr2', 5);
    insert into orderline values (1, 1, 1, timestamp '2022-2-4', 3, 1, 'being_processed', NULL), 
    (2, 1, 1, timestamp '2022-3-4', 3, 1, 'being_processed', NULL);
    insert into comment values (1, 1), (2, 1);
    insert into review values (1, 1, 1, 1, timestamp '2022-2-4'), (2, 2, 1, 1, timestamp '2022-3-4');
    insert into review_version values (1, timestamp '2022-2-5', 'first version of review1', 1);
COMMIT;

    -- positive eg.

BEGIN;

    delete from delivery_complaint;
    delete from comment_complaint;
    delete from shop_complaint;
    delete from review_version;
    delete from reply_version;
    delete from reply;
    delete from review;
    delete from complaint;
    delete from comment;
    delete from orderline;
    delete from orders;
    delete from sells;
    delete from product;
    delete from shop;
    delete from category;
    delete from manufacturer;
    delete from issued_coupon;
    delete from coupon_batch;
    delete from users; 

    insert into users values (1, 'addr1', 'user1', false);
    insert into shop values (1, 'shop1');
    insert into category values (1, 'cat1', null);
    insert into manufacturer values (1, 'manufacturer1', 'sg');
    insert into product values (1, 'product1', 'product1', 1, 1), (2, 'product2', 'product2', 1, 1);
    insert into sells values (1, 1, timestamp '2022-2-4', 1, 100), (1, 1, timestamp '2022-3-4', 1, 100);
    insert into orders values (1, 1, null, 'addr1', 5), (2, 1, null, 'addr2', 5);
    insert into orderline values (1, 1, 1, timestamp '2022-2-4', 3, 1, 'being_processed', NULL), 
    (2, 1, 1, timestamp '2022-3-4', 3, 1, 'being_processed', NULL);
    insert into comment values (1, 1), (2, 1);
    insert into review values (1, 1, 1, 1, timestamp '2022-2-4'), (2, 2, 1, 1, timestamp '2022-3-4');
    insert into review_version values (1, timestamp '2022-2-5', 'first version of review1', 1), 
    (2, timestamp '2022-3-5', 'first version of review2', 1);
COMMIT;

    -- for own testing

CREATE DATABASE project2;
DROP DATABASE project2;
DROP TRIGGER review_valid on review;

/*END Trigger 10*/

/* START Trigger 11*/

    -- negative eg.

BEGIN;

    delete from delivery_complaint;
    delete from comment_complaint;
    delete from shop_complaint;
    delete from review_version;
    delete from reply_version;
    delete from reply;
    delete from review;
    delete from complaint;
    delete from comment;
    delete from orderline;
    delete from orders;
    delete from sells;
    delete from product;
    delete from shop;
    delete from category;
    delete from manufacturer;
    delete from issued_coupon;
    delete from coupon_batch;
    delete from users; 

    insert into users values (1, 'addr1', 'user1', false);
    insert into shop values (1, 'shop1');
    insert into category values (1, 'cat1', null);
    insert into manufacturer values (1, 'manufacturer1', 'sg');
    insert into product values (1, 'product1', 'product1', 1, 1), (2, 'product2', 'product2', 1, 1);
    insert into sells values (1, 1, timestamp '2022-2-4', 1, 100), (1, 1, timestamp '2022-3-4', 1, 100);
    insert into orders values (1, 1, null, 'addr1', 5), (2, 1, null, 'addr2', 5);
    insert into orderline values (1, 1, 1, timestamp '2022-2-4', 3, 1, 'being_processed', null), 
    (2, 1, 1, timestamp '2022-3-4', 3, 1, 'being_processed', NULL);
    insert into complaint values (1, 'test', 'pending', 1, null);
    insert into delivery_complaint values (1, 1, 1, 1, timestamp '2022-2-4');
COMMIT;

    -- positive eg.

BEGIN;

    delete from delivery_complaint;
    delete from comment_complaint;
    delete from shop_complaint;
    delete from review_version;
    delete from reply_version;
    delete from reply;
    delete from review;
    delete from complaint;
    delete from comment;
    delete from orderline;
    delete from orders;
    delete from sells;
    delete from product;
    delete from shop;
    delete from category;
    delete from manufacturer;
    delete from issued_coupon;
    delete from coupon_batch;
    delete from users; 

    insert into users values (1, 'addr1', 'user1', false);
    insert into shop values (1, 'shop1');
    insert into category values (1, 'cat1', null);
    insert into manufacturer values (1, 'manufacturer1', 'sg');
    insert into product values (1, 'product1', 'product1', 1, 1), (2, 'product2', 'product2', 1, 1);
    insert into sells values (1, 1, timestamp '2022-2-4', 1, 100), (1, 1, timestamp '2022-3-4', 1, 100);
    insert into orders values (1, 1, null, 'addr1', 5), (2, 1, null, 'addr2', 5);
    insert into orderline values (1, 1, 1, timestamp '2022-2-4', 3, 1, 'delivered', '2022-2-5'), 
    (2, 1, 1, timestamp '2022-3-4', 3, 1, 'being_processed', NULL);
    insert into comment values (1, 1), (2, 1);
    insert into review values (1, 1, 1, 1, timestamp '2022-2-4'), (2, 2, 1, 1, timestamp '2022-3-4');
    insert into review_version values (1, timestamp '2022-2-5', 'first version of review1', 1), 
    (2, timestamp '2022-3-5', 'first version of review2', 1);
    insert into complaint values (1, 'test', 'pending', 1);
    insert into delivery_complaint values (1, 1, 1, 1, timestamp '2022-2-4');
COMMIT;

    -- for own testing

CREATE DATABASE project2;
DROP DATABASE project2;
DROP TRIGGER delivery_valid_complaint on delivery_complaint;

/*END Trigger 11*/

/* START Trigger 12*/

    -- negative eg.

BEGIN;

    delete from delivery_complaint;
    delete from comment_complaint;
    delete from shop_complaint;
    delete from review_version;
    delete from reply_version;
    delete from reply;
    delete from review;
    delete from complaint;
    delete from comment;
    delete from orderline;
    delete from orders;
    delete from sells;
    delete from product;
    delete from shop;
    delete from employee;
    delete from category;
    delete from manufacturer;
    delete from issued_coupon;
    delete from coupon_batch;
    delete from users; 

    insert into users values (1, 'addr1', 'user1', false);
    insert into shop values (1, 'shop1');
    insert into category values (1, 'cat1', null);
    insert into manufacturer values (1, 'manufacturer1', 'sg');
    insert into product values (1, 'product1', 'product1', 1, 1), (2, 'product2', 'product2', 1, 1);
    insert into sells values (1, 1, timestamp '2022-2-4', 1, 100), (1, 1, timestamp '2022-3-4', 1, 100);
    insert into orders values (1, 1, null, 'addr1', 5), (2, 1, null, 'addr2', 5);
    insert into orderline values (1, 1, 1, timestamp '2022-2-4', 3, 1, 'delivered', '2022-2-5'), 
    (2, 1, 1, timestamp '2022-3-4', 3, 1, 'being_processed', NULL);
    insert into comment values (1, 1), (2, 1);
    insert into review values (1, 1, 1, 1, timestamp '2022-2-4'), (2, 2, 1, 1, timestamp '2022-3-4');
    insert into review_version values (1, timestamp '2022-2-5', 'first version of review1', 1), (2, timestamp '2022-3-5', 'first version of review2', 1);
    insert into employee values (1, 'emp1', 1000);
    insert into complaint values (1, 'test', 'pending', 1);
    insert into delivery_complaint values (1, 1, 1, 1, timestamp '2022-2-4');
    insert into shop_complaint values(1,1);
    insert into comment_complaint values (1,1);
COMMIT;

    -- positive eg.

BEGIN;

    delete from delivery_complaint;
    delete from comment_complaint;
    delete from shop_complaint;
    delete from review_version;
    delete from reply_version;
    delete from reply;
    delete from review;
    delete from complaint;
    delete from comment;
    delete from orderline;
    delete from orders;
    delete from sells;
    delete from product;
    delete from shop;
    delete from category;
    delete from employee;
    delete from manufacturer;
    delete from issued_coupon;
    delete from coupon_batch;
    delete from users; 

    insert into users values (1, 'addr1', 'user1', false);
    insert into shop values (1, 'shop1');
    insert into category values (1, 'cat1', null);
    insert into manufacturer values (1, 'manufacturer1', 'sg');
    insert into product values (1, 'product1', 'product1', 1, 1), (2, 'product2', 'product2', 1, 1);
    insert into sells values (1, 1, timestamp '2022-2-4', 1, 100), (1, 1, timestamp '2022-3-4', 1, 100);
    insert into orders values (1, 1, null, 'addr1', 5), (2, 1, null, 'addr2', 5);
    insert into orderline values (1, 1, 1, timestamp '2022-2-4', 3, 1, 'delivered', '2022-2-5'), 
    (2, 1, 1, timestamp '2022-3-4', 3, 1, 'being_processed', NULL);
    insert into comment values (1, 1), (2, 1);
    insert into review values (1, 1, 1, 1, timestamp '2022-2-4'), (2, 2, 1, 1, timestamp '2022-3-4');
    insert into review_version values (1, timestamp '2022-2-5', 'first version of review1', 1), 
    (2, timestamp '2022-3-5', 'first version of review2', 1);
    insert into employee values (1, 'emp1', 1000);
    insert into complaint values (1, 'test', 'being_handled', 1, 1);
    insert into delivery_complaint values (1, 1, 1, 1, timestamp '2022-2-4');
COMMIT;

    -- for own testing

CREATE DATABASE project2;
DROP DATABASE project2;
DROP TRIGGER complaint_valid_type on complaint;

/*END Trigger 12*/


