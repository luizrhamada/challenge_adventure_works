with
    fonte_product as (
        select *
        from {{ source('erp','product') }}
    )

    , renomeado as (
        select
            cast(PRODUCTID as int) as pk_product_id
            , cast(PRODUCTSUBCATEGORYID as int) as fk_product_sub_cat_id
            , cast(PRODUCTMODELID as int) as fk_product_model_id
            , cast(SAFETYSTOCKLEVEL as int) as safe_stock_level
            , cast(REORDERPOINT as int) as reorder_point
            , cast(WEIGHT as numeric(18,2)) as weight
            , cast(NAME as string) as name
            , cast(PRODUCTNUMBER as string) as product_number 
            , cast(COLOR as string) as color
            , cast(PRODUCTLINE as string) as product_line 
            , cast(SELLSTARTDATE as string) as sell_start_date
            , cast(SELLENDDATE as string) as sell_end_date
            , cast(ROWGUID as string) as rowguid
            , cast(MODIFIEDDATE as string) as modified_date
            , makeflag as is_make_flag
            , finishedgoodsflag as is_finished_goods_flag

        from fonte_product
    )

select *
from renomeado