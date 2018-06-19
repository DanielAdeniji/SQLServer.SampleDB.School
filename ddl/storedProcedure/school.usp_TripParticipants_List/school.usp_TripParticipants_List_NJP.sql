use [DBLab]
go

if object_id('school.usp_TripParticipants_List_NJP') is null
begin

    exec('create procedure school.usp_TripParticipants_List_NJP as ')

end
go

alter procedure [school].[usp_TripParticipants_List_NJP] 
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

              [trip] = tblT.[name]
            , [tripDate] = [tblT].tripDate
            , tblP.firstname
            , tblP.lastname

    from   [school].[tripParticipant] tblTP

    inner join [school].[trip] tblT

        on tblTP.tripID 
            = tblT.id

    inner join cteParticipant tblP
        /*
            on tblTP.participantID 
                = tblP.id
        */
        on tblTP.tripID
             = tblT.id

end

go
