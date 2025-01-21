with
    fonte_vendor as (
        select *
        from {{ source('erp','vendor') }}
    )

    , renomeado as (
        select
            cast(BUSINESSENTITYID as int) as pk_business_entity_id
            , cast(ACCOUNTNUMBER as string) as account_number
            , cast(NAME as varchar) as name_enterprise
            , cast(CREDITRATING as int) as credit_rating
        from fonte_vendor
    )

select *
from renomeado