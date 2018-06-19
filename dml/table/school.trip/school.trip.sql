use [DBLab]
go

set nocount on
go

set XACT_ABORT on
go

truncate table [school].[trip]
go

insert into [school].[trip]
( 
	[name] 
  , [tripDate]  
)
select 'Memorial Day', '2018-05-01'
union all
select 'Veterans Day', '2018-06-15'
