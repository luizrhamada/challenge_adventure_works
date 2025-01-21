with
    fonte_purchaseorderheader as (
        select * 
        from {{ source('erp','purchaseorderheader') }}
    )

, renomeado as (
    select
        cast(PURCHASEORDERID as int) as pk_purchase_order_id
        , cast(VENDORID as int) as fk_vendor_id
        , cast(SHIPMETHODID as int) as fk_ship_method_id
        , cast(REVISIONNUMBER as int) as revision_number
        , cast(STATUS as int) as status_number
        , cast(EMPLOYEEID as int) as fk_employee_id        
        , cast(ORDERDATE as varchar) as order_date
        , cast(SHIPDATE as varchar) as ship_date
        , cast(SUBTOTAL as numeric(18,2)) as subtotal_value
        , cast(TAXAMT as numeric(18,2)) as taxa_mt_value
        , cast(FREIGHT as numeric(18,2)) as freight_value
    from fonte_purchaseorderheader
)

select *
from renomeado
