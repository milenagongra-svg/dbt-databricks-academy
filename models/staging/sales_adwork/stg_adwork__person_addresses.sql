with
    source_person_address as (
        select *
        from {{ source('adwork', 'person_address') }}
    )

    , renamed as (
        select
        cast(addressid as int) as address_id_pk
        , cast(addressline1 as string) as address_line
        , cast(city as string) as city_name
        , cast(stateprovinceid as int) as state_province_id_fk
        from source_person_address
    )

select *
from renamed