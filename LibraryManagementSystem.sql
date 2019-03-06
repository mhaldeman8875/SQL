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

create table BOOKS (
	BookID int primary key not null identity (200, 1),
	Title varchar(50) not null unique,
	PublisherName varchar(50) not null constraint fk_PublisherName foreign key references PUBLISHER(PublisherName) on update cascade on delete cascade
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

