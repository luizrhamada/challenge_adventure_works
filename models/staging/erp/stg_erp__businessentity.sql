with
    fonte_businessentity as (
        select *
        from {{ source('erp','businessentity') }}
    )

    , renomeado as (
        select
            cast(BUSINESSENTITYID as int) as pk_business_entity_id
        from fonte_businessentity
    )

select * 
from renomeado