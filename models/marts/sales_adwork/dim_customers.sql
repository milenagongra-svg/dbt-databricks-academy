with
    int_customers as (
        select *
        from {{ ref('int_sales__joined_customers') }}
    )

    , dimensions as (
        select
            customer_sk
            , customer_name
            , customer_type
            , territory_fk
        from int_customers
    )

select *
from dimensions