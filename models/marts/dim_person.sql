with
    dim_person as(
        select * 
        from {{ ref('int_vendas__prep_person') }}
    )

select *
from dim_person