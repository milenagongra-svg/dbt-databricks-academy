with
    orders_reason as (
        select *
        from {{ ref('stg_adwork__order_reasons') }}
    )

    , sales_reason as (
        select *
        from {{ ref('stg_adwork__sales_reasons') }}
    )

    , joined as (
        select
            orders_reason.order_fk
            , sales_reason.reason_name
            , sales_reason.reason_type
        from orders_reason
        inner join sales_reason
            on orders_reason.sales_reason_fk = sales_reason.sales_reason_pk
    )

    , aggregated as (
        select
            order_fk
            , coalesce(array_join(collect_set(reason_name), ', '), 'Not Informed') as sales_reason_name
        from joined
        group by order_fk
    )

select *
from aggregated