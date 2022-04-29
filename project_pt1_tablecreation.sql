/* Users, Coupons & Complaints */

CREATE Table Users (
    user_id integer primary key, 
    name varchar(50) NOT NULL,
    address text NOT NULL,
    username varchar(50) unique NOT NULL,
    password varchar(50) NOT NULL,
    is_deleted boolean NOT NULL default false
);

CREATE TABLE Orders (
    order_id integer PRIMARY KEY,
    user_id integer references Users (user_id) ON UPDATE CASCADE NOT NULL,
    order_date timestamp NOT NULL,
    shipping_address text NOT NULL,
    delivery_date timestamp,
    total_cost numeric(11, 2) CHECK (total_cost > 0)
);

CREATE Table Coupons (
    coupon_id integer primary key,
    valid_start timestamp NOT NULL,
    valid_end timestamp NOT NULL,
    reward text NOT NULL,
    reward_condition text NOT NULL
);

CREATE Table CouponInventory (
    user_id integer references Users(user_id) ON UPDATE CASCADE,
    coupon_id integer references Coupons(coupon_id) ON UPDATE CASCADE,
    order_id  integer references Orders(order_id) ON UPDATE CASCADE,
    coupon_used boolean NOT NULL default false,
    use_date timestamp NOT NULL,
    PRIMARY KEY (user_id, coupon_id)
);

CREATE Table Complaints (
    complaint_id integer primary key,
    complaint_category text check (complaint_category in ('comment','product','shop')) NOT NULL,
    complaint_reason text NOT NULL,
    user_id integer REFERENCES Users(user_id) ON UPDATE CASCADE NOT NULL,
    employee_id integer REFERENCES Employees(employee_id) ON UPDATE CASCADE,
    complaint_status text check (complaint_status IN ('pending', 'being processed', 'addressed')) NOT NULL,
    check (employee_id is not null or complaint_status in ('being processed', 'addressed'))
);


CREATE Table ShopReceivedComplaints (
    complaint_id integer REFERENCES Complaints(complaint_id) ON UPDATE CASCADE ON DELETE CASCADE,
    shop_id integer REFERENCES Shops(shop_id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (complaint_id, shop_id)
);

CREATE Table OrderReceivedComplaints (
    complaint_id integer REFERENCES Complaints(complaint_id) ON UPDATE CASCADE ON DELETE CASCADE, 
    order_id integer REFERENCES Orders(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (complaint_id, order_id)
);

CREATE Table CommentReceivedComplaints (
    complaint_id integer REFERENCES Complaints(complaint_id) ON UPDATE CASCADE ON DELETE CASCADE,
    comment_id integer REFERENCES Comments(comment_id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (complaint_id, comment_id)
);


