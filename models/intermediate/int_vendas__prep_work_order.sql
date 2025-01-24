with
    workorder as (
        select *
        from {{ ref('stg_erp__workorder') }}
    )

    , workorderrouting as (
        select *
        from {{ ref('stg_erp__workorderrouting') }}
    )

    , location as (
        select *
        from {{ ref('stg_erp__location') }}
    )

    , increase_work_order as (
        select
            workorderrouting.PK_WORK_PROD_LOC_ID
            , location.NAME_LOCATION
            , location.COSTRATE
            , location.AVAILABILITY
            , workorderrouting.PLANNED_COST
            , workorderrouting.ACTUAL_COST            
            , workorder.ORDER_QTY
            , workorder.SCRAPPED_QTY
            , workorder.START_DATE
            , workorder.END_DATE
            , workorder.DUE_DATE

        from workorderrouting
        left join workorder on workorderrouting.fk_work_order_id = workorder.pk_work_order_id
        left join location on workorderrouting.fk_location_id = location.pk_location_id

    )

select *
from increase_work_order