use [DBLab]
go

if object_id('school.usp_TripParticipants_List_NJP_Legacy') is null
begin

    exec('create procedure school.usp_TripParticipants_List_NJP_Legacy as ')

end
go

alter procedure [school].[usp_TripParticipants_List_NJP_Legacy] 
as

begin

    ; with cteParticipant
    as
    (
        select *
    
        from   [school].[student]

        union 

        select *
    
        from   [school].[faculty]


    )
    select 

              [trip]
				 = tblT.[name]
            , [tripDate]
				 = [tblT].tripDate

            , [participant]
				=
				  tblP.firstname 
				+ ' '
				+ tblP.lastname

    from 
          [school].[tripParticipant] tblTP
        , [school].[trip] tblT
        , cteParticipant tblP

    where tblTP.tripID = tblT.id

    -- and   tblTP.participantID = tblP.id


end

go