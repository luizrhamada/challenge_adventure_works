with
    dim_purchasing as(
        select * 
        from {{ ref('int_vendas__prep_purchasing') }}
    )

select *
from dim_purchasing