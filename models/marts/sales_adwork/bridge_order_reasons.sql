with
    int_reasons as (
        select *
        from {{ ref('int_sales__joined_reasons') }}
    )

select
    order_reason_pk
    , order_fk
    , reason_fk
from int_reasons