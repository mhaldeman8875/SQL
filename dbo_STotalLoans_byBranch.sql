USE [LibraryManagementSystem]
go

CREATE proc [dbo].[TotalLoans_byBRANCH]
as
begin
	alter table BOOK_LOANS
	add BranchName varchar(50) null

	update BOOK_LOANS
	set BranchName = t1.BranchName
	from BOOK_LOANS t7
	INNER JOIN LIBRARY_BRANCH t1 on t1.BranchID = t7.BranchID;
end
	select BranchName 'Branch name', count(BookID) 'Total Loans'
	from BOOK_LOANS 
	group by BranchName;

go
