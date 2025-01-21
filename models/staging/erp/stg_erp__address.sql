with
    fonte_address as (
        select * 
        from {{ source('erp','address') }}
    )

    , renomeado as (
        select
            cast(ADDRESSID as int) as pk_address_id
            , cast(STATEPROVINCEID as int) as fk_state_province_id
            , cast(ADDRESSLINE1 as string) as address_line1
            , cast(ADDRESSLINE2 as string) as address_line2
            , cast(CITY as string) as city            
            , cast(POSTALCODE as string) as postal_code
            , cast(SPATIALLOCATION as string) as spatial_location
        from fonte_address
    )

select * 
from renomeado