USE [LibraryManagementSystem]
GO
/****** Object:  StoredProcedure [dbo].[MoreThan5_info_BORROWER]    Script Date: 3/6/2019 9:17:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MoreThan5_info_BORROWER]
as
	select a.Name, a.Address, COUNT(b.BookID) as 'Active Loans'
	from (BORROWER a
	inner join BOOK_LOANS b on b.CardNo = a.CardNo)
	Group by a.Name, a.Address
	Having COUNT(b.BookID) > 5
GO