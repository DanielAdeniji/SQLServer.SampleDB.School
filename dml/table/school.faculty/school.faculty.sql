use [DBLab]
go

set nocount on
go

set XACT_ABORT on
go

truncate table [school].[faculty]
go

insert into [school].[faculty]
( 
	  [identifier] 
	, [firstname]  
	, [lastname]  
)
select '000-00-1562', 'John', 'Smith'
union all
select '000-00-1564', 'Christopher', 'Jefferies'
union all
select '000-00-1566', 'Tanya', 'Roberts'
union all
select '000-00-1568', 'Paul', 'Washer'