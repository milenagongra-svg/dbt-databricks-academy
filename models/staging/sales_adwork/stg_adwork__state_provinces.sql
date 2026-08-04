with
    source_person_stateprovince as (
        select *
        from {{ source('adwork', 'person_stateprovince') }}
    )

    , cleaned as (
        select
            cast(stateprovinceid as int) as state_province_pk
            , cast(countryregioncode as string) as country_region_fk
            , cast(stateprovincecode as string) as state_code
            , cast(
                replace(
                replace(
                replace(
                replace(
                replace(
                replace(
                replace(
                replace(
                    name
                    , 'Ã¼', 'ü')
                    , 'Ã¶', 'ö')
                    , 'Ã¤', 'ä')
                    , 'Ã©', 'é')
                    , 'Ã¨', 'è')
                    , 'Ã£', 'ã')
                    , 'Ã§', 'ç')
                    , 'Ã¡', 'á')
            as string) as state_name
        from source_person_stateprovince
    )

select *
from cleaned