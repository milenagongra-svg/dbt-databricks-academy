with
    int_addresses as (
        select *
        from {{ ref('int_sales__joined_territories') }}
    )

    , dimensions as (
        select
            address_sk
            , address_line
            , city_name
            , state_code
            , state_name
            , country_code
            , country_name
        from int_addresses
    )

select *
from dimensions