with
    source_person_countryregion as (
        select *
        from {{ source('adwork', 'person_countryregion') }}
    )

    , renamed as (
        select
        cast(countryregioncode as string) as country_region_pk
        , cast(name as string) as country_name
        from source_person_countryregion
    )

select *
from renamed