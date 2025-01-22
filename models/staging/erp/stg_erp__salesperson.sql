with
    fonte_salesperson as (
        select * 
        from {{ source('erp','salesperson') }}
    )

    , renomeado as (
        select
            cast(BUSINESSENTITYID as int) as pk_business_entity_id
            , cast(TERRITORYID as int) as fk_territory_id
            , cast(SALESQUOTA as int) as sales_quota
            , cast(BONUS as numeric(18,2)) as bonus
            , cast(COMMISSIONPCT as float) as comission_pct
            , cast(SALESYTD as numeric(18,2)) as sales_ytd_value
            , cast(SALESLASTYEAR as numeric(18,2)) as sales_last_year_value

        from fonte_salesperson
    )

select *
from renomeado