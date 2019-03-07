use LibraryManagementSystem

go
create proc dbo.MoreThan5_info_BORROWER
as
	select a.Name, a.Address, COUNT(b.BookID) as 'Active Loans'
	from (BORROWER a
	inner join BOOK_LOANS b on b.CardNo = a.CardNo)
	Group by a.Name, a.Address
go