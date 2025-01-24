with
    fonte_workorderrouting as (
        select * 
        from {{ source('erp','workorderrouting') }}
    )

    , renomeado as (
        select
            PRODUCTID::string || '-' || WORKORDERID::string || '-' || LOCATIONID::int as pk_work_prod_loc_id
            , cast(PRODUCTID as int) as fk_product_id
            , cast(WORKORDERID as int) as fk_work_order_id   
            , cast(LOCATIONID as int) as fk_location_id         
            , cast(OPERATIONSEQUENCE as int) as fk_operation_sequence            
            , cast(SCHEDULEDSTARTDATE as string) as schedule_start_date
            , cast(SCHEDULEDENDDATE as string) as schedule_end_date
            , cast(ACTUALSTARTDATE as string) as actual_start_date
            , cast(ACTUALENDDATE as string) as actual_end_date
            , cast(ACTUALRESOURCEHRS as numeric(18,2)) as actual_resource_hrs
            , cast(PLANNEDCOST as numeric(18,2)) as planned_cost
            , cast(ACTUALCOST as numeric(18,2)) as actual_cost


        from fonte_workorderrouting
    )

select * 
from renomeado