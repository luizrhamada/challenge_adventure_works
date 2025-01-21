with
    fonte_person as (
        select *
        from {{ source('erp','person') }}
    )

    , renomeado as(
        select
            cast(BUSINESSENTITYID as int) as pk_business_entity_id
            , FIRSTNAME || ' ' || LASTNAME as employee_name
            , cast(EMAILPROMOTION as int) as email_promotion
        from fonte_person
    )

select *
from renomeado