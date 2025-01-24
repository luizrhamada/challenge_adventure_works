with
    dim_work_order as(
        select * 
        from {{ ref('int_vendas__prep_work_order') }}
    )

select *
from dim_work_order