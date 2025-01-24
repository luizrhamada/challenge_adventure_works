with
    fonte_location as (
        select *
        from {{ source('erp','location') }}
    )

    , renomeado as (
        select
            cast("locationid" as int) as pk_location_id
            , cast("name" as string) as name_location
            , cast("costrate" as numeric(18,2)) as costrate
            , cast("availability" as int) as availability
        from fonte_location
    )

select *
from renomeado