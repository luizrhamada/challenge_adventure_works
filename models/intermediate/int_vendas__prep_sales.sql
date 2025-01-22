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

    , address as (
        select * 
        from {{ ref('stg_erp__address')}}
    )
    

    , increase_sales as (
        select
            salesorderdetail.PK_SALES_ORDER_DETAIL_ID                     
            , address.ADDRESS_LINE1
            , address.CITY
            , address.POSTAL_CODE
            , address.SPATIAL_LOCATION
            , salesterritory.NAME_TERRITORY
            , salesterritory.COUNTRY_REGION_CODE
            , salesterritory.CONTINENT_REGION
            , salesterritory.SALES_YTD_PER_REGION_VALUE
            , salesterritory.SALES_LAST_YEAR_PER_REGION_VALUE
            , salesorderheader.ORDER_DATE
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
        left join salesterritory on salesorderheader.FK_TERRITORY_ID = salesterritory.PK_TERRITORY_ID
        left join address on salesorderheader.fk_bill_to_address_id = address.pk_address_id
        
    )

select *
from increase_sales