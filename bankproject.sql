create database bank;
use bank;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(100),
    PhoneNo VARCHAR(15),
    Email VARCHAR(100),
    DOB DATE
);
desc Customers;

-- Insert records into the Customer table
INSERT INTO Customers (CustomerID, Name, Address, PhoneNo, Email, DOB) VALUES
(1, 'Yash Mhatre', 'Mumbai', '+919876543210', 'yash.mhatre@example.com', '1999-01-15'),
(2, 'Rohit Sharma', 'Thane', '+918765432109', 'rohit.sharma@example.com', '1985-02-05'),
(3, 'Anjali Mehta', 'Dombivli', '+918945612378', 'anjali.mehta@example.com', '1992-03-12'),
(4, 'Suresh Patil', 'Mumbai', '+919845613789', 'suresh.patil@example.com', '1987-04-25'),
(5, 'Pooja Desai', 'Thane', '+918956724690', 'pooja.desai@example.com', '1990-05-30'),
(6, 'Rajesh Kumar', 'Dombivli', '+919567812345', 'rajesh.kumar@example.com', '1988-06-22'),
(7, 'Sneha Reddy', 'Mumbai', '+918967823456', 'sneha.reddy@example.com', '1991-07-19'),
(8, 'Vivek Nair', 'Thane', '+918978934567', 'vivek.nair@example.com', '1994-08-15'),
(9, 'Priya Singh', 'Dombivli', '+919989045678', 'priya.singh@example.com', '1996-09-10'),
(10, 'Amit Joshi', 'Mumbai', '+919990156789', 'amit.joshi@example.com', '1989-10-05');




select*from customer;

-- branch 

CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Address VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

desc Branch;

-- Insert records into the Branch table
INSERT INTO Branch (BranchID, BranchName, Address, PhoneNumber) VALUES
(201, 'SBI Mumbai Main', 'Mumbai', '+912345678901'),
(202, 'SBI Thane East', 'Thane', '+912345678902'),
(203, 'SBI Dombivli West', 'Dombivli', '+912345678903'),
(204, 'SBI Navi Mumbai', 'Navi Mumbai', '+912345678904'),
(205, 'SBI Andheri', 'Mumbai', '+912345678905'),
(206, 'SBI Borivali', 'Mumbai', '+912345678906'),
(207, 'SBI Malad', 'Mumbai', '+912345678907'),
(208, 'SBI Vashi', 'Navi Mumbai', '+912345678908'),
(209, 'SBI Kalyan', 'Kalyan', '+912345678909'),
(210, 'SBI Bandra', 'Mumbai', '+912345678910');


select*from Branch;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Salary FLOAT,
    HiringDate DATE,
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

desc Employee;

INSERT INTO Employee (EmployeeID, Name, Position, Salary, HiringDate, BranchID) VALUES
(1, 'Yash Mhatre', 'Manager', 75000.00, '2023-01-15', 201),
(2, 'Amit Sharma', 'Assistant Manager', 60000.00, '2022-03-20', 202),
(3, 'Priya Singh', 'HR Specialist', 55000.00, '2023-05-10', 203),
(4, 'Ravi Kumar', 'Sales Executive', 40000.00, '2021-11-05', 204),
(5, 'Sneha Patil', 'Software Engineer', 80000.00, '2023-02-18', 205),
(6, 'Vikram Desai', 'Data Analyst', 70000.00, '2022-06-25', 206),
(7, 'Neha Joshi', 'Marketing Manager', 68000.00, '2023-04-01', 207),
(8, 'Rajesh Verma', 'Accountant', 52000.00, '2021-10-30', 208),
(9, 'Sunita Mehta', 'Customer Support', 45000.00, '2022-12-12', 209),
(10, 'Manish Kapoor', 'Project Manager', 90000.00, '2023-07-08', 210);


select*from employee;

CREATE TABLE Account (
    AccountID INT PRIMARY KEY,
    AccountType VARCHAR(50),
    Balance FLOAT,
    OpeningDate DATE,
    CustomerID INT,
    BranchID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);
desc account;

INSERT INTO Account (AccountID, AccountType, Balance, OpeningDate, CustomerID, BranchID) VALUES
(100001, 'Saving', 25000.00, '2023-01-10', 1, 201),
(100002, 'Current', 15000.00, '2022-05-15', 2, 202),
(100003, 'Saving', 35000.00, '2023-03-22', 3, 203),
(100004, 'Business', 12000.00, '2021-11-19', 4, 204),
(100005, 'Saving', 50000.00, '2023-07-05', 5, 205),
(100006, 'Current', 22000.00, '2022-08-12', 6, 206),
(100007, 'Saving', 42000.00, '2023-04-28', 7, 207),
(100008, 'Business', 18000.00, '2021-09-14', 8, 208),
(100009, 'Saving', 30000.00, '2022-12-07', 9, 209),
(100010, 'Current', 27000.00, '2023-06-18', 10, 210);


select*from account;

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    LoanType varchar(255) not null,
    LoanAmount FLOAT not null,
    InterestRate FLOAT not null,
    StartDate DATE NULL not null,
    EndDate DATE NULL,
    CustomerID INT,
    BranchID INT  NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);
desc loans;

INSERT INTO Loans (LoanID, LoanType, LoanAmount, InterestRate, StartDate, EndDate, CustomerID, BranchID) VALUES
(1001, 'Home Loan', 5000000.00, 7.5, '2023-01-10', '2033-01-10', 1, 201),
(1002, 'Personal Loan', 300000.00, 10.0, '2022-05-15', '2027-05-15', 2, 202),
(1003, 'Auto Loan', 800000.00, 8.5, '2023-03-22', '2028-03-22', 3, 203),
(1004, 'Education Loan', 1000000.00, 9.0, '2021-11-19', '2026-11-19', 4, 204),
(1005, 'Business Loan', 1200000.00, 11.0, '2023-07-05', '2028-07-05', 5, 205),
(1006, 'Personal Loan', 500000.00, 10.5, '2022-08-12', '2027-08-12', 6, NULL),
(1007, 'Home Loan', 4000000.00, 7.2, '2023-04-28', '2033-04-28', 7, 207),
(1008, 'Auto Loan', 900000.00, 8.8, '2021-09-14', '2026-09-14', 8, 208),
(1009, 'Education Loan', 1100000.00, 9.2, '2022-12-07', '2027-12-07', 9, NULL),
(1010, 'Business Loan', 1500000.00, 11.5, '2023-06-18', '2028-06-18', 10, 210);

select*from loans;

CREATE TABLE CreditCards (
    CreditCardID INT PRIMARY KEY not null,
    CardType VARCHAR(50) NOT NULL,
    CreditLimit FLOAT NOT NULL,
    ExpiryDate DATE NOT NULL,
    CustomerID INT,
    BranchID INT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

desc creditcards;

INSERT INTO CreditCards (CreditCardID, CardType, CreditLimit, ExpiryDate, CustomerID, BranchID) VALUES
(5001, 'Visa', 100000.00, '2026-05-31', 1, 201),
(5002, 'MasterCard', 150000.00, '2025-08-31', 2, 202),
(5003, 'American Express', 200000.00, '2027-12-31', 3, 203),
(5004, 'Visa', 120000.00, '2026-03-31', 4, 204),
(5005, 'MasterCard', 250000.00, '2025-11-30', 5, 205),
(5006, 'Visa', 90000.00, '2026-07-31', 6, NULL),
(5007, 'American Express', 300000.00, '2027-09-30', 7, 207),
(5008, 'MasterCard', 140000.00, '2025-02-28', 8, 208),
(5009, 'Visa', 110000.00, '2026-10-31', 9, NULL),
(5010, 'American Express', 220000.00, '2027-06-30', 10, 210);

select*from creditcards;

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY not null,
    TransactionType VARCHAR(50) NOT NULL,
    Amount FLOAT NOT NULL,
    TransactionDate DATE NOT NULL,
    AccountID INT,
    EmployeeID INT,
    FOREIGN KEY (AccountID) REFERENCES account(AccountID),
    FOREIGN KEY (EmployeeID) REFERENCES employee(EmployeeID)
);

desc transactions;

INSERT INTO Transactions (TransactionID, TransactionType, Amount, TransactionDate, AccountID, EmployeeID) VALUES
(20001, 'Deposit', 15000.00, '2024-01-15', 100001, 1),
(20002, 'Withdrawal', 5000.00, '2024-01-18', 100002, 2),
(20003, 'Transfer', 12000.00, '2024-01-20', 100003, 3),
(20004, 'Deposit', 25000.00, '2024-01-22', 100004, 4),
(20005, 'Withdrawal', 8000.00, '2024-01-25', 100005, 5),
(20006, 'Transfer', 10000.00, '2024-01-28', 100006, 6),
(20007, 'Deposit', 20000.00, '2024-02-01', 100007, 7),
(20008, 'Withdrawal', 7000.00, '2024-02-05', 100008, 8),
(20009, 'Deposit', 18000.00, '2024-02-10', 100009, 9),
(20010, 'Transfer', 22000.00, '2024-02-15', 100010, 10);

select*from Transactions;

CREATE TABLE LoanPayments (
    PaymentID INT PRIMARY KEY not null,
    PaymentAmount FLOAT NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentMode VARCHAR(50) NOT NULL,
    LoanID INT,
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);

desc loanpayments;

INSERT INTO LoanPayments (PaymentID, PaymentAmount, PaymentDate, PaymentMode, LoanID) VALUES
(30001, 25000.00, '2024-01-10', 'Online Transfer', 1001),
(30002, 15000.00, '2024-01-15', 'Cheque', 1002),
(30003, 20000.00, '2024-01-20', 'Cash', 1003),
(30004, 30000.00, '2024-01-25', 'Online Transfer', 1004),
(30005, 10000.00, '2024-02-01', 'Online Transfer', 1005),
(30006, 12000.00, '2024-02-05', 'Cheque', 1006),
(30007, 18000.00, '2024-02-10', 'Cash', 1007),
(30008, 22000.00, '2024-02-15', 'Online Transfer', 1008),
(30009, 16000.00, '2024-02-20', 'Cash', 1009),
(30010, 20000.00, '2024-02-25', 'Online Transfer', 1010);

select*from loanpayments;

SELECT Name 
FROM Employee 
WHERE EmployeeID = (SELECT EmployeeID 
                    FROM Transactions 
                    WHERE Amount = (SELECT Max(Amount) FROM Transactions));

SELECT AccountID 
FROM Account 
WHERE AccountID IN (
    SELECT AccountID 
    FROM Transactions 
    WHERE Amount > 20000
);

SELECT LoanID 
FROM Loans 
WHERE LoanID IN (
    SELECT LoanID 
    FROM LoanPayments 
    WHERE PaymentDate > '2024-02-01'
);

SELECT e.EmployeeID, e.Name, e.Position
FROM Employee e
WHERE e.EmployeeID = (
    SELECT t.EmployeeID
    FROM Transactions t
    WHERE t.Amount = (
        SELECT MAX(t2.Amount)
        FROM Transactions t2
    )
);

SELECT a.AccountID, a.AccountType, a.Balance
FROM Account a
WHERE a.AccountID IN (
    SELECT t.AccountID
    FROM Transactions t
    WHERE t.Amount > 10000
);


SELECT l.LoanID, l.LoanAmount, l.StartDate
FROM Loans l
WHERE l.LoanID IN (
    SELECT lp.LoanID
    FROM LoanPayments lp
    WHERE lp.PaymentDate > '2024-02-01'
);

SELECT c.CustomerID, c.Name
FROM Customer c
WHERE c.CustomerID NOT IN (
    SELECT l.CustomerID
    FROM Loans l
    WHERE l.LoanID IN (
        SELECT lp.LoanID
        FROM LoanPayments lp
        WHERE lp.PaymentAmount > 0
    )
);

SELECT e.EmployeeID, e.Name, e.Salary, e.BranchID
FROM Employee e
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employee e2
    WHERE e2.BranchID = e.BranchID
);

SELECT e.EmployeeID, e.Name, e.Salary
FROM Employee e
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employee e2
    WHERE e2.BranchID IN (
        SELECT b.BranchID
        FROM Branch b
        WHERE address = 'Mumbai'
    )
);

-- joins

SELECT a.AccountID, a.AccountType, a.Balance, c.Name AS CustomerName, t.Amount
FROM Account a
INNER JOIN Customer c ON a.CustomerID = c.CustomerID
INNER JOIN Transactions t ON a.AccountID = t.AccountID
WHERE t.Amount > 20000;

SELECT a.AccountID, a.AccountType, a.Balance, t.TransactionID, t.Amount
FROM Account a
LEFT JOIN Transactions t ON a.AccountID = t.AccountID;

SELECT e1.Name AS EmployeeName, e1.Salary, e2.Name AS ColleagueName, e2.Salary AS ColleagueSalary
FROM Employee e1
INNER JOIN Employee e2 ON e1.BranchID = e2.BranchID AND e1.EmployeeID != e2.EmployeeID;


-- right join

SELECT 
    t.TransactionID, t.TransactionType, t.Amount AS TransactionAmount, t.TransactionDate,a.AccountID, a.AccountType,
    a.Balance, b.BranchID, b.BranchName, b.Address AS BranchAddress FROM Transactions t
RIGHT JOIN 
    Account a ON t.AccountID = a.AccountID
RIGHT JOIN 
    Branch b ON a.BranchID = b.BranchID;
    
-- inner join    

SELECT 
    e.EmployeeID, e.Name AS EmployeeName, e.Position AS EmployeePosition, b.BranchID, b.BranchName, 
    COUNT(t.TransactionID) AS TotalTransactions, SUM(t.Amount) AS TotalTransactionAmount
FROM Employee e
INNER JOIN Branch b ON e.BranchID = b.BranchID INNER JOIN Transactions t ON e.EmployeeID = t.EmployeeID
GROUP BY e.EmployeeID, e.Name, e.Position, b.BranchID, b.BranchName
ORDER BY TotalTransactionAmount DESC;

-- cross join

SELECT c.CustomerID, c.Name AS CustomerName, c.Address AS CustomerAddress,b.BranchID, b.BranchName, a.AccountID,a.AccountType,
CASE WHEN a.Balance > 50000 THEN 'Eligible for Platinum Loan' WHEN a.Balance > 20000 THEN 'Eligible for Gold Loan'
ELSE 'Eligible for Silver Loan' END AS LoanOffer
FROM Customer c
CROSS JOIN Account a
CROSS JOIN Branch b
WHERE c.CustomerID = a.CustomerID AND b.BranchID = a.BranchID;

-- left join

SELECT 
    a.AccountID,a.AccountType,a.Balance,a.OpeningDate,c.CustomerID,c.Name AS CustomerName,c.Address AS CustomerAddress,b.BranchID,b.BranchName,b.Address AS BranchAddress,
    t.TransactionID,t.TransactionType,t.Amount AS LastTransactionAmount,t.TransactionDate AS LastTransactionDate
FROM Account a
LEFT JOIN Customer c ON a.CustomerID = c.CustomerID
LEFT JOIN Branch b ON a.BranchID = b.BranchID
LEFT JOIN Transactions t ON a.AccountID = t.AccountID AND t.TransactionDate = (
SELECT MAX(t2.TransactionDate)
FROM Transactions t2 WHERE t2.AccountID = a.AccountID);


-- views

CREATE VIEW LoanDetails AS
SELECT LoanID,LoanType,LoanAmount,StartDate
FROM Loans;

select*from LoanDetails;

CREATE VIEW AccountDetails AS
SELECT
    AccountID,
    AccountType,
    Balance,
    OpeningDate
FROM
    Account;
select*from AccountDetails;

CREATE VIEW CustomerLoans AS
SELECT
    LoanID,LoanType,LoanAmount,InterestRate,StartDate,EndDate,CustomerID
FROM
    Loans;
select*from CustomerLoans;

CREATE VIEW EmployeeDetails AS
SELECT
    EmployeeID, Name, Position,Salary, HiringDate, BranchID
FROM
    Employee;
select*from EmployeeDetails;

    







