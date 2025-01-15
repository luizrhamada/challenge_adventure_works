with 
    product as (
        select *
        from {{ ref('stg_erp__product') }}
    )

    , productvendor as (
        select *
        from {{ ref('stg_erp__productvendor') }}
    )

    , transactionhistory as (
        select *
        from {{ ref('stg_erp__transactionhistory') }}
    )

    , increase_product as (
        select
            product.PK_PRODUCT_ID
            , product.FK_PRODUCT_SUB_CAT_ID
            , product.FK_PRODUCT_MODEL_ID
            , product.SAFE_STOCK_LEVEL
            , product.REORDER_POINT
            , product.WEIGHT
            , product.NAME
            , product.PRODUCT_NUMBER
            , product.COLOR
            , product.PRODUCT_LINE
            , product.SELL_START_DATE
            , product.SELL_END_DATE
            , productvendor.FK_BUSINESS_ENTITY_ID
            , productvendor.STANDARD_PRICE
            , transactionhistory.PK_TRANSACTION_ID
            , transactionhistory.FK_REFERENCE_ORDER_LINE_ID
            , transactionhistory.FK_REFERENCE_ORDER
            , transactionhistory.TRANSACTION_DATE
            , transactionhistory.FK_TRANSACTION_TYPE
            , transactionhistory.FK_QUANTITIY
            , transactionhistory.FK_ACTUAL_COST
        from product
        left join transactionhistory on product.pk_product_id = transactionhistory.fk_product_id
        left join productvendor on product.pk_product_id = productvendor.fk_product_id
    )

select *
from increase_product