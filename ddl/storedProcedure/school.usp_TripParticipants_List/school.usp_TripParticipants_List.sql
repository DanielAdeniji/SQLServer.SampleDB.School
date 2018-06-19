use [DBLab]
go

if object_id('school.usp_TripParticipants_List') is null
begin

    exec('create procedure [school].[usp_TripParticipants_List] as ')

end
go

alter procedure [school].[usp_TripParticipants_List]
(
    @tripID bigint
)
as

begin

    set nocount on

    set XACT_ABORT on


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
              [tripID] = tblT.[id]

            , [tripName] = tblT.[name]

            , cteSB.[pool]

            , cteSB.lastname

            , cteSB.firstname

            , cteSB.identifier

    from   [school].[trip] tblT

    --inner join [school].[tripParticipant] tblTP
    inner join [tripParticipant] tblTP

        on tblT.id = tblTP.tripID

    inner join cteSchoolBody cteSB
        on  tblTP.participantID = cteSB.id
        /*
            intentionally left of participantTypeID
            and tblTP.[participantTypeID] = cteSB.[poolID]
        */ 
    where (

            ( 
                tblT.[id] 
                    = isNull(@tripID, tblT.[id])
            )

          )

    order by
              [tripName]

            , [pool]

            , cteSB.lastname

            , cteSB.firstname

    
end
go


