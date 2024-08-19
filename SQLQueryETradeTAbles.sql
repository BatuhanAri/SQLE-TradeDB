use odevDB

CREATE TABLE Products(
productID int IDENTITY(1,1) primary key,
productname nvarchar(50) not null unique,
description nvarchar(50) not null,
price int,
stockquantity int,
categoryID int,
brandID int,
discountID int,
SKU int,
weight int,
dateadd date
);
CREATE TABLE Discount(
discountID int IDENTITY(1,1) primary key,
discounttype nvarchar(50),
startDate date,
discountName nvarchar(50),
);
Create Table Brands(
BrandID int IDENTITY(1,1) primary key,
BrandName nvarchar(50),
brandDescription nvarchar(50)
);
Create table category(
categoryID int IDENTITY(1,1) primary key,
categoryName nvarchar(50),
categoryDescription nvarchar(50),
parentCatagoryID nvarchar(max),
);
CREATE TABLE produtcAttribules(
attribulesID int IDENTITY(1,1) primary key,
attribulesName nvarchar(50),
productID int
);
Create Table CardItems(
cardItemsID int identity(1,1) primary key,
productID int,
cardýtems nvarchar(50),
quantity nvarchar(50),
addedat date,
cardID int
);
create table shoppingCard(
CardID int IDENTITY(1,1) primary key,
created date,
updatetime date,
userID int

);
create table payments(
paymentsID int IDENTITY(1,1) primary key,
amounts nvarchar(50),
paymentsdate date,
paymentsmethod nvarchar(50),
transactionID int,

);
create table ordesItems(
ordesItemID int IDENTITY(1,1) primary key,
productID int,
unitPrice int,
orderID int,
quantity int,
discount int
);

create table orders(
orderID int IDENTITY(1,1) primary key,
orderDATE date,
orderstatus nvarchar(50),
userID int,
totalAmount int,
shippingAddressID int,
blindAddressID int,
paymentsID int,
shippingmethodID int

);

create table shippingMethod(
shippingMethodID int IDENTITY(1,1) primary key,
methodname nvarchar(100),
cost int,
deliveryTime date
);

create table address(
addressID int IDENTITY(1,1) primary key,
UserID int,
addressline nvarchar(250),
city nvarchar(50),
state nvarchar(50),
postaCode int,
county nvarchar(50)

);
create table users(
userID int Identity(1,1) primary key,
email nvarchar(100),
firstName nvarchar(100),
lastName nvarchar(100),
phoneNumber int,
username nvarchar(100),
passwordHash nvarchar(100),
dateofBirth date,
createdAt date,
lastlogin date,
ýsActive binary


);
create table audlitlogs (
lofID int IDENTITY(1,1) primary key,
actionDate date,
details nvarchar(100),
actionType nvarchar(100),
UserID int,
);

create table reviews(
reviewsID int IDENTITY(1,1) primary key,
UserID int,
coments nvarchar(100),
status nvarchar(100),
productsID int,
rating int,
createdat date
);

CREATE TABLE CCart(
CCartID int IDENTITY(1,1) primary key,
paymentsID int not null,
CartNo int not null,
Cartname nvarchar(100) not null,
isActive int not null,
check (isActive in(0,1)),
userId int
);

Create Table City(
cityID int IDENTITY(1,1) primary key,
cityName nvarchar(100)
);
create table state(
stateID int IDENTITY(1,1) primary key,
stateName nvarchar(100)
);
create table country(
countryID int IDENTITY(1,1) primary key,
countryName nvarchar(100)
);

ALTER TABLE payments
ADD FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);


ALTER TABLE Products
ADD FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID);

ALTER TABLE Products
ADD FOREIGN KEY (BRANDID) REFERENCES Brands(BRANDID);

ALTER TABLE Products
ADD FOREIGN KEY (discountID) REFERENCES Discount(discountID);

ALTER TABLE address
ADD FOREIGN KEY (UserID) REFERENCES UserS(UserID);

ALTER TABLE ORDERS
ADD FOREIGN KEY (blindAddressID) REFERENCES address(addressID);

ALTER TABLE ORDERS
ADD FOREIGN KEY (UserID) REFERENCES UserS(UserID);

ALTER TABLE ORDERS
ADD FOREIGN KEY (ShippingAddressID) REFERENCES address(addressID);

ALTER TABLE Orders
ADD FOREIGN KEY (shippingmethodID) REFERENCES ShippingMethod(ShippingMethodID);

ALTER TABLE ORDERS
ADD FOREIGN KEY (paymentsID) REFERENCES address(addressID);

ALTER TABLE ordesItems
ADD FOREIGN KEY (orderID) references orders(orderID);

ALTER table ordesItems
ADD FOREIGN KEY (productID) references products(productID);

alter table shoppingcard
add FOREIGN KEY (userID) references users(userID);

ALTER TABLE CardItems
add foreign key (productID) references products(productID);

ALTER TABLE CardItems
add foreign key (cardID) references shoppingcard(cardID);

alter table reviews
add FOREIGN KEY (userID) references users(userID);

alter table reviews
add FOREIGN KEY (productsID) references products(productID);

alter table produtcAttribules
add FOREIGN KEY (productID) references products(productID);

alter table audlitlogs
add FOREIGN KEY (UserID) references users(UserID);

alter table CCart
add FOREIGN KEY (paymentsID) references payments(paymentsID);

alter table CCart
add FOREIGN KEY (userID) references users(userID);

alter table address
add foreign key (stateID) references state(stateID);

alter table address
add foreign key (cityID) references city(cityID);

alter table address
add foreign key (countryID) references country(countryID);

alter table users
add userLevel int not null,
check (userlevel in(0,1,2));



