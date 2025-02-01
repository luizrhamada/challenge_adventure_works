with
    fonte_personphone as (
        select *
        from {{ source('erp','personphone') }}
    )

    , renomeado as (
        select
            cast(PHONENUMBER as string) as pk_phone_number  
            , cast(BUSINESSENTITYID  as int) as fk_business_entity_id
            , cast(PHONENUMBERTYPEID as int) as fk_phone_number_type_id
                  
        from fonte_personphone
    ) 

select * 
from renomeado