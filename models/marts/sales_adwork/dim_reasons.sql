with
    int_reasons as (
        select *
        from {{ ref('int_sales__joined_reasons') }}
    )

    , dimensions as (
        select
            order_fk
            , sales_reason_name
        from int_reasons
    )

select *
from dimensions