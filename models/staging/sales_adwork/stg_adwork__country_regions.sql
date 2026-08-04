with
    source_person_countryregion as (
        select *
        from {{ source('adwork', 'person_countryregion') }}
    )

    , cleaned as (
        select
            cast(countryregioncode as string) as country_region_pk
            , cast(
                replace(
                replace(
                replace(
                replace(
                replace(
                replace(
                replace(
                replace(
                    coalesce(name, 'Not Informed')
                    , 'Ã¼', 'ü')
                    , 'Ã¶', 'ö')
                    , 'Ã¤', 'ä')
                    , 'Ã©', 'é')
                    , 'Ã¨', 'è')
                    , 'Ã£', 'ã')
                    , 'Ã§', 'ç')
                    , 'Ã¡', 'á')
            as string) as country_name
        from source_person_countryregion
    )

select *
from cleaned