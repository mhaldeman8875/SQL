USE [LibraryManagementSystem]
GO
/****** Object:  StoredProcedure [dbo].[TheLostTribe_Copies_ByBRANCH]    Script Date: 3/6/2019 7:41:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[TheLostTribe_Copies_ByBRANCH]
as
select
	t1.BranchName, t5.BookID, t5.NumberOfCopies
	from BOOK_COPIES t5
	inner join LIBRARY_BRANCH t1 on t1.BranchID = t5.BranchID
	where t5.BookID = 'The Lost Tribe'
;
