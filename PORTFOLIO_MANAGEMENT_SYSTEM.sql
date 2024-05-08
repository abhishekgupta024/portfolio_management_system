create database stock_portfolio;
use stock_portfolio;


create table user_details (
    user_id varchar(12) primary key,
    name varchar(255) not null,
    password varchar(255) not null,
    dob DATE not null,
    pan varchar(10) not null UNIQUE,
    email varchar(255) not null UNIQUE
);

create table phone_numbers (
    user_id varchar(12),
    phone_number varchar(10) not null,
    foreign key (user_id) references user_details(user_id)
);

create table COMPANY (
    STOCK_ID varchar(4) primary key,
    STOCK_NAME varchar(255) not null,
    STOCK_PRICE DECIMAL(10, 2) not null
);

create table WATCHLIST (
    USER_ID varchar(12) not null,
    STOCK_ID varchar(4),
    STOCK_PRICE DECIMAL(10, 2) not null,
    foreign key (USER_ID) references user_details(USER_ID),
    foreign key (STOCK_ID) references COMPANY(STOCK_ID)
);

create table PORTFOLIO (
    USER_ID varchar(12) not null,
    buy_price int,
    STOCK_ID varchar(4) not null,
    quantity int not null,
    foreign key (STOCK_ID) references COMPANY(STOCK_ID),
    foreign key (USER_ID) references user_details(USER_ID)
);

create table TRANSACTION (
    TRANSACTION_ID int primary key auto_increment,
    DATE_OF_PURCHASE DATE not null,
    USER_ID_PURCHASED varchar(12),
    STOCK_ID varchar(4),
    PRICE DECIMAL(10, 2) not null,
    QUANTITY int not null,
    USER_ID_BOUGHT varchar(12),
    foreign key (USER_ID_PURCHASED) references user_details(USER_ID),
    foreign key (USER_ID_BOUGHT) references user_details(USER_ID),
    foreign key (STOCK_ID) references COMPANY(STOCK_ID)
);

create table COMPANY_PERFORMANCE (
    OPEN_PRICE DECIMAL(10, 2) not null,
    CLOSE_PRICE DECIMAL(10, 2) not null,
    DATE DATE not null,
    LOWEST_PRICE DECIMAL(10, 2) not null,
    HIGHEST_PRICE DECIMAL(10, 2) not null,
    TIME TIME not null,
    STOCK_ID varchar(4) not null primary key,
    foreign key (STOCK_ID) references COMPANY(STOCK_ID)
);

alter table user_details add column role varchar(255) default 'user';

-- insert 5 users into the user_details table
insert into user_details (user_id, dob, name, password, pan, email)
values
('ABCDE1234G03', '2003-06-30', 'Abhishek ', 'password1', 'ABCDE1234G', 'abhisehk@example.com'),
('XYZTE9876R13', '2013-11-30', 'Vivek', 'password2', 'XYZTE9876R', 'vivek@example.com'),
('PQRWF4567F03', '2003-06-30', 'Shivam', 'password3', 'PQRWF4567F', 'shivam@example.com'),
('LMNER2348G09', '2009-05-31', 'Lowanshi', 'password4', 'LMNER2348G', 'lowanshi@example.com'),
('DEFRE7890K03', '2003-06-05', 'Anshul', 'password5', 'DEFRE7890K', 'anshul@example.com');

-- insert phone numbers for the users
insert into phone_numbers (user_id, phone_number)
values
('ABCDE1234G03', '1234567890'),
('XYZTE9876R13', '9876543210'),
('PQRWF4567F03', '5555555555'),
('LMNER2348G09', '1111111111'),
('DEFRE7890K03', '9999999999');

-- insert 5 companies
insert into COMPANY (STOCK_ID, STOCK_NAME, STOCK_PRICE)
values
('AAPL', 'Apple Inc.', 150.50),
('GOOG', 'Alphabet Inc.', 2800.00),
('MSFT', 'Microsoft Corporation', 300.75),
('AMZN', 'Amazon.com Inc.', 3400.25),
('TSLA', 'Tesla, Inc.', 650.00);

-- insert stocks into watchlists
insert into WATCHLIST (USER_ID, STOCK_ID, STOCK_PRICE)
values
('ABCDE1234G03', 'AAPL', 150.50),
('XYZTE9876R13', 'GOOG', 2800.00),
('PQRWF4567F03', 'MSFT', 300.75),
('LMNER2348G09', 'AMZN', 3400.25),
('DEFRE7890K03', 'TSLA', 650.00);

-- insert portfolios for users
insert into PORTFOLIO (USER_ID, buy_price, stock_id, quantity)
values
('ABCDE1234G03', 3400.25, 'AMZN', 23),
('ABCDE1234G03', 2800.00, 'GOOG', 40),
('XYZTE9876R13', 2800.00, 'GOOG', 38),
('PQRWF4567F03', 300.75, 'MSFT', 69),
('LMNER2348G09', 650.00, 'TSLA', 412);

-- insert additional companies
insert into COMPANY (STOCK_ID, STOCK_NAME, STOCK_PRICE)
values
('AAP', 'Advance Auto Parts Inc.', 200.90),
('CAT', 'Caterpillar Inc.', 180.25),
('LMT', 'Lockheed Martin Corporation', 400.60),
('ABBV', 'AbbVie Inc.', 110.75),
('PEP', 'PepsiCo Inc.', 150.30);

insert into COMPANY (STOCK_ID, STOCK_NAME, STOCK_PRICE)
values
('NFLX', 'Netflix Inc.', 600.80),
('BA', 'The Boeing Company', 220.10),
('PYPL', 'PayPal Holdings Inc.', 290.80),
('ORCL', 'Oracle Corporation', 85.50),
('VZ', 'Verizon Communications Inc.', 55.25),
('WMT', 'Walmart Inc.', 140.30),
('PFE', 'Pfizer Inc.', 45.60),
('XOM', 'Exxon Mobil Corporation', 65.75),
('GE', 'General Electric Company', 90.20),
('AMD', 'Advanced Micro Devices Inc.', 120.40);

-- insert transactions
insert into TRANSACTION (DATE_OF_PURCHASE, USER_ID_PURCHASED, STOCK_ID, PRICE, QUANTITY, USER_ID_BOUGHT)
values
('2024-01-24', 'ABCDE1234G03', 'AAPL', 150.50, 10, 'XYZTE9876R13'),
('2024-01-23', 'PQRWF4567F03', 'GOOG', 2800.00, 5, 'LMNER2348G09'),
('2024-03-22', 'XYZTE9876R13', 'MSFT', 300.75, 8, 'DEFRE7890K03'),
('2024-02-21', 'DEFRE7890K03', 'AMZN', 3400.25, 12, 'ABCDE1234G03'),
('2024-04-20', 'LMNER2348G09', 'TSLA', 650.00, 15, 'PQRWF4567F03');

-- insert performance data for companies
insert into COMPANY_PERFORMANCE (OPEN_PRICE, CLOSE_PRICE, DATE, LOWEST_PRICE, HIGHEST_PRICE, TIME, STOCK_ID)
values
(152.00, 150.50, '2024-01-24', 149.75, 152.50, '09:30:00', 'AAPL'),
(2802.00, 2800.00, '2024-01-24', 2798.50, 2810.25, '09:30:00', 'GOOG'),
(301.00, 300.75, '2024-01-24', 299.75, 302.25, '09:30:00', 'MSFT'),
(3405.50, 3400.25, '2024-01-24', 3399.75, 3412.00, '09:30:00', 'AMZN'),
(655.00, 650.00, '2024-01-24', 648.50, 657.25, '09:30:00', 'TSLA');

-- insert additional performance data
insert into COMPANY_PERFORMANCE (OPEN_PRICE, CLOSE_PRICE, DATE, LOWEST_PRICE, HIGHEST_PRICE, TIME, STOCK_ID)
values
(200.90, 201.50, '2024-02-19', 199.75, 203.20, '12:30:00', 'AAP'),
(110.75, 112.20, '2024-02-19', 109.90, 113.00, '12:30:00', 'ABBV'),
(120.40, 122.00, '2024-02-19', 119.80, 123.50, '12:30:00', 'AMD'),
(180.25, 181.00, '2024-02-19', 179.80, 183.50, '12:30:00', 'CAT'),
(90.20, 91.00, '2024-02-19', 89.80, 93.50, '12:30:00', 'GE'),
(400.60, 402.00, '2024-02-19', 398.80, 403.50, '12:30:00', 'LMT'),
(150.30, 152.00, '2024-02-19', 149.80, 153.50, '12:30:00', 'PEP'),
(45.60, 47.00, '2024-02-19', 44.80, 48.50, '12:30:00', 'PFE'),
(140.30, 142.00, '2024-02-19', 138.80, 143.50, '12:30:00', 'WMT'),
(90.20, 91.00, '2024-02-19', 89.80, 93.50, '12:30:00', 'XOM');

alter table user_details add column role varchar(255) default 'user';

insert into user_details (user_id, name, password, dob, pan, email,role)
values ('admin', 'Admin', 'admin', '1990-01-01', 'ADMIN1234P', 'admin@admin.com',"admin");
alter table portfolio
add primary key (user_id, stock_id);


DELIMITER //
CREATE TRIGGER generate_username
BEFORE insert ON user_details
FOR EACH ROW
BEGIN
    DECLARE last_two_digits CHAR(2);
    
    -- Extract the last two digits of the year from the dob
    SET last_two_digits = RIGHT(YEAR(NEW.dob), 2);
    
    -- Generate the username by concatenating pan and last two digits
    SET NEW.user_id = CONCAT(NEW.pan, last_two_digits);
END;
//
DELIMITER ;









