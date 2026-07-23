with
    adrdress as (
        select *
        from {{ ref('stg_adwork__person_addresses') }}
    )

    , province as (
        select *
        from {{ ref('stg_adwork__state_provinces') }}
    )

    , country as (
        select *
        from {{ ref('stg_adwork__country_regions') }}
    )
, joined as (
        select
            adrdress.address_id_pk
            , adrdress.address_line
            , adrdress.city_name
            , province.state_code
            , province.state_name
            , country.country_name
        from adrdress
        left join province
            on adrdress.state_province_id_fk = province.state_province_id_pk
        left join country 
            on province.country_region_fk = country.country_region_pk
    )

select * 
from joined