with
    source_person_address as (
        select *
        from {{ source('adwork', 'person_address') }}
    )

    , cleaned as (
        select
            cast(addressid as int) as address_pk
            , cast(stateprovinceid as int) as state_province_fk
            , cast(
                replace(
                replace(
                replace(
                replace(
                replace(
                replace(
                replace(
                replace(
                    addressline1
                    , 'Ã¼', 'ü')
                    , 'Ã¶', 'ö')
                    , 'Ã¤', 'ä')
                    , 'Ã©', 'é')
                    , 'Ã¨', 'è')
                    , 'Ã£', 'ã')
                    , 'Ã§', 'ç')
                    , 'Ã¡', 'á')
            as string) as address_line
            , cast(
                replace(
                replace(
                replace(
                replace(
                replace(
                replace(
                replace(
                replace(
                    city
                    , 'Ã¼', 'ü')
                    , 'Ã¶', 'ö')
                    , 'Ã¤', 'ä')
                    , 'Ã©', 'é')
                    , 'Ã¨', 'è')
                    , 'Ã£', 'ã')
                    , 'Ã§', 'ç')
                    , 'Ã¡', 'á')
            as string) as city_name

        from source_person_address
    )

select *
from cleaned