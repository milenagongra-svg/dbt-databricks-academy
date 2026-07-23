with
    -- import ctes
    orders_reason as (
        select *
        from {{ ref('stg_adwork__order_reasons') }}
    )

    , sales_reason as (
        select *
        from {{ ref('stg_adwork__sales_reasons') }}
    )

    -- transformation
    , joined as (
        select
             orders_reason.order_reason_sk
             , orders_reason.sales_order_fk
             , sales_reason.reason_type
             , sales_reason.reason_name
        from orders_reason
        inner join sales_reason
            on orders_reason.sales_reason_fk = sales_reason.sales_reason_pk
    )

select *
from joined