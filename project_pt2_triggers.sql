/*Triggers 7 - 12: Comments, review, replies & complaints*/

create or replace function check_review_product() returns trigger as $$
begin 
    if not exists(
        select 1
        from (select o.user_id, o.id as order_id, ol.shop_id, ol.product_id, ol.sell_timestamp from orders o join orderline ol on o.id = ol.order_id) as order_orderlines
        where (order_orderlines.user_id = (select user_id from comment c where c.id = new.id)
        and order_orderlines.order_id = new.order_id
        and order_orderlines.shop_id = new.shop_id
        and order_orderlines.product_id = new.product_id
        and order_orderlines.sell_timestamp = new.sell_timestamp)
    ) then
    raise notice 'Review % cannot be inserted as user has not bought product.', new.id;
    return null;
    end if;
    return new;
end;
$$ language plpgsql;

create trigger review_product_valid
before insert on review
for each row
execute function check_review_product();

create or replace function check_reply_or_review() returns trigger as $$
begin
    if exists (
        select 1 from reply r where r.id = new.id
    ) and exists (
        select 1 from review r where r.id = new.id
    ) then
        raise exception 'Comment % is both a reply and a review', new.id;
        return null;
    elseif not exists (
        select 1 from reply r where r.id = new.id
    ) and not exists (
        select 1 from review r where r.id = new.id
    ) then
        raise exception 'Comment % is neither a reply or a review', new.id;
        return null;
    end if;
    return new;
end;
$$ language plpgsql;

create constraint trigger reply_or_review_valid
after insert on comment
deferrable initially deferred
for each row
execute function check_reply_or_review();


create or replace function check_reply() returns trigger as $$
declare
    cnt integer;
begin
    select count(*) into cnt from reply_version r where r.reply_id = new.id;

    if cnt <= 0 then
        raise exception 'Reply % has no reply version.', new.id;
        return null;
    end if;
    return new;
end;
$$ language plpgsql;

create constraint trigger reply_valid
after insert on reply
deferrable initially deferred
for each row
execute function check_reply();


create or replace function check_review() returns trigger as $$
declare
    cnt integer;
begin
    select count(*) into cnt from review_version r where r.review_id = new.id;

    if cnt <= 0 then
        raise exception 'Review % has no review version.', new.id;
        return null;
    end if;
    return new;
end;
$$ language plpgsql;

create constraint trigger review_valid
after insert on review
deferrable initially deferred
for each row
execute function check_review();


create or replace function check_delivery_complaint() returns trigger as $$
declare
    cnt integer;
begin
    select count(*) into cnt from orderline o where o.order_id = new.order_id and status = 'delivered';

    if cnt <= 0 then
        raise notice 'Delivery complaint % cannot be inserted as the order has not been delivered.', new.id;
        return null;
    end if;
    return new;
end;
$$ language plpgsql;

create trigger delivery_valid_complaint
before insert on delivery_complaint
for each row
execute function check_delivery_complaint();


create or replace function check_complaint_type() returns trigger as $$
declare 
    comment_count integer;
    shop_count integer;
    delivery_count integer;
begin
    select count(*) into comment_count from comment_complaint c where c.id = new.id;
    select count(*) into shop_count from shop_complaint s where s.id = new.id;
    select count(*) into delivery_count from delivery_complaint d where d.id = new.id;
    
    if comment_count + shop_count + delivery_count <> 1 then
        raise exception '% is neither a comment, shop or delivery-related complaint.' , new.id;
        return null; 
    end if;
    return new;
end;
$$ language plpgsql;

create constraint trigger complaint_valid_type
after insert on complaint
deferrable initially deferred
for each row
execute function check_complaint_type();