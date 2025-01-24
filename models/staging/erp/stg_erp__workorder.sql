with
    fonte_workorder as (
        select *
        from {{ source('erp','workorder') }}
    )

    , renomeado as (
        select
            cast(WORKORDERID as int) as pk_work_order_id
            , cast(PRODUCTID as int) as fk_product_id
            , cast(SCRAPREASONID as int) as fk_scrap_reason_id
            , cast(ORDERQTY as int) as order_qty
            , cast(SCRAPPEDQTY as int) as scrapped_qty
            , cast(STARTDATE as string) as start_date
            , cast(ENDDATE as string) as end_date
            , cast(DUEDATE as string) as due_date

        from fonte_workorder
    )

select * 
from renomeado