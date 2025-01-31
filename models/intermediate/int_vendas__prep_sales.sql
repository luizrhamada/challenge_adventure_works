with
    salesorderheader as (
        select *
        from {{ ref('stg_erp__salesorderheader') }}
    )

    , salesterritory as (
        select *
        from {{ ref('stg_erp__salesterritory') }}
    )

    , salesorderdetail as (
        select *
        from {{ ref('stg_erp__salesorderdetail') }}
    )

    , creditcard as (
        select * 
        from {{ ref('stg_erp__creditcard')}}
    )

    , increase_sales as (
        select
            salesorderdetail.PK_SALES_ORDER_DETAIL_ID
            , salesorderdetail.FK_SALES_ORDER_ID
            , salesorderdetail.FK_PRODUCT_ID
            , salesorderheader.FK_BUSINESS_ORDER_ID
            , salesorderheader.FK_COSTUMER_ID
            , salesorderheader.FK_CURRENCY_RATE_ID
            , salesorderheader.FK_TERRITORY_ID
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
            , salesterritory.NAME_TERRITORY
            , salesterritory.COUNTRY_REGION_CODE
            , salesterritory.CONTINENT_REGION
            , salesterritory.SALES_YTD_PER_REGION_VALUE
            , salesterritory.SALES_LAST_YEAR_PER_REGION_VALUE
            , salesorderdetail.TRACKING_NUMER
            , salesorderdetail.ORDER_QTY
            , salesorderdetail.UNITY_PRICE
            , salesorderdetail.DISCOUNT_UNITY_PRICE

        from salesorderheader
        left join salesterritory on salesorderheader.FK_TERRITORY_ID = salesterritory.PK_TERRITORY_ID
        left join salesorderdetail on salesorderheader.PK_SALES_ORDER_ID = salesorderdetail.FK_SALES_ORDER_ID
        
    )

select *
from increase_sales
