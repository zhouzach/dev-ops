alter table orders
    add `id` int(11) unsigned default 0 not null auto_increment,
    add primary key (`id`);
alter table orders
    add primary key pk_id (`id`);
alter table orders
    add primary key pk_srcuid_price (`srcuid`, `price`);

# must drop auto_increment before drop primary key
alter table orders
    modify column id int(11) not null COMMENT '主键';
alter table orders
    drop PRIMARY KEY;

alter table orders
    add unique index idx_srcuid_price (`srcuid`, `price`) USING BTREE;
alter table orders
    drop index idx_srcuid_price;