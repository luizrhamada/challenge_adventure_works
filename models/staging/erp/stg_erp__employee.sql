with
    fonte_employee as (
        select * 
        from {{ source('erp','employee') }}
    )

    , renomeado as (
        select
            cast(BUSINESSENTITYID as int) as pk_business_entity_id
            , cast(NATIONALIDNUMBER as int) as fk_national_number_id
            , cast(LOGINID as string) as fk_login_id
            , cast(JOBTITLE as string) as job_title
            , cast(BIRTHDATE as string) as birthdate_employee
            , cast(GENDER as string) as gender_employee
            , cast(HIREDATE as string) as hire_date
            , cast(VACATIONHOURS as int) as vacation_hours
            , cast(SICKLEAVEHOURS as int) as sick_leave_hours

        from fonte_employee
    )

select * 
from renomeado