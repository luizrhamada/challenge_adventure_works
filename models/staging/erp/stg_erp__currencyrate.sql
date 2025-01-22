with
    fonte_currencyrate as (
        select * 
        from {{ source('erp','currencyrate') }}
    )

    , renomeado as (
        select
            cast(CURRENCYRATEID as int) as pk_currency_rate_id            
            , cast(FROMCURRENCYCODE as string) as from_currency_code
            , cast(TOCURRENCYCODE as string) as to_currency_code
            , cast(AVERAGERATE as numeric(18,2)) as average_rate
            , cast(ENDOFDAYRATE as numeric(18,2)) as end_of_day_rate
            , cast(CURRENCYRATEDATE as string) as currency_rate_date
        from fonte_currencyrate
    )

select *
from renomeado