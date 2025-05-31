create table if not exists material_type (
    id bigint auto_increment primary key not null,
    type varchar(200),
    loss_percent double
);

create table if not exists product_type (
    id bigint auto_increment primary key not null,
    type varchar(200),
    coefficient double
);

create table if not exists material (
    id bigint auto_increment primary key not null,
    name varchar(200),
    material_type_id bigint,
    price double,
    warehouse_amount double,
    minimal_amount double,
    amount_in_package double,
    measure_unit varchar(100),

    foreign key (material_type_id) references material_type(id)
);

create table if not exists product (
    id bigint auto_increment primary key not null,
    product_type_id bigint,
    name varchar(200),
    sku varchar(100),
    min_price double,
   
    foreign key (product_type_id) references product(id)
);

create table if not exists material_product (
    id bigint auto_increment primary key not null,
    material_id bigint,
    product_id bigint,
    amount double,

    foreign key (material_id) references material(id),
    foreign key (product_id) references product(id)
);