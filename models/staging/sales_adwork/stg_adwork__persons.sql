with
    source_person_person as (
        select *
        from {{ source('adwork', 'person_person') }}
    )

    , renamed as (
        select
        cast(businessentityid as int) as person_id_pk
        , cast(firstname as string) as first_name
        , cast(lastname as string) as last_name
        , trim(concat(coalesce(firstname, ''), ' ', coalesce(lastname, ''))) as full_name
        from source_person_person
    )

select *
from renamed