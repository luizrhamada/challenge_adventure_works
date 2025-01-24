with
    fonte_salesheaderreason as (
        select * 
        from {{ source('erp','salesorderheadersalesreason') }}
    )

    , renomeado as (
        select
            SALESORDERID::string || '-' || SALESREASONID::string as pk_join_sales_reason_id
            , cast(SALESORDERID as int) as fk_sales_order_id
            , cast(SALESREASONID as int) as fk_sales_reason_id
        from fonte_salesheaderreason
    )

select *
from renomeado