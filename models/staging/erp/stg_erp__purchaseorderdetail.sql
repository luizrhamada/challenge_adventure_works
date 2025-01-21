with
    fonte_purchaseorderdetail as (
        select *
        from {{ source('erp','purchaseorderdetail') }}
    )

    , renomeado as (
        select
            cast("purchaseorderdetailid" as int) as pk_purchase_order_detail_id
            , cast("purchaseorderid" as int) as fk_purchase_order_id             
            , cast("orderqty" as int) as order_qty
            , cast("productid" as int) as fk_product_id
            , cast("unitprice" as numeric(18,2)) as unity_price
            , cast("receivedqty" as int) as received_qty
            , cast("rejectedqty" as int) as rejected_qty
        from fonte_purchaseorderdetail
    )

select * 
from renomeado