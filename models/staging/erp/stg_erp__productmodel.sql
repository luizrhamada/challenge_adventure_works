with
    fonte_productmodel as (
        select *
        from {{ source('erp','productmodel') }}
    )

    , renomeado as (
        select
            cast(PRODUCTMODELID as int) as pk_product_model_id
            , cast(NAME as string) as name
        from fonte_productmodel
    )

select *
from renomeado