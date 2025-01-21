with
    fonte_salesorderheader as (
        select * 
        from {{ source('erp','salesorderheader') }}
    )

    , renomeado as (
        select
            cast(SALESORDERID as int) as pk_sales_order_id
            , cast(SALESPERSONID as int) as fk_business_order_id            
            , cast(CUSTOMERID as int) as fk_costumer_id
            , cast(TERRITORYID as int) as fk_territory_id
            , cast(CREDITCARDID as int) as fk_credit_card_id
            , cast(PURCHASEORDERNUMBER as string) as purchase_number
            , cast(ACCOUNTNUMBER as string) as account_number
            , cast(ORDERDATE as string) as order_date
            , cast(STATUS as int) as status
            , cast(SHIPDATE as string) as ship_date
            , cast(DUEDATE as string) as due_date
            , cast(SUBTOTAL as numeric(18,2)) as subtotal_value
            , cast(TAXAMT as numeric(18,2)) as taxa_mt_value
            , cast(FREIGHT as numeric(18,2)) as freight_value
            , cast(TOTALDUE as numeric(18,2)) as total_due_value
        from fonte_salesorderheader
    )

select *
from renomeado