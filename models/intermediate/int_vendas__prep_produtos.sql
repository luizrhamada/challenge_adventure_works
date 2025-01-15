with 
    product as (
        select *
        from {{ ref('stg_erp__product') }}
    )

    , productsubcategory as (
        select *
        from {{ ref('stg_erp__productsubcategory') }}
    )

    , transactionhistory as (
        select *
        from {{ ref('stg_erp__transactionhistory') }}
    )

    , increase_product as (
        select
            product.PK_PRODUCT_ID
            , product.SAFE_STOCK_LEVEL
            , product.REORDER_POINT
            , product.NAME
            , product.PRODUCT_NUMBER
            , product.COLOR
            , product.PRODUCT_LINE
        from product
        left join productsubcategory on product.fk_product_sub_cat_id = productsubcategory.pk_product_sub_cat_id
    )

select *
from increase_product