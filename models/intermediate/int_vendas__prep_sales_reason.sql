with
    salesheaderreason as (
        select *
        from {{ ref('stg_erp__salesheaderreason') }}
    )

    , salesreason as (
        select *
        from {{ ref('stg_erp__salesreason') }}
    )

    , salesorderheader as (
        select *
        from {{ ref('stg_erp__salesorderheader') }}
    )
    
    , increase_sales_reason as (
        select
            salesheaderreason.pk_join_sales_reason_id
            , salesreason.NAME_REASON
            , salesreason.REASON_TYPE

        from salesheaderreason
        left join salesreason on salesheaderreason.FK_SALES_REASON_ID = salesreason.PK_SALES_REASON_ID
        left join salesorderheader on salesheaderreason.FK_SALES_ORDER_ID = salesorderheader.PK_SALES_ORDER_ID
        
    )

select *
from increase_sales_reason