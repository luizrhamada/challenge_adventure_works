with
    tabela1 as (
        select * 
        from {{ ref('stg_erp__employeedepartmenthistory')}}
    )

    , tabela2 as (
        select * 
        from {{ ref('stg_erp__department')}}
    )

    , tabela3 as (
        select * 
        from {{ ref('stg_erp__person')}}
    )

    , departament_name as (
        select
            tabela1.PK_START_DATE_ID
            , tabela1.FK_BUSINESS_ENTITY_ID
            , tabela3.EMPLOYEE_NAME        
            , tabela2.NAME_DEPARTMENT
            , tabela2.GROUP_NAME_DEPARTMENT
            , tabela1.END_DATE
        
        from tabela1
        left join tabela2 on tabela1.fk_department_id = tabela2.pk_department_id
        left join tabela3 on tabela1.fk_business_entity_id = tabela3.pk_business_entity_id

    )

select * 
from departament_name