use LibraryManagementSystem

go
create proc dbo.Sharpstown_Due_Today_BORROWER
as

declare @DateDue date
set @DateDue = GETDATE()

select t6.BookID, t5.Address, t5.Name as 'Name'
from BOOK_LOANS t6
inner join BORROWER t5 on t5.CardNo = t6.CardNo
where t6.DateDue = @DateDue
and t6.BranchID = 101
;
go