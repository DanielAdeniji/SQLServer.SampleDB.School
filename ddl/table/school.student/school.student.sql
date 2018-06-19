use [DBLab]
go

if schema_id('school') is null
begin

	exec('create schema [school] authorization [dbo]')

end
go

/*

	drop table [school].[student] 

*/
if object_id('[school].[student]') is null
begin

	create table [school].[student] 
	(
		  [id] bigint not null
				identity(1,1)

		, [identifier] nvarchar(30) not null
	
		, [firstname]  nvarchar(60) not null
	
		, [lastname]  nvarchar(60) not null

		, constraint [PK_School_Student]
			primary key
			(
				[id]
			)

		, constraint [Unique_School_Student_Identifier]
			unique
			(
				[identifier]
			)

	)
end
go



