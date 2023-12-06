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

-- DUMMY VALUES PLEASE edit the values
-- Insert data into Shift table
INSERT INTO Shift (Shift_ID, Shift_Start, Shift_End) VALUES
('Day', '07:00:00', '19:00:00'),
('Night', '19:00:00', '07:00:00');

-- Insert data into Employee table
INSERT INTO Employee (Employee_ID, Employee_FirstName, Employee_MiddleName, Employee_LastName, Employee_DateOfHire, Employee_ReportsTo) VALUES
(1, 'John', 'Doe', 'Smith', '2022-01-01', NULL),
(2, 'Jane', 'E.', 'Doe', '2022-02-15', 1),
(3, 'Robert', 'A.', 'Johnson', '2022-03-20', 1),
-- Add 7 more employee entries with unique data...

-- Insert data into Job table
INSERT INTO Job (Employee_ID, Employee_Position, Employee_Department, Employee_Status, Employee_Shift) VALUES
(1, 'Software Engineer', 'IT', 'Active', 'S1'),
(2, 'HR Specialist', 'Human Resources', 'Active', 'S2'),
(3, 'Sales Representative', 'Sales', 'Active', 'S3'),
-- Add 7 more employee entries with unique data...

-- Insert data into Timesheet table
INSERT INTO Timesheet (Timesheet_ID, Employee_ID, Timesheet_TimeIn, Timesheet_TimeOut) VALUES
(1, 1, '2023-01-01 08:00:00', '2023-01-01 17:00:00'),
(2, 2, '2023-01-02 09:00:00', '2023-01-02 18:00:00'),
(3, 3, '2023-01-03 10:00:00', '2023-01-03 19:00:00'),
-- Add 7 more employee entries with unique data...

-- Insert data into Health_Exam table
INSERT INTO Health_Exam (HE_ID, Employee_ID, HE_Date, HE_height, HE_Weight, HE_BloodType, HE_EyeColor, HE_DoctorName, HE_Assessment) VALUES
(1, 1, '2022-05-15', 170.5, 65.5, 'O+', 'Brown', 'Dr. Smith', 'Fit for work'),
(2, 2, '2022-06-20', 160.0, 55.0, 'A-', 'Blue', 'Dr. Johnson', 'Fit for work'),
(3, 3, '2022-07-25', 180.0, 75.0, 'B+', 'Green', 'Dr. Davis', 'Fit for work'),
-- Add 7 more employee entries with unique data...

-- Insert data into PDS table
INSERT INTO PDS (Employee_ID, Employee_Email, Employee_Address, Employee_ContactNumber, Employee_DateOfBirth, Employee_PlaceOfBirth, Employee_Sex, Employee_CivilStatus, Employee_Citizenship, Employee_HighestLevelOfEducation, Employee_School, Employee_YearGraduated, Employee_PhilHealthID, Employee_SSSID, Employee_PagIBIGID, Emergency_ContactName, Emergency_ContactRelationship, Emergency_ContactNumber) VALUES
(1, 'john.doe@example.com', '123 Main St, City', '123-456-7890', '1990-05-10', 'City', 'M', 'Single', 'American', 'Bachelor\'s Degree', 'University A', 2012, 'PH123456789', 'SSS123456789', 'PAG123456789', 'Emergency Contact 1', 'Friend', '111-222-3333'),
(2, 'jane.doe@example.com', '456 Oak St, Town', '987-654-3210', '1985-08-20', 'Town', 'F', 'Married', 'Canadian', 'Master\'s Degree', 'University B', 2010, 'PH987654321', 'SSS987654321', 'PAG987654321', 'Emergency Contact 2', 'Spouse', '444-555-6666'),
(3, 'robert.johnson@example.com', '789 Pine St, Village', '555-123-7890', '1992-02-28', 'Village', 'M', 'Single', 'British', 'Bachelor\'s Degree', 'University C', 2015, 'PH111222333', 'SSS444555666', 'PAG999888777', 'Emergency Contact 3', 'Parent', '777-888-9999');
-- Add 7 more employee entries with unique data...

