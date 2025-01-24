with
    dim_person_credit_card as(
        select * 
        from {{ ref('int_vendas__prep_person_credit_card') }}
    )

select *
from dim_person_credit_card