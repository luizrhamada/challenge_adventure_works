with
    fonte_personphone as (
        select *
        from {{ source('erp','personphone') }}
    )

    , renomeado as (
        select
            cast(BUSINESSENTITYID  as int) as pk_business_entity_id
            , cast(PHONENUMBERTYPEID as int) as fk_phone_number_type_id
            , cast(PHONENUMBER as string) as phone_number         
        from fonte_personphone
    ) 

select * 
from renomeado