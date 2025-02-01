with
    salesorderheader as (
        select *
        from {{ ref('stg_erp__salesorderheader') }}
    )


    , salesorderdetail as (
        select *
        from {{ ref('stg_erp__salesorderdetail') }}
    )


    , increase_sales as (
        select
            salesorderdetail.PK_SALES_ORDER_DETAIL_ID
            , salesorderheader.PURCHASE_NUMBER
            , salesorderheader.ACCOUNT_NUMBER
            , salesorderheader.ORDER_DATE
            , salesorderheader.STATUS
            , salesorderheader.SHIP_DATE
            , salesorderheader.DUE_DATE
            , salesorderheader.SUBTOTAL_VALUE
            , salesorderheader.TAXA_MT_VALUE
            , salesorderheader.FREIGHT_VALUE
            , salesorderheader.TOTAL_DUE_VALUE
            , salesorderdetail.TRACKING_NUMER
            , salesorderdetail.ORDER_QTY
            , salesorderdetail.UNITY_PRICE
            , salesorderdetail.DISCOUNT_UNITY_PRICE

        from salesorderheader
        left join salesorderdetail on salesorderheader.PK_SALES_ORDER_ID = salesorderdetail.FK_SALES_ORDER_ID
        
    )

select *
from increase_sales
