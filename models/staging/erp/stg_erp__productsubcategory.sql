with
    fonte_productsubcategory as (
        select *
        from {{ source('erp','productsubcategory') }}
    )

    , renomeado as (
        select
            cast(PRODUCTSUBCATEGORYID as int) as pk_product_sub_cat_id
            , cast(PRODUCTCATEGORYID as int) as fk_product_cat_id
            , cast(NAME as string) as name_sub_cat_bike

        from fonte_productsubcategory
    )

select *
from renomeado