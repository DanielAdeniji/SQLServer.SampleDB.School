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
	      [tripID]         bigint  not null

		, [participantID] bigint  not null
		
		, [partipantType] tinyint not null
	
	    , [dateAdded]     datetime not null
		    constraint [school.tripParticipant.dateAdded]
			     default getdate()

		, constraint [PK_School_TripParticipant]
			primary key
			(
			      [tripID]
				, [participantID]
				, [partipantType]

			)

	)
end
go



