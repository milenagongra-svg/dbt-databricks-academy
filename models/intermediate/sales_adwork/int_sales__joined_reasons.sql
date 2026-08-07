with
    orders_reasons as (
        select *
        from {{ ref('stg_adwork__order_reasons') }}
    )

    , sales_reasons as (
        select *
        from {{ ref('stg_adwork__sales_reasons') }}
    )

    , joined_reasons as (
        select
            orders_reasons.order_reason_sk as order_reason_pk
            , orders_reasons.order_fk
            , sales_reasons.sales_reason_pk as reason_fk
            , sales_reasons.reason_name
            , sales_reasons.reason_type
        from orders_reasons
        inner join sales_reasons
            on orders_reasons.sales_reason_fk = sales_reasons.sales_reason_pk
    )

    , final as (
        select
            order_reason_pk
            , order_fk
            , reason_fk
            , reason_name
            , reason_type
        from joined_reasons
    )

select *
from final