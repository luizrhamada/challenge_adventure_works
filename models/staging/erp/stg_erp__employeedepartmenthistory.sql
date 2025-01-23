with
    fonte_employeedepartmenthistory as (
        select * 
        from {{ source('erp','employeedepartmenthistory') }}
    )

    , renomeado as (
        select
            cast(STARTDATE as string) as pk_start_date_id
            , cast(BUSINESSENTITYID as int) as fk_business_entity_id
            , cast(DEPARTMENTID as int) as fk_department_id
            , cast(SHIFTID as int) as fk_shift_id            
            , cast(ENDDATE as string) as end_date


        from fonte_employeedepartmenthistory
    )

select * 
from renomeado