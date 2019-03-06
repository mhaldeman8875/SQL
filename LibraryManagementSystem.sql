use LibraryManagementSystem_Test

/*create tables*/
create table LIBRARY_BRANCH (
	BranchID int primary key not null identity (100,1),
	BranchName varchar(50) not null,
	Address varchar(100) not null
);

create table PUBLISHER (
	PublisherName varchar(100) primary key not null,
	Address varchar(100) not null,
	Phone varchar(30) not null
);

create table BOOKS (
	BookID int primary key not null identity (200, 1),
	Title varchar(50) not null unique,
	Publisher_Name varchar(100) not null constraint fk_PublisherName foreign key references PUBLISHER(PublisherName) on update cascade on delete cascade
);


create table BOOK_AUTHORS (
	BookID int not null constraint fk_BookID foreign key references BOOKS(BookID) on update cascade on delete cascade,
	AuthorName varchar(50) not null
);

create table BOOK_COPIES (
	BookID varchar(50) not null constraint fk_Title foreign key references BOOKS(Title) on update cascade on delete cascade,
	BranchID int not null constraint fk_BranchID foreign key references LIBRARY_BRANCH(BranchID),
	NumberOfCopies int not null
);

create table BORROWER (
	CardNo int primary key not null identity (7264502,1),
	Name varchar(50) not null,
	Address varchar(50) not null,
	Phone varchar(30) not null
);

create table BOOK_LOANS	(
	BookID varchar(50) not null constraint fk_BookTitle foreign key references BOOKS(Title) on update cascade on delete cascade,
	BranchID int not null constraint fk_BranchName foreign key references LIBRARY_BRANCH(BranchID) on update cascade on delete cascade,
	CardNo int not null constraint fk_CardNo foreign key references BORROWER(CardNo) on update cascade on delete cascade,
	DateOut date,
	DateDue date
);

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
	('Bloomsbury Publishing', '891 Wallingford Ave', '206-186-2836'),
	('Macmillian Publishers', '718 121st Lane', '253-137-1937'),
	('Simon & Schuster', '2837 N 156th Place', '775-863-3862'),
	('George Allen & Unwin', '1763 8th Street', '318-382-4842')
;

insert into BOOKS
	(Title, Publisher_Name)
	values
	('The Lost Tribe', 'Macmillian Publishers'),
	('IT', 'Simon & Schuster'),
	('The Green Mile', 'Simon & Schuster'),/*Steven King*/ 
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
select * from PUBLISHER;
select * from BOOKS;
