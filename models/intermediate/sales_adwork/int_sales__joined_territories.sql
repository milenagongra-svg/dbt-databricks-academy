with
    addresses as (
        select *
        from {{ ref('stg_adwork__person_addresses') }}
    )

    , states as (
        select *
        from {{ ref('stg_adwork__state_provinces') }}
    )

    , countries as (
        select *
        from {{ ref('stg_adwork__country_regions') }}
    )

    , joined as (
        select
            addresses.address_pk as address_sk
            , coalesce(addresses.address_line, 'Not Informed') as address_line
            , coalesce(addresses.city_name, 'Not Informed') as city_name
            , coalesce(states.state_code, 'NA') as state_code
            , coalesce(states.state_name, 'Not Informed') as state_name
            , coalesce(countries.country_region_pk, 'NA') as country_code
            , coalesce(countries.country_name, 'Not Informed') as country_name
        from addresses
        left join states
            on addresses.state_province_fk = states.state_province_pk
        left join countries
            on states.country_region_fk = countries.country_region_pk
    )

    , unmapped as (
        select
            -1 as address_sk
            , 'Not Informed' as address_line
            , 'Not Informed' as city_name
            , 'NA' as state_code
            , 'Not Informed' as state_name
            , 'NA' as country_code
            , 'Not Informed' as country_name
    )

    , combined as (
        select *
        from joined
        union all
        select *
        from unmapped
    )

select *
from combined