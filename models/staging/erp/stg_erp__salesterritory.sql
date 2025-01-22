with
    fonte_salesterritory as (
        select * 
        from {{ source('erp','salesterritory') }}
    )

    , renomeado as (
        select
            cast(TERRITORYID as int) as pk_territory_id
            , cast(NAME as string) as name_territory
            , cast(COUNTRYREGIONCODE as string) as country_region_code
            , cast("group" as string) as continent_region
            , cast(SALESYTD as numeric(18,2)) as sales_ytd_per_region_value
            , cast(SALESLASTYEAR as numeric(18,2)) as sales_last_year_per_region_value
        from fonte_salesterritory
    )

select *
from renomeado