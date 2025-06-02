create table if not exists material_type (
id bigint auto_increment primary key,
type varchar(200),
loss_percent decimal(5, 2)
);

create table if not exists legal_form (
    id bigint auto_increment primary key,
    name varchar(200)
);

create table if not exists partner (
    id bigint auto_increment primary key,
    legal_form_id bigint,
    name varchar(200),
    director varchar(200),
    email varchar(200),
    phone varchar(200),
    legal_address varchar(200),
    inn varchar(12),
    rating int not null default 0,
        
    foreign key(legal_form_id) references legal_form(id)
);

create table if not exists product_type (
    id bigint auto_increment primary key,
    type varchar(200),
    coefficient decimal(5, 2)
);


create table if not exists product (
    id bigint auto_increment primary key,
    product_type_id bigint,
    name varchar(200),
    sku varchar(15),
    min_price decimal(8, 2),
    
    foreign key (product_type_id) references product_type(id)
);

create table if not exists request (
    id bigint auto_increment primary key,
    product_id bigint,
    partner_id bigint,
    amount decimal(8, 2),

    foreign key (product_id) references product(id),
    foreign key (partner_id) references partner(id)
);
