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
            {{ dbt_utils.generate_surrogate_key(['orders_reason.order_fk', 'sales_reason.sales_reason_pk']) }} as order_reason_sk
            , orders_reason.order_fk
            , sales_reason.sales_reason_pk as reason_fk
            , sales_reason.reason_name
            , sales_reason.reason_type
        from orders_reason
        inner join sales_reason
            on orders_reason.sales_reason_fk = sales_reason.sales_reason_pk
    )

select *
from joined