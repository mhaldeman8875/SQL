use LibraryManagementSystem_TEST

go
create proc dbo.TheLostTribe_Sharpstown_Copies
as
select 
	t1.BranchName, t5.BookID, t5.NumberOfCopies
	from BOOK_COPIES t5
	inner join LIBRARY_BRANCH t1 on t1.BranchID = t5.BranchID
	where t5.BookID = 'The Lost Tribe' and t1.BranchName = 'Sharpstown'
;
go