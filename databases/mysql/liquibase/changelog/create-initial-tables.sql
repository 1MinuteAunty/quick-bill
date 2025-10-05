create table Users (
    id int primary key auto_increment,
    name varchar(50) not null,
    profileImageUrl varchar(255)
);

create table Customers (
    id int primary key auto_increment,
    name varchar(50) not null,
    profileImageUrl varchar(255),
    sellerId int not null,
    mobileNumber varchar(15),
    foreign key (sellerId) references Users(id) on delete cascade
);

create table Categories (
    id int primary key auto_increment,
    name varchar(50) not null,
    imageUrl varchar(255),
    createdByUserId int,
    foreign key (createdByUserId) references Users(id) on delete cascade
);

create table Products (
    id int primary key auto_increment,
    name varchar(50) not null,
    description varchar(255),
    imageUrl varchar(255),
    categoryId int not null,
    price decimal(10, 2),
    createdByUserId int,
    createdOn timestamp default current_timestamp,
    foreign key (categoryId) references Categories(id),
    foreign key (createdByUserId) references Users(id) on delete cascade
);

create table Orders (
    id int primary key auto_increment,
    description varchar(255),
    paymentStatus enum('pending', 'completed') not null default 'pending',
    createdOn timestamp default current_timestamp,
    customerId int not null,
    foreign key (customerId) references Customers(id)
);

create table OrderItems (
    id int primary key auto_increment,
    orderId int not null,
    productId int not null,
    quantity int not null default 1,
    price decimal(10, 2),
    foreign key (orderId) references Orders(id) on delete cascade,
    foreign key (productId) references Products(id)
);

create table ProductQuantityHistory (
    id int primary key auto_increment,
    productId int not null,
    quantity int not null,
    performedBy enum('order', 'manual') not null,
    orderId int,
    foreign key (productId) references Products(id),
    foreign key (orderId) references Orders(id)
);