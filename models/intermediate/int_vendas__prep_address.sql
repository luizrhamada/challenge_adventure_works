with
    address as (
        select * 
        from {{ ref('stg_erp__address') }}
    )

    , stateprovince as (
        select * 
        from {{ ref('stg_erp__stateprovince') }}
    )    

    , increase_address as (
        select
            address.PK_ADDRESS_ID
            , address.FK_STATE_PROVINCE_ID
            , address.ADDRESS_LINE1
            , address.ADDRESS_LINE2
            , address.CITY
            , address.POSTAL_CODE
            , stateprovince.FK_TERRITORY_ID

        from address
        left join stateprovince on address.FK_STATE_PROVINCE_ID = stateprovince.PK_STATE_PROVINCE_ID
    ) 

select *
from increase_address