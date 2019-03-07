use LibraryManagementSystem

go
create proc dbo.StephenKing
as

select d.Title, e.NumberOfCopies
from BOOK_AUTHORS c
	Inner Join BOOKS d on d.BookID = c.BookID
	Inner Join BOOK_COPIES e on e.BookID = d.Title
where e.BranchID = 100
and c.AuthorName = 'Steven King'

go

