use [DBLab]
go

if schema_id('school') is null
begin

	exec('create schema [school] authorization [dbo]')

end
go

/*

	drop table [school].[tripParticipant] 

*/
if object_id('[school].[tripParticipant]') is null
begin

	create table [school].[tripParticipant] 
	(
	      [tripID]            bigint  not null

		, [participantID]     bigint  not null
		
		, [participantTypeID] tinyint not null
	
	    , [dateAdded]     datetime not null
		    constraint [school.tripParticipant.dateAdded]
			     default getdate()

		, constraint [PK_School_TripParticipant]
			primary key
			(
			      [tripID]
				, [participantID]
				, [participantTypeID]

			)

	)
end
go

declare @table sysname
declare @reference sysname

set @table	= '[school].[tripParticipant]'
set @reference = '[school].[trip]'

if not exists
(
	select *

	from   sys.foreign_keys tblSFK

	where   tblSFK.parent_object_id = object_id(@table)

	and     tblSFK.referenced_object_id = object_id(@reference)

)
begin

	alter table [school].[tripParticipant]
		add constraint [FK_TripParticipant_Trip]
			foreign key
			(
				[tripID]
			)
			references [school].[trip]
			(
				[id]
			)

end

go

