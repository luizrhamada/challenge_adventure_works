with
    fonte_stateprovince as (
        select * 
        from {{ source('erp','stateprovince') }}
    )

    , renomeado as (
        select
            cast(STATEPROVINCEID as int) as pk_state_province_id
            , cast(TERRITORYID as int) as fk_territory_id
            , cast(STATEPROVINCECODE as string) as fk_state_code_id
            , cast(COUNTRYREGIONCODE as string) as country_region_code
            , cast(ISONLYSTATEPROVINCEFLAG as string) as boolean_flag_state_province
            , cast(NAME as string) as name_province

        from fonte_stateprovince
    )

select * 
from renomeado