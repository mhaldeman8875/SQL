use LibraryManagementSystem_Test

/*create tables*/
create table LIBRARY_BRANCH (
	BranchID int primary key not null identity (100,1),
	BranchName varchar(50) not null,
	Address varchar(100) not null
);


create table PUBLISHER (
	PublisherName varchar(50) primary key not null,
	Address varchar(100) not null,
	Phone varchar(30) not null
);

drop table PUBLISHER

create table BOOKS (
	BookID int primary key not null identity (200, 1),
	Title varchar(50) not null unique,
	PublisherName varchar(50) not null constraint fk_PublisherName foreign key references PUBLISHER(PublisherName) on update cascade on delete cascade
);

drop table BOOKS

create table BOOK_AUTHORS (
	BookID int not null constraint fk_BookID foreign key references BOOKS(BookID) on update cascade on delete cascade,
	AuthorName varchar(50) not null
);

drop table BOOK_AUTHORS

create table BOOK_COPIES (
	BookID varchar(50) not null constraint fk_Title foreign key references BOOKS(Title) on update cascade on delete cascade,
	BranchID int not null constraint fk_BranchID foreign key references LIBRARY_BRANCH(BranchID),
	NumberOfCopies int not null
);

drop table BOOK_COPIES

create table BORROWER (
	CardNo int primary key not null identity (7264502,1),
	Name varchar(50) not null,
	Address varchar(50) not null,
	Phone varchar(30) not null
);

drop table BORROWER

create table BOOK_LOANS	(
	BookID varchar(50) not null constraint fk_BookTitle foreign key references BOOKS(Title) on update cascade on delete cascade,
	BranchID int not null constraint fk_BranchName foreign key references LIBRARY_BRANCH(BranchID) on update cascade on delete cascade,
	CardNo int not null constraint fk_CardNo foreign key references BORROWER(CardNo) on update cascade on delete cascade,
	DateOut date,
	DateDue date
);

drop table BOOK_LOANS
GO

/*Populate Tables*/
insert into LIBRARY_BRANCH
	(BranchName, Address)
	values
	('Central', '172 1st Street'),
	('Sharpstown', '819 16th Avenue'),
	('SODO', '1739 3rd Ave N'),
	('Eastgate', '119 Main Street')
;

insert into PUBLISHER
	(PublisherName, Address, Phone)
	values
	('Hachette Livre', '221B Bakers Street', '615-374-1937'),
	('HarperCollins', '5269 Holly Ave', '736-836-9936'),
	('Bloomsbury Publishing', '891 Wallingford Ave', '206-186-2836'),
	('Macmillian Publishers', '718 121st Lane', '253-137-1937'),
	('Simon & Schuster', '2837 N 156th Place', '775-863-3862'),
	('George Allen & Unwin', '1763 8th Street', '318-382-4842')
;

insert into BOOKS
	(Title, PublisherName)
	values
	('The Lost Tribe', 'Macmillian Publishers'),
	('IT', 'Simon & Schuster'),
	('The Green Mile', 'Simon & Schuster'),
	('Pet Sematary', 'Simon & Schuster'),
	('The Shining', 'Simon & Schuster'),
	('Carrie', 'Simon & Schuster'),
	('Julies Wolf Pack', 'HarperCollins'), /*Jean Craighead George*/
	('An Assassins Guide to Love and Treason', 'Hachette Livre'), /*Virginia Boecker*/
	('Muse of Nightmares', 'Hachette Livre'),/*Laini Taylor*/
	('Nightblood', 'Hachette Livre'),/*Elly Blake*/
	('The Big Nine', 'Hachette Livre'),/*Amy Webb*/
	('The Hobbit', 'George Allen & Unwin'),/*J.R.R. Tolkien*/
	('The Lord of the Rings', 'George Allen & Unwin'),
	('White Fang', 'Macmillian Publishers'),/*Jack London*/
	('The Call of the Wild', 'Macmillian Publishers'),
	('Harry Potter and the Socerers Stone', 'Bloomsbury Publishing'),/*JK Rowling*/
	('Harry Potter and the Chamber of Secrets', 'Bloomsbury Publishing'),
	('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury Publishing'),
	('Harry Potter and the Goblet of Fire', 'Bloomsbury Publishing'),
	('Harry Potter and the Order of the Pheonix', 'Bloomsbury Publishing'),
	('Harry Potter and the Half Blood Prince', 'Bloomsbury Publishing'),
	('Harry Potter and the Deathly Hallows', 'Bloomsbury Publishing')
;

insert into BOOK_AUTHORS 
	(BookID, AuthorName)
	values
	(200, 'Mark Lee'),
	(201, 'Steven King'),
	(202, 'Steven King'),
	(203, 'Steven King'),
	(204, 'Steven King'),
	(205, 'Steven King'),
	(206, 'Jean Craighead George'),
	(207, 'Virginia Boecker'),
	(208, 'Laini Taylor'),
	(209, 'Elly Blake'),
	(210, 'Amy Webb'),
	(211, 'J.R.R. Tolkien'),
	(212, 'J.R.R. Tolkien'),
	(213, 'Jack London'),
	(214, 'Jack London'),
	(215, 'JK Rowling'),
	(216, 'JK Rowling'),
	(217, 'JK Rowling'),
	(218, 'JK Rowling'),
	(219, 'JK Rowling'),
	(221, 'JK Rowling')
;

insert into BOOK_COPIES 
	(BookID, BranchID, NumberOfCopies)
	values
	('The Lost Tribe', 101, 4),
	('The Lost Tribe', 102, 3), 
	('IT', 100, 2),
	('IT', 102, 3), 
	('The Green Mile', 100, 2),
	('The Green Mile', 103, 4),
	('Pet Sematary', 101, 5),
	('Pet Sematary', 103, 4),
	('The Shining', 101, 2),
	('Carrie', 102, 3), 
	('Julies Wolf Pack', 101, 6),
	('Julies Wolf Pack', 102, 3), 
	('An Assassins Guide to Love and Treason', 101, 3),
	('An Assassins Guide to Love and Treason', 103, 3),
	('Muse of Nightmares', 101, 2),
	('Muse of Nightmares', 102, 5), 
	('Nightblood', 101, 2),
	('Nightblood', 102, 2), 
	('The Big Nine', 101, 8),
	('The Big Nine', 102, 3), 
	('The Hobbit', 101, 6),
	('The Hobbit', 102, 6), 
	('The Hobbit', 103, 6),
	('The Lord of the Rings', 101, 8),
	('The Lord of the Rings', 102, 10),
	('The Lord of the Rings', 103, 10), 
	('White Fang', 100, 2),
	('White Fang', 102, 4),
	('White Fang', 103, 4), 
	('The Call of the Wild', 100, 8),
	('The Call of the Wild', 103, 8),
	('Harry Potter and the Socerers Stone', 100, 7),
	('Harry Potter and the Socerers Stone', 103, 7),
	('Harry Potter and the Chamber of Secrets', 100, 9),
	('Harry Potter and the Chamber of Secrets', 103, 9),
	('Harry Potter and the Prisoner of Azkaban', 100, 6),
	('Harry Potter and the Prisoner of Azkaban', 103, 6),
	('Harry Potter and the Goblet of Fire', 100, 4),
	('Harry Potter and the Goblet of Fire', 103, 4),
	('Harry Potter and the Order of the Pheonix', 100, 7),
	('Harry Potter and the Order of the Pheonix', 103, 7),
	('Harry Potter and the Half Blood Prince', 100, 8),
	('Harry Potter and the Half Blood Prince', 103, 8),
	('Harry Potter and the Deathly Hallows', 100, 9),
	('Harry Potter and the Deathly Hallows', 103, 9)
;

insert into BORROWER
	(Name, Address, Phone)
	values
	('Joe Smith', '2345 34th Ave NW', '206-737-4826'),
	('Amy Smith', '2345 34th Ave NW', '206-235-8237'),
	('Matt Doe', '7345 12th Street', '206-854-3846'),
	('Sharon Adams', '672 3rd Place', '206-762-8462'),
	('Buck Up', '8888 167th Ave SE', '425-745-7832'),
	('Padge Long', '56th Street S', '425-898-6324'),
	('Cheryl Bonners', '896 2nd Lane', '206-737-7254'),
	('Amy MacIntosh', '321 1st Lane', '206-591-4432'),
	('William Sparks', '519 N 11th Court', '206-491-4050'),
	('Joshua Adams', '672 3rd Place', '206-382-0956')
;

insert into BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	values
	('The Lost Tribe', 101, 7264504, 2018-12-20, GETDATE()),
	('The Lost Tribe', 102, 7264502, 2019-1-2, 2019-4-4), 
	('IT', 100, 7264504, 2019-3-8, 2019-6-8),
	('IT', 102, 7264502, 2019-1-2, 2019-4-4), 
	('The Green Mile', 100, 7264504, 2018-12-20, GETDATE()),
	('The Green Mile', 103, 7264502, 2019-1-2, 2019-4-4),
	('Pet Sematary', 101, 7264504, 2019-3-8, 2019-6-8),
	('Pet Sematary', 103, 7264502, 2019-2-13, 2019-5-13),
	('The Shining', 101, 7264502, 2019-2-13, 2019-5-13),
	('Carrie', 102, 7264504, 2019-3-8, 2019-6-8),
	('Carrie', 102, 7264502, 2019-2-13, 2019-5-13),  
	('Julies Wolf Pack', 101, 7264505, 2019-1-3, 2019-4-3),
	('Julies Wolf Pack', 102, 7264503, 2018-12-15, GETDATE()), 
	('An Assassins Guide to Love and Treason', 101, 7264504, 2018-12-20, GETDATE()),
	('An Assassins Guide to Love and Treason', 103, 7264502, 2019-3-1, 2019-6-1),
	('Muse of Nightmares', 101, 7264504, 2018-12-20, GETDATE()),
	('Muse of Nightmares', 102, 7264503, 2018-12-15, GETDATE()), 
	('Nightblood', 101, 7264504, 2019-3-8, 2019-6-8),
	('Nightblood', 102, 7264503, 2018-12-15, GETDATE()), 
	('The Big Nine', 101, 7264505, 2019-1-3, 2019-4-3),
	('The Big Nine', 102, 7264507, 2019-2-8, GETDATE()), 
	('The Hobbit', 101, 7264511, 2018-12-1, GETDATE()),
	('The Hobbit', 102, 7264507, 2019-2-8, 2019-5-8), 
	('The Hobbit', 103, 7264510, GETDATE(), 2019-6-6),
	('The Lord of the Rings', 101, 7264511, 2018-12-1, GETDATE()),
	('The Lord of the Rings', 102, 7264507, 2019-2-8, 2019-5-8),
	('The Lord of the Rings', 103, 7264510, GETDATE(), 2019-6-6), 
	('White Fang', 100, 7264511, GETDATE(), 2019-6-6),
	('White Fang', 102, 7264505, 2019-12-1, GETDATE()),
	('White Fang', 103, 7264510, 2019-12-6, GETDATE()), 
	('The Call of the Wild', 100, 7264511, GETDATE(), 2019-6-6),
	('The Call of the Wild', 103, 7264510, 2019-12-6, GETDATE()),
	('Harry Potter and the Socerers Stone', 100, 7264508, 2019-1-2, 2019-4-2),
	('Harry Potter and the Socerers Stone', 103, 7264507, 2019-2-8, 2019-5-8),
	('Harry Potter and the Chamber of Secrets', 100, 7264508, 2019-1-2, 2019-4-2),
	('Harry Potter and the Chamber of Secrets', 103, 7264507, 2019-2-8, 2019-5-8),
	('Harry Potter and the Prisoner of Azkaban', 100, 7264508, 2019-1-2, 2019-4-2),
	('Harry Potter and the Prisoner of Azkaban', 100, 7264504, 2019-3-8, 2019-6-8),
	('Harry Potter and the Prisoner of Azkaban', 103, 7264509, 2018-12-6, GETDATE()),
	('Harry Potter and the Prisoner of Azkaban', 103, 7264507, 2019-2-8, 2019-5-8),
	('Harry Potter and the Goblet of Fire', 100, 7264508, 2019-1-2, 2019-4-2),
	('Harry Potter and the Goblet of Fire', 103, 7264509, 2018-12-6, GETDATE()),
	('Harry Potter and the Order of the Pheonix', 100, 7264508, 2019-1-2, 2019-4-2),
	('Harry Potter and the Order of the Pheonix', 103, 7264509, 2018-12-6, GETDATE()),
	('Harry Potter and the Order of the Pheonix', 103, 7264507, 2019-2-8, 2019-5-8),
	('Harry Potter and the Half Blood Prince', 100, 7264508, 2019-1-2, 2019-4-2),
	('Harry Potter and the Half Blood Prince', 103, 7264509, GETDATE(), 2019-6-6),
	('Harry Potter and the Half Blood Prince', 103, 7264507, 2019-2-8, 2019-5-8),
	('Harry Potter and the Deathly Hallows', 100, 7264508, 2019-1-2, 2019-4-2),
	('Harry Potter and the Deathly Hallows', 103, 7264509, GETDATE(), 2019-6-6)
;


select * from LIBRARY_BRANCH;
select * from PUBLISHER;
select * from BOOKS;
select * from BOOK_AUTHORS;
select * from BOOK_COPIES;
select * from BORROWER;
select * from BOOK_LOANS;