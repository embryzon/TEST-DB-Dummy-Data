create database if not exists cmsc127;

use cmsc127;

-- TABLES 
create table if not exists Shift (
    Shift_ID varchar(255) not null,
    Shift_Start time not null,
    Shift_End time not null,
    primary key (Shift_ID)
);

create table if not exists Employee (
    Employee_ID int not null,
    Employee_FirstName varchar(255) not null,
    Employee_MiddleName varchar(255),
    Employee_LastName varchar(255),
    Employee_DateOfHire date,
    Employee_ReportsTo int,
    primary key (Employee_ID),
    foreign key (Employee_ReportsTo) references employee (Employee_ID) on update cascade
);


create table if not exists Job (
    Employee_ID int not null,
    Employee_Position varchar(255) not null,
    Employee_Department varchar(255) not null,
    Employee_Status varchar(255) not null,
    Employee_Shift varchar(255) not null,
    primary key (Employee_ID),
    foreign key (Employee_ID) references employee (Employee_ID) on update cascade,
    foreign key (Employee_Shift) references shift (Shift_ID) on update cascade
);

create table if not exists Timesheet (
    Timesheet_ID int not null,
    Employee_ID int not null,
    Timesheet_TimeIn datetime not null,
    Timesheet_TimeOut datetime,
    primary key (Timesheet_ID),
    foreign key (Employee_ID) references employee (Employee_ID) on update cascade
);

create table if not exists Health_Exam (
    HE_ID int not null ,
    Employee_ID int not null,
    HE_Date datetime not null,
    HE_height decimal(3,2) not null,
    HE_Weight decimal(3,2) not null,
    HE_BloodType varchar(255) not null,
    HE_EyeColor varchar(255) not null,
    HE_DoctorName varchar(255) not null,
    HE_Assessment varchar(255) not null,
    primary key (HE_ID),
    foreign key (Employee_ID) references employee (Employee_ID) on update cascade
);

create table if not exists PDS(
    Employee_ID int not null,
    Employee_Email varchar(255) not null,
    Employee_Address varchar(255) not null,
    Employee_ContactNumber varchar(255) not null,
    Employee_DateOfBirth datetime not null,
    Employee_PlaceOfBirth varchar(255) not null,
    Employee_Sex char(1) not null,
    Employee_CivilStatus varchar(255) not null,
    Employee_Citizenship varchar(255) not null,
    Employee_HighestLevelOfEducation varchar(255) not null,
    Employee_School varchar(255) not null,
    Employee_YearGraduated year not null,
    Employee_PhilHealthID varchar(255) not null,
    Employee_SSSID varchar(255) not null,
    Employee_PagIBIGID varchar(255),
    Emergency_ContactName varchar(255) not null,
    Emergency_ContactRelationship varchar(255) not null,
    Emergency_ContactNumber varchar(255) not null,
    primary key (Employee_ID),
    foreign key (Employee_ID) references employee (Employee_ID) on update cascade
);

-- DUMMY DATA
-- Insert data into Shift table
INSERT INTO Shift (Shift_ID, Shift_Start, Shift_End) VALUES
('Day', '07:00:00', '19:00:00'),
('Night', '19:00:00', '07:00:00');

-- Insert data into Employee table
INSERT INTO Employee (Employee_ID, Employee_FirstName, Employee_MiddleName, Employee_LastName, Employee_DateOfHire, Employee_ReportsTo) VALUES
(1, 'John', 'Doe', 'Smith', '2022-01-01', NULL),
(2, 'Jane', 'E.', 'Doe', '2022-02-15', 1),
(3, 'Robert', 'A.', 'Johnson', '2022-03-20', 1),
(4, 'Emily', null, 'Davis', '2021-04-05', 2),
(5, 'Michael', 'D', 'Williams', '2021-05-12', 2),
(6, 'Sophia', null, 'Miller', '2021-06-18', 3),
(7, 'David', 'E', 'Taylor', '2021-07-22', 3),
(8, 'Olivia', null, 'Anderson', '2021-08-30', 4),
(9, 'William', 'F', 'Brown', '2021-09-14', 4),
(10, 'Ava', null, 'Martin', '2021-10-25', 5);

-- Insert data into Job table
INSERT INTO Job (Employee_ID, Employee_Position, Employee_Department, Employee_Status, Employee_Shift) VALUES
(1, 'Software Engineer', 'IT', 'Active', 'S1'),
(2, 'HR Specialist', 'Human Resources', 'Active', 'S2'),
(3, 'Sales Representative', 'Sales', 'Active', 'S3'),
-- Add 7 more employee entries with unique data...

-- Insert data into Timesheet table
INSERT INTO Timesheet (Timesheet_ID, Employee_ID, Timesheet_TimeIn, Timesheet_TimeOut) VALUES
(1, 1, '2021-01-15 08:00:00', '2021-01-15 17:00:00'),
(2, 2, '2021-01-15 09:30:00', '2021-01-15 18:00:00'),
(3, 3, '2021-01-15 10:45:00', '2021-01-15 17:30:00'),
(4, 4, '2021-01-15 11:20:00', '2021-01-15 16:45:00'),
(5, 5, '2021-01-15 13:15:00', '2021-01-15 18:30:00'),
(6, 6, '2021-01-15 14:30:00', '2021-01-15 17:00:00'),
(7, 7, '2021-01-15 15:45:00', '2021-01-15 18:45:00'),
(8, 8, '2021-01-15 16:10:00', '2021-01-15 17:30:00'),
(9, 9, '2021-01-15 17:25:00', '2021-01-15 18:00:00'),
(10, 10, '2021-01-15 18:40:00', '2021-01-15 20:00:00');

-- Insert data into Health_Exam table
INSERT INTO Health_Exam (HE_ID, Employee_ID, HE_Date, HE_height, HE_Weight, HE_BloodType, HE_EyeColor, HE_DoctorName, HE_Assessment) VALUES
(1, 1, '2021-01-15 08:00:00', 170.5, 70.2, 'A+', 'Brown', 'Dr. Smith', 'Fit for work'),
(2, 2, '2021-02-20 09:30:00', 165.0, 55.8, 'B-', 'Blue', 'Dr. Johnson', 'Fit for work'),
(3, 3, '2021-03-10 10:45:00', 180.2, 75.5, 'O+', 'Green', 'Dr. Davis', 'Fit for work'),
(4, 4, '2021-04-05 11:20:00', 155.8, 48.6, 'AB+', 'Hazel', 'Dr. White', 'Fit for work'),
(5, 5, '2021-05-12 13:15:00', 175.0, 68.3, 'A-', 'Brown', 'Dr. Lee', 'Fit for work'),
(6, 6, '2021-06-18 14:30:00', 160.5, 60.0, 'B+', 'Blue', 'Dr. Carter', 'Fit for work'),
(7, 7, '2021-07-22 15:45:00', 185.0, 80.1, 'O-', 'Green', 'Dr. Johnson', 'Fit for work'),
(8, 8, '2021-08-30 16:10:00', 152.3, 50.7, 'AB-', 'Hazel', 'Dr. Brown', 'Fit for work'),
(9, 9, '2021-09-14 17:25:00', 170.0, 72.8, 'A+', 'Brown', 'Dr. Taylor', 'Fit for work'),
(10, 10, '2021-10-25 18:40:00', 168.7, 71.5, 'B-', 'Blue', 'Dr. Martin', 'Fit for work');

-- Insert data into PDS table
INSERT INTO PDS (Employee_ID, Employee_Email, Employee_Address, Employee_ContactNumber, Employee_DateOfBirth, Employee_PlaceOfBirth, Employee_Sex, Employee_CivilStatus, Employee_Citizenship, Employee_HighestLevelOfEducation, Employee_School, Employee_YearGraduated, Employee_PhilHealthID, Employee_SSSID, Employee_PagIBIGID, Emergency_ContactName, Emergency_ContactRelationship, Emergency_ContactNumber) VALUES
(1, 'john.doe@example.com', '123 Main St, City', '123-456-7890', '1990-05-15', 'City', 'M', 'Single', 'American', 'Bachelor\'s Degree', 'University A', 2012, 'PH123456789', 'SSS123456789', 'HDMF987654321', 'Emergency Contact 1', 'Friend', '111-222-3333'),
(2, 'jane.smith@example.com', '456 Oak St, Town', '987-654-3210', '1988-08-22', 'Town', 'F', 'Married', 'Canadian', 'Master\'s Degree', 'University B', 2015, 'PH987654321', 'SSS987654321', 'HDMF123456789', 'Emergency Contact 2', 'Spouse', '444-555-6666'),
(3, 'robert.johnson@example.com', '789 Pine St, Village', '555-444-3333', '1995-03-10', 'Village', 'M', 'Single', 'British', 'High School Diploma', 'High School C', 2010, 'PH555555555', 'SSS555555555', 'HDMF333333333', 'Emergency Contact 3', 'Parent', '777-888-9999'),
(4, 'emily.davis@example.com', '101 Maple St, County', '111-222-3333', '1982-07-05', 'County', 'F', 'Widowed', 'Irish', 'Ph.D.', 'University D', 2018, 'PH111111111', 'SSS111111111', 'HDMF111111111', 'Emergency Contact 4', 'Sibling', '222-333-4444'),
(5, 'michael.williams@example.com', '202 Cedar St, Hamlet', '333-444-5555', '1989-11-12', 'Hamlet', 'M', 'Divorced', 'Australian', 'Bachelor\'s Degree', 'University E', 2013, 'PH333333333', 'SSS333333333', 'HDMF222222222', 'Emergency Contact 5', 'Friend', '555-666-7777'),
(6, 'sophia.miller@example.com', '303 Elm St, City', '777-888-9999', '1992-06-18', 'City', 'F', 'Single', 'French', 'Master\'s Degree', 'University F', 2016, 'PH777777777', 'SSS777777777', 'HDMF444444444', 'Emergency Contact 6', 'Colleague', '888-999-0000'),
(7, 'david.taylor@example.com', '404 Birch St, Town', '222-333-4444', '1985-09-22', 'Town', 'M', 'Married', 'German', 'Bachelor\'s Degree', 'University G', 2011, 'PH444444444', 'SSS444444444', 'HDMF555555555', 'Emergency Contact 7', 'Spouse', '999-000-1111'),
(8, 'olivia.anderson@example.com', '505 Redwood St, Village', '444-555-6666', '1998-02-28', 'Village', 'F', 'Single', 'Italian', 'High School Diploma', 'High School H', 2014, 'PH666666666', 'SSS666666666', 'HDMF666666666', 'Emergency Contact 8', 'Parent', '000-111-2222'),
(9, 'william.brown@example.com', '606 Cedar St, County', '555-666-7777', '1993-09-14', 'County', 'M', 'Widowed', 'Spanish', 'Ph.D.', 'University I', 2019, 'PH999999999', 'SSS999999999', 'HDMF999999999', 'Emergency Contact 9', 'Sibling', '111-222-3333'),
(10, 'ava.martin@example.com', '707 Maple St, Hamlet', '666-777-8888', '1995-10-25', 'Hamlet', 'F', 'Divorced', 'Greek', 'Bachelor\'s Degree', 'University J', 2017, 'PH888888888', 'SSS888888888', 'HDMF888888888', 'Emergency Contact 10', 'Friend', '222-333-4444');

