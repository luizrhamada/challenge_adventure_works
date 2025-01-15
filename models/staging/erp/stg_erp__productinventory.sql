with 
    fonte_productinventory as(
        select *
        from {{ source('erp','productinventory') }}
    )

    , renomeado as (
        select
            cast(PRODUCTID as int) as fk_product_id
            , cast(LOCATIONID as int) as fk_location_id
            , cast(QUANTITY as int) as quantity
            , cast(BIN as int) as bin
            , cast(SHELF as string) as shelf
            , cast(ROWGUID as string) as rowguid
            , cast(MODIFIEDDATE as string) as modified_date 
        from fonte_productinventory
    )

select * 
from renomeado