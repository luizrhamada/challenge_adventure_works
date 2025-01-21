with
    fonte_emailaddress as (
        select *
        from {{ source('erp','emailaddress') }}
    )

    , renomeado as (
        select
            cast(EMAILADDRESSID as int) as pk_email_address_id
            , cast(BUSINESSENTITYID as int) as fk_business_entity_id            
            , cast(EMAILADDRESS as string) as email_employee
        from fonte_emailaddress
    )

select * 
from renomeado