with
    dim_human_resources as(
        select * 
        from {{ ref('int_vendas__prep_human_resources') }}
    )

select *
from dim_human_resources