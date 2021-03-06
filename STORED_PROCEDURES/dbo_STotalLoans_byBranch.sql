USE [LibraryManagementSystem]
GO
/****** Object:  StoredProcedure [dbo].[TotalLoans_byBRANCH]    Script Date: 3/6/2019 9:14:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
GO