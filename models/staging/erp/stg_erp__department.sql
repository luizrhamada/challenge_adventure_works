with
    fonte_department as (
        select * 
        from {{ source('erp','department') }}
    )

    , renomeado as (
        select
            cast(DEPARTMENTID as int) as pk_department_id
            , cast(NAME as string) as name_department
            , cast(GROUPNAME as string) as group_name_department

        from fonte_department
    )

select * 
from renomeado