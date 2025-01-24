with
    personcreditcard as (
        select *
        from {{ ref('stg_erp__personcreditcard') }}
    )

    , person as (
        select *
        from {{ ref('stg_erp__person') }}
    )

    , creditcard as (
        select *
        from {{ ref('stg_erp__creditcard') }}
    )

    , increase_person_credit_card as (
        select
            personcreditcard.PK_BUSINESS_ENTITY_ID
            , person.EMPLOYEE_NAME
            , creditcard.CREDIT_CARD_TYPE
            , creditcard.CREDIT_CARD_NUMBER
            , creditcard.EXP_MONTH
            , creditcard.EXP_YEAR

        from personcreditcard
        left join creditcard on personcreditcard.FK_CREDIT_CARD = creditcard.PK_CREDIT_CARD_ID
        left join person on personcreditcard.PK_BUSINESS_ENTITY_ID = person.PK_BUSINESS_ENTITY_ID

    )

select *
from increase_person_credit_card