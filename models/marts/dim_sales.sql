with
    dim_sales as(
        select * 
        from {{ ref('int_vendas__prep_sales') }}
    )

select *
from dim_sales