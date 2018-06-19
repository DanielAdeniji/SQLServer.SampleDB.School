use [DBLab]
go

set nocount on
go

set XACT_ABORT on
go

truncate table [school].[tripParticipant]
go

declare @dateAdded datetime
declare @iNumberofRecordsAffected bigint

declare @strLog varchar(255)

set @dateAdded = getdate()

insert into [school].[tripParticipant]
(
     [tripID]
   , [participantID]
   , [partipantType]
   , [dateAdded]
)

select 
		  [tripID]
			= tblT.[id]

		, [studentID]
			= tblS.[id]

		, [participantType]	
			= 1

		, [dateAdded]
			= @dateAdded

from   [school].[trip] tblT

cross join [school].[student] tblS


union all

select 
		  [tripID]
			= tblT.[id]

		, [studentID]
			= tblF.[id]

		, [participantType]	
			= 2

		, [dateAdded]
			= @dateAdded

from   [school].[trip] tblT

cross join [school].[faculty] tblF

set @iNumberofRecordsAffected = @@ROWCOUNT

set @strLog = cast(@iNumberofRecordsAffected as varchar(30))
				+ ' records affected'

print @strLog


go

