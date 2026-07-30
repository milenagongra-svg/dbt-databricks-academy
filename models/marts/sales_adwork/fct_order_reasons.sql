with
    int_reasons as (
        select *
        from {{ ref('int_sales__joined_reasons') }}
    )

select
    order_reason_sk
    , order_fk
    , reason_fk
    , reason_name
    , reason_type
from int_reasons