with
    dim_sales_reason as(
        select * 
        from {{ ref('int_vendas__prep_sales_reason') }}
    )

select *
from dim_sales_reason