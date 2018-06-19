use [DBLab]
go

declare @tripID bigint

set @tripID = 1

; with cteSchoolBody
(
        id
    , identifier
    , firstname
    , lastname
	, [poolID]
    , [pool]
)
as
(

    select 
                tblS.id
            , tblS.identifier
            , tblS.firstname
            , tblS.lastname
			, [poolID] = 1
            , [pool] = 'Student'

    from   [school].[student] tblS

    union all

    select 
              tblF.id
            , tblF.identifier
            , tblF.firstname
            , tblF.lastname
			, [poolID] = 2
            , [pool] = 'Faculty'

    from   [school].[faculty] tblF

)
select 
		  [src] = '[school].[tripParticipant]'
		, tblTP.tripID
		, tblTP.participantID
		, tblTP.participantTypeID
		, cteSB.firstname
		, cteSB.lastname

from   [school].[tripParticipant] tblTP

inner join cteSchoolBody cteSB

	    on  tblTP.participantID = cteSB.id
		and tblTP.[participantTypeID] = cteSB.[poolID]

where tblTP.tripID = @tripID
