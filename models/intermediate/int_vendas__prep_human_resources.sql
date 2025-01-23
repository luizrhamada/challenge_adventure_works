with
    employee as (
        select *
        from {{ ref('stg_erp__employee') }}
    )

    , employeedepartmenthistory as (
        select *
        from {{ ref('stg_erp__employeedepartmenthistory') }}
    )

    , salesperson as (
        select *
        from {{ ref('stg_erp__salesperson') }}
    )

    , person as (
        select *
        from {{ ref('stg_erp__person') }}
    )

    
    , increase_human_resources as (
        select
            employee.PK_BUSINESS_ENTITY_ID
            , person.EMPLOYEE_NAME           
            , employee.JOB_TITLE
            --, employeedepartmenthistory.PK_START_DATE_ID
            --, employeedepartmenthistory.END_DATE
            , employee.BIRTHDATE_EMPLOYEE
            , employee.HIRE_DATE
            , employee.VACATION_HOURS
            , employee.SICK_LEAVE_HOURS            
            , salesperson.SALES_QUOTA
            , salesperson.BONUS
            , salesperson.COMISSION_PCT
            , salesperson.SALES_YTD_VALUE
            , salesperson.SALES_LAST_YEAR_VALUE
                
        from employee
        --left join employeedepartmenthistory on employee.pk_business_entity_id = employeedepartmenthistory.fk_business_entity_id
        left join salesperson on employee.pk_business_entity_id = salesperson.pk_business_entity_id
        left join person on employee.pk_business_entity_id = person.pk_business_entity_id
    )

select *
from increase_human_resources