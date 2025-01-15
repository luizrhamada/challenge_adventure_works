with
    fonte_productcategory as (
        select *
        from {{ source('erp','productcategory') }}
    )

    , renomeado as (
        select
            cast(PRODUCTCATEGORYID as int) as pk_product_cat_id
            , cast(NAME as string) as name

        from fonte_productcategory
    )

select *
from renomeado