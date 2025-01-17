CREATE DATABASE BankManagementSystemProject;
USE BankManagementSystemProject;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    SSN VARCHAR(11),
    Passport VARCHAR(20),
    DrivingLicense VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(10),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    CreditScore INT
);

CREATE TABLE Account (
    AccountNumber INT PRIMARY KEY,
    CustomerID INT,
    Balance DECIMAL(15, 2),
    DateOpened DATE,
    DateClosed DATE,
    Status ENUM('Active', 'Inactive'),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    AccountNumber INT,
    TransactionType ENUM('Deposit', 'Withdrawal', 'Transfer'),
    Amount DECIMAL(15, 2),
    TransactionDate DATE,
    FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber)
);

CREATE TABLE Branch (
    BranchID INT PRIMARY KEY AUTO_INCREMENT,
    BranchName VARCHAR(50),
    PhoneNumber VARCHAR(15),
    OpeningDate DATE,
    Address VARCHAR(255)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE Loan (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    LoanNumber VARCHAR(20),
    Amount DECIMAL(15, 2),
    InterestRate DECIMAL(5, 2),
    IssueDate DATE,
    MaturityDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE LoanPayment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    LoanID INT,
    PaymentAmount DECIMAL(15, 2),
    PaymentDate DATE,
    FOREIGN KEY (LoanID) REFERENCES Loan(LoanID)
);

CREATE TABLE Investment (
    InvestmentID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    Balance DECIMAL(15, 2),
    DateStarted DATE,
    DateEnded DATE,
    InvestmentType ENUM('CertificateOfDeposit', 'MutualFunds', 'ETFs'),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE CardDetails (
    CardID INT PRIMARY KEY AUTO_INCREMENT,
    AccountNumber INT,
    CardNumber VARCHAR(20),
    ExpiryDate DATE,
    IssueDate DATE,
    CardType ENUM('Debit', 'Credit'),
    FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber)
);

Select * from customer;

INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, SSN, Passport, DrivingLicense, Address, City, State, PostalCode, PhoneNumber, Email, CreditScore)
VALUES 
(1, 'John', 'Doe', '1980-01-01', '123-45-6789', 'N1234567', 'D1234567', '123 Main St', 'Anytown', 'CA', '12345', '555-555-5555', 'john.doe@example.com', 750),
(2, 'Jane', 'Smith', '1985-05-12', '234-56-7890', 'N2345678', 'D2345678', '456 Oak St', 'Sometown', 'TX', '67890', '555-555-1234', 'jane.smith@example.com', 720),
(3, 'Alice', 'Johnson', '1990-07-24', '345-67-8901', 'N3456789', 'D3456789', '789 Pine St', 'Othertown', 'NY', '11223', '555-555-6789', 'alice.johnson@example.com', 680),
(4, 'Bob', 'Brown', '1978-11-30', '456-78-9012', 'N4567890', 'D4567890', '321 Birch St', 'Thistown', 'FL', '33445', '555-555-2345', 'bob.brown@example.com', 710),
(5, 'Carol', 'Davis', '1992-03-14', '567-89-0123', 'N5678901', 'D5678901', '654 Cedar St', 'Anothertown', 'WA', '55667', '555-555-3456', 'carol.davis@example.com', 690),
(6, 'Dave', 'Wilson', '1982-09-18', '678-90-1234', 'N6789012', 'D6789012', '987 Elm St', 'Differenttown', 'IL', '77889', '555-555-4567', 'dave.wilson@example.com', 740),
(7, 'Eve', 'Martinez', '1975-04-25', '789-01-2345', 'N7890123', 'D7890123', '123 Aspen St', 'Yetothertown', 'CO', '99000', '555-555-5678', 'eve.martinez@example.com', 730);

INSERT INTO Account (AccountNumber, CustomerID, Balance, DateOpened, DateClosed, Status) 
VALUES 
(1001, 1, 5000.00, '2024-01-01', NULL, 'Active'),
(1002, 2, 1500.50, '2024-02-15', NULL, 'Active'),
(1003, 3, 3200.75, '2024-03-10', NULL, 'Active'),
(1004, 4, 7800.60, '2024-04-05', NULL, 'Inactive'),
(1005, 5, 250.00, '2024-05-20', NULL, 'Active'),
(1006, 6, 8900.00, '2024-06-01', NULL, 'Active'),
(1007, 7, 5400.40, '2024-06-15', NULL, 'Inactive');

INSERT INTO Transaction (AccountNumber, TransactionType, Amount, TransactionDate) 
VALUES 
(1001, 'Deposit', 1000.00, '2024-01-02'),
(1002, 'Withdrawal', 200.00, '2024-02-16'),
(1003, 'Transfer', 500.00, '2024-03-11'),
(1004, 'Deposit', 1500.00, '2024-04-06'),
(1005, 'Withdrawal', 50.00, '2024-05-21'),
(1006, 'Transfer', 1000.00, '2024-06-02'),
(1007, 'Deposit', 2500.00, '2024-06-16');

INSERT INTO Branch (BranchName, PhoneNumber, OpeningDate, Address) 
VALUES 
('Main Branch', '555-555-0001', '2000-01-01', '100 Main St, Anytown, CA, 12345'),
('North Branch', '555-555-0002', '2005-05-05', '200 North St, Sometown, TX, 67890'),
('East Branch', '555-555-0003', '2010-10-10', '300 East St, Othertown, NY, 11223'),
('West Branch', '555-555-0004', '2015-01-15', '400 West St, Thistown, FL, 33445'),
('South Branch', '555-555-0005', '2020-06-20', '500 South St, Anothertown, WA, 55667'),
('Central Branch', '555-555-0006', '2022-02-02', '600 Central St, Differenttown, IL, 77889'),
('Uptown Branch', '555-555-0007', '2023-03-03', '700 Uptown St, Yetothertown, CO, 99000');

INSERT INTO Employee (FirstName, LastName, Position, PhoneNumber, Email, HireDate, Salary, BranchID) 
VALUES 
('Mike', 'Robinson', 'Manager', '555-555-1001', 'mike.robinson@example.com', '2015-05-15', 80000.00, 1),
('Sara', 'White', 'Teller', '555-555-1002', 'sara.white@example.com', '2018-08-20', 40000.00, 2),
('Tom', 'Harris', 'Advisor', '555-555-1003', 'tom.harris@example.com', '2017-11-11', 60000.00, 3),
('Linda', 'Clark', 'Clerk', '555-555-1004', 'linda.clark@example.com', '2016-06-30', 35000.00, 4),
('Peter', 'Lewis', 'Accountant', '555-555-1005', 'peter.lewis@example.com', '2019-09-09', 55000.00, 5),
('Nancy', 'Hall', 'Analyst', '555-555-1006', 'nancy.hall@example.com', '2021-12-12', 70000.00, 6),
('Steve', 'Walker', 'Security', '555-555-1007', 'steve.walker@example.com', '2022-01-01', 45000.00, 7);

INSERT INTO Loan (CustomerID, LoanNumber, Amount, InterestRate, IssueDate, MaturityDate) 
VALUES 
(1, 'LN1001', 10000.00, 5.5, '2024-01-10', '2026-01-10'),
(2, 'LN1002', 15000.00, 4.75, '2024-02-20', '2026-02-20'),
(3, 'LN1003', 20000.00, 6.0, '2024-03-30', '2026-03-30'),
(4, 'LN1004', 25000.00, 5.0, '2024-04-15', '2026-04-15'),
(5, 'LN1005', 5000.00, 6.25, '2024-05-25', '2026-05-25'),
(6, 'LN1006', 30000.00, 4.5, '2024-06-05', '2026-06-05'),
(7, 'LN1007', 40000.00, 5.75, '2024-06-25', '2026-06-25');

INSERT INTO LoanPayment (LoanID, PaymentAmount, PaymentDate) 
VALUES 
(1, 500.00, '2024-02-10'),
(2, 750.00, '2024-03-20'),
(3, 1000.00, '2024-04-30'),
(4, 1250.00, '2024-05-15'),
(5, 250.00, '2024-06-25'),
(6, 1500.00, '2024-07-05'),
(7, 2000.00, '2024-07-25');

INSERT INTO Investment (CustomerID, Balance, DateStarted, DateEnded, InvestmentType) 
VALUES 
(1, 5000.00, '2024-01-01', NULL, 'CertificateOfDeposit'),
(2, 15000.00, '2024-02-01', NULL, 'MutualFunds'),
(3, 8000.00, '2024-03-01', NULL, 'ETFs'),
(4, 12000.00, '2024-04-01', NULL, 'CertificateOfDeposit'),
(5, 25000.00, '2024-05-01', NULL, 'MutualFunds'),
(6, 7000.00, '2024-06-01', NULL, 'ETFs'),
(7, 14000.00, '2024-07-01', NULL, 'CertificateOfDeposit');


## Query 1: List of Active Accounts with Balance Over $5000
SELECT AccountNumber, CustomerID, Balance, DateOpened, Status
FROM Account
WHERE Status = 'Active' AND Balance > 1000.00;

## Query 2: List of Employees Hired After Date  '2020-01-01'
SELECT EmployeeID, FirstName, LastName, Position, HireDate, Salary, BranchID
FROM Employee
WHERE HireDate > '2020-01-01';

## Query 3: Transactions and Corresponding Customer Details
SELECT 
    t.TransactionID, t.TransactionType, t.Amount, t.TransactionDate, 
    c.FirstName, c.LastName, c.Email
FROM 
    Transaction t
JOIN 
    Account a ON t.AccountNumber = a.AccountNumber
JOIN 
    Customer c ON a.CustomerID = c.CustomerID;
    
## Query 4: Detailed Customer Transactions Including Loans, Accounts, and Payments
SELECT 
    c.CustomerID, c.FirstName, c.LastName, c.Email,
    a.AccountNumber, a.Balance, 
    t.TransactionID, t.TransactionType, t.Amount AS TransactionAmount, t.TransactionDate,
    l.LoanID, l.LoanNumber, l.Amount AS LoanAmount, l.InterestRate, l.IssueDate, l.MaturityDate,
    lp.PaymentID, lp.PaymentAmount, lp.PaymentDate
FROM 
    Customer c
JOIN 
    Account a ON c.CustomerID = a.CustomerID
JOIN 
    Transaction t ON a.AccountNumber = t.AccountNumber
LEFT JOIN 
    Loan l ON c.CustomerID = l.CustomerID
LEFT JOIN 
    LoanPayment lp ON l.LoanID = lp.LoanID
WHERE 
    t.TransactionDate >= '2024-01-01'
ORDER BY 
    c.CustomerID, t.TransactionDate;
    

## Query 5: Query to list customers with investments in mutual funds exceeding a 1000 amount
SELECT C.CustomerID, C.FirstName, C.LastName, I.Balance
FROM Customer C
JOIN Investment I ON C.CustomerID = I.CustomerID
WHERE I.InvestmentType = 'MutualFunds' AND I.Balance > 10000;


## Query 6: Query to find the total number of employees and their average salary per branch

SELECT B.BranchName, COUNT(E.EmployeeID) AS NumberOfEmployees, AVG(E.Salary) AS AverageSalary
FROM Branch B
JOIN Employee E ON B.BranchID = E.BranchID
GROUP BY B.BranchName;


## Query 7: Query to get a detailed report of loan payments by customer

SELECT C.CustomerID, C.FirstName, C.LastName, L.LoanNumber, LP.PaymentAmount, LP.PaymentDate
FROM Customer C
JOIN Loan L ON C.CustomerID = L.CustomerID
JOIN LoanPayment LP ON L.LoanID = LP.LoanID
ORDER BY C.CustomerID, LP.PaymentDate;

## Query 8. Query to find customers with the highest number of transactions in the last month

SELECT C.CustomerID, C.FirstName, C.LastName, COUNT(T.TransactionID) AS TransactionCount
FROM Customer C
JOIN Account A ON C.CustomerID = A.CustomerID
JOIN Transaction T ON A.AccountNumber = T.AccountNumber
WHERE T.TransactionDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY C.CustomerID
ORDER BY TransactionCount DESC
LIMIT 10;


















