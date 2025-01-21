with 
    product as (
        select *
        from {{ ref('stg_erp__product') }}
    )

    , productsubcategory as (
        select *
        from {{ ref('stg_erp__productsubcategory') }}
    )


    , increase_product as (
        select
            product.PK_PRODUCT_ID
            , product.NAME_PRODUCT
            , productsubcategory.NAME_SUB_CAT_BIKE
            , product.PRODUCT_NUMBER
            , product.SAFE_STOCK_LEVEL
            , product.REORDER_POINT            
            , product.COLOR
            , product.PRODUCT_LINE
        from product
        left join productsubcategory on product.fk_product_sub_cat_id = productsubcategory.pk_product_sub_cat_id
    )

select *
from increase_product