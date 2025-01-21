with 
    fonte_productvendor as(
        select *
        from {{ source('erp','productvendor') }}
    )

    , renomeado as (
        select
            cast(PRODUCTID as int) as pk_product_id
            , cast(BUSINESSENTITYID as string) as fk_business_entity_id            
            , cast(MINORDERQTY as int) as min_order
            , cast(MAXORDERQTY as int) as max_order
            , cast(ONORDERQTY as int) as on_order
            , cast(STANDARDPRICE as numeric(18,2)) as standard_price
            , cast(LASTRECEIPTCOST as numeric(18,2)) as last_receipt_cost
            , cast(AVERAGELEADTIME as string) as average_lead_time
            , cast(LASTRECEIPTDATE as string) as last_receipt_date 
            , cast(UNITMEASURECODE as string) as fk_unity_measure_code
            , cast(MODIFIEDDATE as string) as modified_date
        from fonte_productvendor
    )

select *
from renomeado