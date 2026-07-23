with
    source_person_stateprovince as (
        select *
        from {{ source('adwork', 'person_stateprovince') }}
    )

    , renamed as (
        select
        cast(stateprovinceid as int) as state_province_id_pk
        , cast(countryregioncode as string) as country_region_fk
        , cast(stateprovincecode as string) as state_code
        , cast(name as string) as state_name
        from source_person_stateprovince
    )

select *
from renamed