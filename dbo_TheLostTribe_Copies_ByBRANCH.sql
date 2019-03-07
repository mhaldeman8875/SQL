USE [LibraryManagementSystem]
GO
/****** Object:  StoredProcedure [dbo].[TotalLoans_byBRANCH]    Script Date: 3/6/2019 5:26:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[TotalLoans_byBRANCH]
as

	alter table BOOK_LOANS
	add BranchName varchar(50) null

	update BOOK_LOANS
	set BranchName = t1.BranchName
	from BOOK_LOANS t7
	INNER JOIN LIBRARY_BRANCH t1 on t1.BranchID = t7.BranchID;


	select BranchName 'Branch name', count(BookID) 'Total Loans'
	from BOOK_LOANS 
	group by BranchName;
	
go
