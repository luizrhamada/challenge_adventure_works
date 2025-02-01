with
    person as (
        select *
        from {{ ref('stg_erp__person') }}
    )

    , emailaddress as (
        select *
        from {{ ref('stg_erp__emailaddress') }}
    )

    , personphone as (
        select *
        from {{ ref('stg_erp__personphone') }}
    )


    , increase_person as (
        select
            person.PK_BUSINESS_ENTITY_ID
            , person.EMPLOYEE_NAME
            , emailaddress.EMAIL_EMPLOYEE

        from person
        left join emailaddress on person.PK_BUSINESS_ENTITY_ID = emailaddress.FK_BUSINESS_ENTITY_ID

    )


select *
from increase_person
