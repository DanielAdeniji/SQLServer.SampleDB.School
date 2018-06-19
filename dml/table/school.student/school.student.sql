use [DBLab]
go

set nocount on
go

set XACT_ABORT on
go

truncate table [school].[student]
go

insert into [school].[student]
( 
	  [identifier] 
	, [firstname]  
	, [lastname]  
)
select '000-00-5643', 'Tim', 'Winston'
union all
select '000-00-7667', 'Susan', 'Thompson'
union all
select '000-00-6512', 'Kimberly', 'Green'
