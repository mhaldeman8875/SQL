use LibraryManagementSystem

go
create proc dbo.BORROWERS_inactive
as
select Name as 'Inactive Users'
from BORROWER
where CardNo not in (select CardNo FROM BOOK_LOANS)
;
go