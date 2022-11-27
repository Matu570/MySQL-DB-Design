/*
We design the database of a blog:
This contain three tables:
One for users, other for posts, and other for categories.
Each table must have a primary key, and must, and must be related to other tables with a foreign key
*/

CREATE TABLE users(
    id_user int(255) auto_increment not null,
    name    varchar(100) not null,
    last_name   varchar(100) not null,
    email   varchar(255) not null,
    password    varchar(255) not null,
    date    date not null,
    CONSTRAINT pk_users PRIMARY KEY (id_user),
    CONSTRAINT uq_email UNIQUE (email)
)ENGINE=InnoDb;
-- Other ENGINE is MyISAM

CREATE TABLE categories(
    id_category int(255) auto_increment not null,
    name_category   varchar(100),
    CONSTRAINT pk_categories PRIMARY KEY (id_category)
)ENGINE=InnoDb;

CREATE TABLE enters(
    id_enter    int (255) auto_increment not null,
    user_id int (255) not null,
    category_id int (255) not null,
    title   varchar(255) not null,
    description MEDIUMTEXT,
    date    date not null,
    CONSTRAINT pk_enters PRIMARY KEY (id_enter),
    CONSTRAINT fk_enter_user FOREIGN KEY (user_id) REFERENCES users (id_user),
    CONSTRAINT fk_enter_category FOREIGN KEY (category_id) REFERENCES categories (id_category)
)ENGINE=InnoDb;

-- Cascade:
-- ON DELETE CASCADE to delete related records.
-- ON UPDATE CASCADE to update the records.
-- ON DELETE SET NULL
-- ON DELETE SET DEFAULT
-- ON DELETE NO ACTION