use [DBLab]
go

if schema_id('school') is null
begin

	exec('create schema [school] authorization [dbo]')

end
go

/*

	drop table [school].[trip] 

*/
if object_id('[school].[trip]') is null
begin

	create table [school].[trip] 
	(
		  [id] bigint not null
			identity(1,1)

		, [name] nvarchar(100) not null
		
		, [tripDate] datetime null
		
		, constraint [PK_School_Trip]
			primary key
			(
				[id]
			)

	)
end
go



