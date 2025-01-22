with
    fonte_salesorderdetail as (
        select * 
        from {{ source('erp','salesorderdetail') }}
    )
    
    , renomeado as (
        select
            cast(SALESORDERDETAILID as int) as pk_sales_order_detail_id
            , cast(SALESORDERID as int) as fk_sales_order_id
            , cast(PRODUCTID as int) as fk_product_id
            , cast(CARRIERTRACKINGNUMBER as string) as tracking_numer
            , cast(ORDERQTY as int) as order_qty            
            , cast(UNITPRICE as numeric(18,2)) as unity_price
            , cast(UNITPRICEDISCOUNT as numeric(18,2)) as discount_unity_price
        from fonte_salesorderdetail
    )

select * 
from renomeado