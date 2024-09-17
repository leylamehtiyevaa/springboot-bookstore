
create table if not exists category
(
    id          integer not null primary key,
    name        varchar(255) not null,
    description varchar(255)
);

create table if not exists product
(
    id                 integer          not null primary key,
    name               varchar(255)     not null,
    description        varchar(255),
    available_quantity double precision not null,
    price              decimal(20, 2)   not null,
    category_id        integer
        constraint fk182frn64de7bmq9s
            references category
);

create sequence if not exists category_seq increment by 50;
create sequence if not exists product_seq increment by 50;
