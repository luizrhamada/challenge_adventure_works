with
    fonte_transactionhistory as (
        select *
        from {{ source('erp','transactionhistory') }}
    )

    , renomeado as (
        select
            cast(TRANSACTIONID as int) as pk_transaction_id
            , cast(PRODUCTID as int) as fk_transaction_id
            , cast(REFERENCEORDERLINEID as int) as fk_reference_order_line_id
            , cast(REFERENCEORDERID as int) as fk_reference_order
            , cast(TRANSACTIONDATE as string) as transaction_date
            , cast(TRANSACTIONTYPE as int) as fk_transaction_type
            , cast(QUANTITY as int) as fk_quantitiy
            , cast(ACTUALCOST as numeric(18,2)) as fk_actual_cost
            , cast(MODIFIEDDATE as string) as fk_modified_date
        from fonte_transactionhistory
    )

select *
from renomeado