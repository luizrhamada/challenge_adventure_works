with
    fonte_salesreason as (
        select *
        from {{ source('erp','salesreason') }}
    )

    , renomeado as (
        select
            cast(SALESREASONID as int) as pk_sales_reason_id
            , cast(NAME as string) as name_reason
            , cast(REASONTYPE as string) as reason_type
        from fonte_salesreason
    )

select *
from renomeado