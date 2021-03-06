USE [LibraryManagementSystem]
GO

CREATE proc [dbo].[TotalLoans_byBRANCH]
as
	select a.BranchName 'Branch name', count(b.BookID) 'Total Loans'
	from (BOOK_LOANS b
	inner join LIBRARY_BRANCH a on a.BranchID = b.BranchID)
	group by a.BranchName;
GO