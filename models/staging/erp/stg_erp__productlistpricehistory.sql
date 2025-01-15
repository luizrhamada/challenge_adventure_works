with
    fonte_productlphistory as (
        select * 
        from {{ source('erp','productlistpricehistory') }}
    )
    
    , renomeado as (
        select
            cast(productid as int) as fk_product_id
            , cast(startdate as string) as pk_start_date
            , cast(enddate as string) as end_date
            , cast(listprice as numeric(18, 2)) as list_price
        from fonte_productlphistory
    )

select *
from renomeado
