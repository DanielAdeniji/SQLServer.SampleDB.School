use [DBLab]
go

if schema_id('school') is null
begin

	exec('create schema [school] authorization [dbo]')

end
go

/*

	drop table [school].[faculty] 

*/
if object_id('[school].[faculty]') is null
begin

	create table [school].[faculty] 
	(
		  [id] bigint not null
				identity(1,1)

		, [identifier] nvarchar(30) not null

		, [firstname]  nvarchar(60) not null

		, [lastname]  nvarchar(60) not null

		, constraint [PK_School_Faculty]
			primary key
			(
				[id]
			)

		, constraint [Unique_School_Faculty_Identifier]
			unique
			(
				[identifier]
			)

	)
end
go



