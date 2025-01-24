with
    fonte_creditcard as (
        select * 
        from {{ source('erp','creditcard') }}
    )

    , renomeado as (
        select
            cast(CREDITCARDID as int) as pk_credit_card_id
            , cast(CARDTYPE as string) as credit_card_type
            , cast(CARDNUMBER as int) as credit_card_number
            , cast(EXPMONTH as int) as exp_month
            , cast(EXPYEAR as int) as exp_year
        from fonte_creditcard
    )

select * 
from renomeado    