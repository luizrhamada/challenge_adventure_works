with
    fonte_customer as (
        select *
        from {{ source('erp','customer') }}
    )

    , renomeado as (
        select
            cast(CUSTOMERID as int) as pk_customer_id
            , cast(PERSONID as int) as fk_person_id
            , cast(STOREID as int) as fk_store_id
            , cast(TERRITORYID as int) as fk_territory_id
        from fonte_customer
    )

select *
from renomeado