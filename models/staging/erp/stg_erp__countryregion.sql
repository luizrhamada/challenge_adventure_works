with
    fonte_countryregion as (
        select * 
        from {{ source('erp','countryregion') }}
    )

    , renomeado as (
        select 
            cast(COUNTRYREGIONCODE as string) as pk_country_region_code_id
            , cast(NAME as string) as name_region_code

        from fonte_countryregion
    )

select * 
from renomeado