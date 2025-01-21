with
    vendor as (
        select *
        from {{ ref('stg_erp__vendor') }}
    )

    , purchaseorderheader as (
        select *
        from {{ ref('stg_erp__purchaseorderheader') }}
    )


    , increase_purchasing as (
        select
        purchaseorderheader.PK_PURCHASE_ORDER_ID
        , vendor.ACCOUNT_NUMBER
        , vendor.NAME_ENTERPRISE        
        , purchaseorderheader.TAXA_MT_VALUE
        , purchaseorderheader.FREIGHT_VALUE
        , purchaseorderheader.SUBTOTAL_VALUE
        , purchaseorderheader.REVISION_NUMBER
        , purchaseorderheader.STATUS_NUMBER
        , purchaseorderheader.ORDER_DATE
        , purchaseorderheader.SHIP_DATE        

        from purchaseorderheader
        left join vendor on vendor.PK_BUSINESS_ENTITY_ID = purchaseorderheader.FK_VENDOR_ID
    )

select *
from increase_purchasing