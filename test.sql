create database if not exists cmsc127;

use cmsc127;

-- TABLES 
create table if not exists Shift (
    Shift_ID varchar(255) not null,
    Shift_StartTime time not null,
    Shift_EndTime time not null,
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
    Job_ID int not null,
    Job_AcquisitionDate date not null,
    Job_Position varchar(255) not null,
    Job_Department varchar(255) not null,
    Employee_Status varchar(255) not null,
    Employee_Shift varchar(255) not null,
    Employee_ID int not null,
    primary key (Job_ID),
    foreign key (Employee_ID) references employee (Employee_ID) on update cascade,
    foreign key (Employee_Shift) references shift (Shift_ID) on update cascade
);

create table if not exists Timesheet (
    Timesheet_ID int not null,
    Timesheet_TimeIn datetime not null,
    Timesheet_TimeOut datetime,
    Employee_ID int not null,
    primary key (Timesheet_ID),
    foreign key (Employee_ID) references employee (Employee_ID) on update cascade
);

create table if not exists Health_Exam (
    HE_ID int not null ,
    HE_Date datetime not null,
    HE_Height decimal(5,2) not null,
    HE_Weight decimal(5,2) not null,
    HE_BloodType varchar(255) not null,
    HE_EyeColor varchar(255) not null,
    HE_DoctorName varchar(255) not null,
    HE_Assessment varchar(255) not null,
    Employee_ID int not null,
    primary key (HE_ID),
    foreign key (Employee_ID) references employee (Employee_ID) on update cascade
);

create table if not exists PDS(
    Employee_ID int not null,
    Employee_Email varchar(255) not null,
    Employee_Address varchar(255) not null,
    Employee_ContactNumber varchar(255) not null,
    Employee_DateOfBirth date not null,
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
-- New Data
INSERT INTO Shift (Shift_ID, Shift_StartTime, Shift_EndTime) VALUES 
('Day', '07:00:00', '19:00:00'),
('Night', '19:00:00', '7:00:00');

INSERT INTO Employee (Employee_ID, Employee_FirstName, Employee_MiddleName, Employee_LastName, Employee_DateOfHire, Employee_ReportsTo) VALUES 
(20160001, 'John', 'Doe', 'Smith', '2016-11-12', NULL),
(20170004, 'Jane', 'Elizabeth', 'Doe', '2017-09-08', 20160001),
(20180006, 'Robert', 'Albert', 'Johnson', '2018-12-22', 20160001),
(20170056, 'Emily', null, 'Davis', '2017-03-04', 20160001),
(20180025, 'Michael', 'David', 'Williams', '2018-09-04', 20170056),
(20190013, 'Sophia', null, 'Miller', '2019-05-01', 20160001),
(20190014, 'David', 'Elliott', 'Taylor', '2019-07-09', 20190013),
(20230007, 'Olivia', null, 'Anderson', '2023-02-16', 20170004),
(20230012, 'William', 'Federson', 'Brown', '2023-01-09', 20170004),
(20220001, 'Ava', null, 'Martin', '2022-03-18', 20170004),
(20170007, 'Isaac', null, 'Thompson', '2017-11-03', 20160001),
(20230008, 'Emma', 'Rose', 'Sanchez', '2023-05-07', 20170007),
(20230009, 'Liam', 'Michael', 'Ramirez', '2023-02-25', 20170007),
(20230010, 'Grace', null, 'Cruz', '2023-11-15', 20170007),
(20230011, 'Ethan', null, 'Martinez', '2023-11-09', 20170007),
(20160002, 'Hector', 'Cruz', 'Salamanca', '2016 M04 28', 20160001),
(20160076, 'Brian', null, 'Walter', '2016 M01 04', 20160002),
(20180004, 'Mary', 'Ann', 'Grace', '2018 M12 01', 20160001),
(20230021, 'Stephanie', 'Santiago', 'Olivarez', '2023 M08 10', 20180004),
(20190011, 'Jessie', null, 'James', '2019 M06 23', 20180004);

INSERT INTO Job (Job_ID, Job_AcquisitionDate, Employee_ID, Job_Position, Job_Department, Employee_Status, Employee_Shift) VALUES 
(51200887, '2016-10-28', 20160001, 'CEO', 'HR', 'Full-Time', 'Day'),
(78423543, '2017-01-01', 20170004, 'Project Manager', 'IT', 'Full-Time', 'Day'),
(19963104, '2018-08-12', 20180006, 'Administrative Officer', 'HR', 'Full-Time', 'Day'),
(40863581, '2017-08-31', 20170056, 'Cooperative Head', 'Cooperative', 'Full-Time', 'Night'),
(68728886, '2018-06-11', 20180025, 'Cooperative Staff', 'Cooperative', 'Full-Time', 'Day'),
(34317481, '2019-11-23', 20190013, 'Maintenance Head', 'Utility', 'Full-Time', 'Day'),
(07269592, '2019-12-20', 20190014, 'Maintenance Staff', 'Utility', 'Part-Time', 'Night'),
(41942484, '2023-03-14', 20230007, 'Application Developer', 'Development', 'Full-Time', 'Night'),
(19885110, '2023-05-11', 20230012, 'Application Developer', 'Development', 'Full-Time', 'Day'),
(87123660, '2022-06-03', 20220001, 'Application Developer', 'Development', 'Trainee', 'Day'),
(82125035, '2023 M02 01', 20170007, 'Bootcamp Manager', 'Bootcamp/ Academy', 'Full-Time', 'Day'),
(19147215, '2023 M02 04', 20230008, 'Instructor', 'Bootcamp/ Academy', 'Full-Time', 'Day'),
(21837711, '2023 M02 07', 20230009, 'Instructor', 'Bootcamp/ Academy', 'Full-Time', 'Day'),
(28967123, '2023 M02 07', 20230010, 'Instructor', 'Bootcamp/ Academy', 'Part-Time', 'Day'),
(83798636, '2023 M02 09', 20230011, 'Instructor', 'Bootcamp/ Academy', 'Part-Time', 'Night'),
(53582724, '2016 M04 28', 20160002, 'Marketing Head', 'Marketing and Customer Acquisition', 'Full-Time', 'Day'),
(26570116, '2016 M01 04', 20160076, 'Marketing Staff', 'Marketing and Customer Acquisition', 'Full-Time', 'Day'),
(35182732, '2018 M12 01', 20180004, 'SI Head', 'Supplies and Inventory', 'Full-Time', 'Day'),
(08531970, '2023 M08 10', 20230021, 'SI Staff', 'Supplies and Inventory', 'Part-Time', 'Day'),
(98895953, '2019 M06 23', 20190011, 'SI Staff', 'Supplies and Inventory', 'Full-Time', 'Day');

INSERT INTO Timesheet (Timesheet_ID, Employee_ID, Timesheet_TimeIn, Timesheet_TimeOut) VALUES 
(361437, 20160001, '2023-11-11 7:00:42', '2023-11-11 7:05:23'),
(184858, 20170004, '2023-11-11 7:01:23', '2023-11-11 7:06:38'),
(065026, 20180006, '2023-11-11 7:49:01', '2023-11-11 8:30:04'),
(015514, 20170056, '2023-11-11 7:02:41', '2023-11-12 7:03:42'),
(758075, 20180025, '2023-11-12 7:30:32', '2023-11-12 9:10:03'),
(782880, 20190013, '2023-11-12 7:21:22', '2023-11-12 7:00:56'),
(088559, 20190014, '2023-11-12 8:02:21', '2023-11-13 8:05:12'),
(287360, 20230007, '2023-11-12 7:45:21', '2023-11-13 7:30:20'),
(186356, 20230012, '2023-11-13 8:57:03', '2023-11-13 9:30:32'),
(530640, 20220001, '2023-11-13 7:45:10', '2023-11-13 7:05:34'),
(057033, 20170007, '2023-11-13 6:30:21', '2023-11-13 8:10:04'),
(783279, 20230008, '2023-11-13 7:41:20', '2023-11-13 7:03:41'),
(857894, 20230009, '2023-11-13 9:00:23', '2023-11-13 9:00:56'),
(696100, 20230010, '2023-11-13 7:30:21', '2023-11-13 8:20:11'),
(759973, 20230011, '2023-11-13 6:30:21', '2023-11-14 6:28:21'),
(881969, 20160002, '2023-11-14 6:58:49', '2023-11-14 5:48:09'),
(506918, 20160076, '2023-11-14 7:21:20', '2023-11-14 7:57:41'),
(822945, 20180004, '2023-11-14 9:02:12', '2023-11-14 8:05:21'),
(209432, 20230021, '2023-11-14 7:01:05', '2023-11-14 7:00:49'),
(120701, 20190011, '2023-11-14 6:59:03', '2023-11-14 7:01:11');

-- If the ID starts with 0, the zeros in front get removed after insertion. Example, ID: 00458221 => 458221
INSERT INTO Health_Exam (HE_ID, Employee_ID, HE_Date, HE_Height, HE_Weight, HE_BloodType, HE_EyeColor, HE_DoctorName, HE_Assessment) VALUES 
(66155257, 20160001, '2023-11-10 8:00:00', '170.5', '70.2', 'AB-', 'Black', 'Dr. Smith', 'Fit for work'),
(28033234, 20170004, '2023-11-11 12:22:00', '165.7', '55.8', 'A', 'Brown', 'Dr. Smith', 'Fit for work'),
(79530768, 20180006, '2023-11-12 8:00:00', '170.5', '75.5', 'A+', 'Black', 'Dr. Smith', 'Fit for work'),
(66167683, 20170056, '2023-11-13 8:00:00', '180.2', '48.6', 'O-', 'Blue', 'Dr. Smith', 'Fit for work'),
(90795247, 20180025, '2023-11-14 8:00:00', '170.9', '68.3', 'AB+', 'Brown', 'Dr. Smith', 'Fit for work'),
(77750166, 20190013, '2023-11-15 8:00:00', '168.4', '60', 'B-', 'Black', 'Dr. Smith', 'Fit for work'),
(42204784, 20190014, '2023-11-16 8:00:00', '166.9', '50.7', 'A-', 'Black', 'Dr. Smith', 'Fit for work'),
(64132037, 20230007, '2023-11-17 8:00:00', '173.4', '80.1', 'O+', 'Black', 'Dr. Smith', 'Fit for work'),
(00458221, 20230012, '2023-12-18 8:00:00', '169.1', '72.8', 'B+', 'Brown', 'Dr. Smith', 'Fit for work'),
(09098138, 20220001, '2023-12-18 7:30:00', '168.7', '71.5', 'B', 'Green', 'Dr. Smith', 'Fit for work'),
(80359366, 20170007, '2023-12-19 7:30:00', '155.1', '65.3', 'A-', 'Black', 'Dr. Smith', 'Fit for work'),
(22411980, 20230008, '2023-12-20 8:12:00', '140.5', '68.2', 'A+', 'Black', 'Dr. Smith', 'Fit for work'),
(31934538, 20230009, '2023-12-21 7:45:00', '167.3', '55.9', 'AB+', 'Blue', 'Dr. Smith', 'Fit for work'),
(19735411, 20230010, '2023-12-22 8:30:00', '136.0', '52.3', 'O+', 'Brown', 'Dr. Smith', 'Fit for work'),
(92641137, 20230011, '2023-12-23 8:12:00', '173.0', '63', 'B-', 'Brown', 'Dr. Smith', 'Fit for work'),
(84382135, 20160002, '2023-12-24 8:18:00', '170.2', '72', 'O-', 'Black', 'Dr. Smith', 'Fit for work'),
(18854248, 20160076, '2023-12-25 7:55:00', '173.8', '79.3', 'A', 'Brown', 'Dr. Smith', 'Fit for work'),
(76493520, 20180004, '2023-12-26 8:03:00', '145.3', '58.2', 'B-', 'Black', 'Dr. Smith', 'Fit for work'),
(69876162, 20230021, '2023-12-27 8:35:00', '152.3', '60.1', 'AB', 'Black', 'Dr. Smith', 'Fit for work'),
(41057364, 20190011, '2023-12-28 7:52:00', '149.9', '57.3', 'A+', 'Black', 'Dr. Smith', 'Fit for work');

INSERT INTO PDS (Employee_ID, Employee_Email, Employee_Address, Employee_ContactNumber, Employee_DateOfBirth, Employee_PlaceOfBirth, Employee_Sex, Employee_CivilStatus, Employee_Citizenship, Employee_HighestLevelOfEducation, Employee_School, Employee_YearGraduated, Employee_PhilHealthID, Employee_SSSID, Employee_PagIBIGID, Emergency_ContactName, Emergency_ContactRelationship, Emergency_ContactNumber) VALUES 
(20160001, 'jdsmith@onetwentyseven.com', '23 Main St, City', '+63 985 976-9095', '1984-04-25', 'Pasig City', 'M', 'Single', 'Filipino', 'PhD', 'UP Diliman', '2012', '87-13783541-5', '1753-1472439-5', '5530-0167-8967', 'Jeremy Smith', 'Brother', '+63 960 660-8866'),
(20170004, 'jedoe@onetwentyseven.com', '456 Oak St, Town', '+63 907 843-3035', '1991-09-13', 'Imus', 'F', 'Single', 'Filipino', 'Bachelor\'s Degree', 'UST', '2015', '48-18993821-6', '3497-7004892-0', '0829-4400-3402', 'Job Doe', 'Father', '+63 943 736-3440'),
(20180006, 'rajohnson@onetwentyseven.com', '789 Pine St, Village', '+63 993 563-4702', '1989-10-04', 'Manila', 'M', 'Single', 'Chinese', 'PhD', 'UP Baguio', '2017', '88-37805240-8', '4999-1852156-1', '5434-5851-0731', 'John Johnson', 'Father', '+63 900 491-2356'),
(20170056, 'edavis@onetwentyseven.com', '101 Maple St, County', '+63 903 245-2877', '1988-12-23', 'Calamba', 'F', 'Single', 'American', 'PhD', 'FEU', '2016', '03-99815859-1', '7522-3674751-3', '5919-9282-7638', 'Dean Davis', 'Grandfather', '+63 928 667-5170'),
(20180025, 'mdwilliams@onetwentyseven.com', '202 Cedar St, Hamlet', '+63 983 366-5205', '1991-03-14', 'Tokyo', 'M', 'Single', 'Irish', 'Master\'s Degree', 'ADMU', '2017', '75-99919902-3', '7930-0373421-7', '8948-7068-0867', 'Jodie Williams', 'Sister', '+63 946 912-7299'),
(20190013, 'smiller@onetwentyseven.com', '303 Elm St, City', '+63 931 287-0774', '1993-02-14', 'Hanoi', 'F', 'Single', 'Vietnamese', 'Bachelor\'s Degree', 'UP Diliman', '2017', '28-23685543-2', '7703-0530905-8', '4852-7172-1591', 'Jessica Miller', 'Cousin', '+63 921 177-8728'),
(20190014, 'detaylor@onetwentyseven.com', '404 Birch St, Town', '+63 903 551-2806', '1996-01-01', 'Baguio', 'M', 'Single', 'Filipino', 'Bachelor\'s Degree', 'SLU', '2020', '53-93863889-8', '6616-3258394-2', '3876-7691-8254', 'Swift Taylor', 'Mother', '+63 935 045-4634'),
(20230007, 'oanderson@onetwentyseven.com', '505 Redwood St, Village', '+63 999 242-4491', '1995-05-06', 'Davao', 'F', 'Single', 'Belgian', 'Bachelor\'s Degree', 'Stanford', '2019', '86-35338081-2', '3949-2947932-9', '7352-3109-9992', 'Keanu Anderson', 'Brother', '+63 921 224-9439'),
(20230012, 'wfbrown@onetwentyseven.com', '606 Cedar St, County', '+63 913 926-0726', '1994-02-01', 'Los Baños', 'M', 'Single', 'Indian', 'Bachelor\'s Degree', 'NU', '2018', '75-52833211-1', '4643-4193613-4', '4246-0252-5606', 'Blue Brown', 'Sister', '+63 964 559-1880'),
(20220001, 'amartin@onetwentyseven.com', '707 Maple St, Hamlet', '+63 912 736-3254', '1993-11-27', 'La Trinidad', 'F', 'Single', 'Filipino', 'PhD', 'ADMU', '2021', '80-50010748-0', '2970-2352953-4', '2496-5669-4541', 'Jeorg Martin', 'Father', '+63 961 170-7253'),
(20170007, 'ithompson@onetwentyseven.com', '808 Roxas Boulevard', '+63 978 724-8109', '1982-5-18 12:00:00 AM', 'Pasay City', 'M', 'Married', 'American', 'Master\'s Degree', 'MIT', '2008', '51-98521420-4', '0483-4863872-9', '4681-4777-3482', 'Jessica Thompson', 'Wife', '+63 949 392-2631'),
(20230008, 'ersanchez@onetwentyseven.com', '909 Ayala Avenue', '+63 902 619-3123', '1985-8-30 12:00:00 AM', 'Makati', 'F', 'Married', 'Filipino', 'Master\'s Degree', 'UP Baguio', '2011', '82-36879434-7', '6329-8045019-8', '9250-5540-2887', 'Eric Sanchez', 'Husband', '+63 976 302-1002'),
(20230009, 'lmramirez@onetwentyseven.com', '101 Katipunan Avenue', '+63 924 285-3070', '1994-11-2 12:00:00 AM', 'Quezon City', 'M', 'Single', 'Filipino', 'Master\'s Degree', 'UP Baguio', '2020', '46-78207238-8', '7144-0612658-7', '7873-9393-1886', 'Liza Ramirez', 'Sister', '+63 913 910-2166'),
(20230010, 'gcruz@onetwentyseven.com', '202 Shaw Boulevard', '+63 929 155-3323', '1999-3-25 12:00:00 AM', 'Mandaluyong', 'F', 'Single', 'Filipino', 'Bachelor\'s Degree', 'UP Diliman', '2023', '30-55002409-4', '4638-3480580-3', '6171-7544-1977', 'George Cruz', 'Father', '+63 915 785-5653'),
(20230011, 'emartinez@onetwentyseven.com', '303 McKinley Parkway', '+63 908 221-1266', '1998-7-12 12:00:00 AM', 'Taguig', 'M', 'Single', 'Filipino', 'Bachelor\'s Degree', 'UC', '2022', '24-71579831-5', '9749-9151321-1', '4756-8117-7666', 'Emily Martinez', 'Mother', '+63 941 279-0420'),
(20160002, 'hcsalamanca@onetwentyseven.com', '105 Roxas Boulevard', '+63 902 518-9958', '1993-2-5 12:00:00 AM', 'Parañaque', 'M', 'Single', 'Filipino', 'PhD', 'UP Diliman', '2021', '68-28369812-5', '1560-3855001-5', '4206-2798-4551', 'Zala Salamanca', 'Mother', '+63 996 902-6932'),
(20160076, 'bwalter@onetwentyseven.com', '108 Kayang St.', '+63 948 143-0723', '1992-4-12 12:00:00 AM', 'Benguet', 'M', 'Single', 'Filipino', 'Bachelor\'s Degree', 'SLU', '2016', '65-19225342-7', '4443-1542045-9', '3509-1558-4100', 'Dale Walter', 'Brother', '+63 921 419-5467'),
(20180004, 'magrace@onetwentyseven.com', '28 Engineers Hill, Baguio', '+63 987 762-5118', '1993-5-21 12:00:00 AM', 'La Trinidad', 'F', 'Single', 'American', 'Master\'s Degree', 'UP Baguio', '2019', '75-37343526-9', '9728-2993538-8', '6165-0275-7829', 'Love Peace', 'Friend', '+63 924 165-6498'),
(20230021, 'ssolivarez@onetwentyseven.com', '158 Military Cut Off, Baguio', '+63 993 159-0556', '1998-9-30 12:00:00 AM', 'La Trinidad', 'F', 'Single', 'Filipino', 'Bachelor\'s Degree', 'UC', '2022', '27-61273908-0', '2255-7477071-7', '1841-2229-2751', 'Melanie Olivarez', 'Sister', '+63 962 038-0160'),
(20190011, 'jjames@onetwentyseven.com', 'Purok 12, Irisan', '+63 912 052-6469', '1997-2-21 12:00:00 AM', 'Benguet', 'F', 'Single', 'Filipino', 'Bachelor\'s Degree', 'UB ', '2021', '95-16029780-3', '1037-3212863-0', '5376-7473-5950', 'James Chord', 'Brother', '+63 912 226-9381');
