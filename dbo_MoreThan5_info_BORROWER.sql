use LibraryManagementSystem

go
create proc dbo.MoreThan5_info_BORROWER
as

go
	alter table BOOK_LOANS
		add Name varchar(50) null,
		Address varchar(50) null;
go
	update BOOK_LOANS
	set Name = a.Name from BOOK_LOANS b INNER JOIN BORROWER a on a.CardNo = b.CardNo;
go 
	update BOOK_LOANS
	set Address = a.Address from BOOK_LOANS b INNER JOIN BORROWER a on a.CardNo = b.CardNo;
go
	select Name, Address, count(BookID) 'Total Loans'
	from BOOK_LOANS 
	group by Name, Address
	having count(BookID) > 5;
go