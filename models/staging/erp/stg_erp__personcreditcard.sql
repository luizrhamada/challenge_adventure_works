with
    fonte_personcreditcard as (
        select *
        from {{ source('erp','personcreditcard') }}
    )

    , renomeado as (
        select
            cast(BUSINESSENTITYID as int) as pk_business_entity_id
            , cast(CREDITCARDID as int) as fk_credit_card
        from fonte_personcreditcard
    )

select * 
from renomeado