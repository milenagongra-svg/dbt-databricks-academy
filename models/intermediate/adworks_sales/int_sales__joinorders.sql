with
    -- import ctes
    orders as (
        select *
        from {{ ref('stg_adwork__orders') }}
    )

    , orderdetail as (
        select *
        from {{ ref('stg_adwork__orderdetail') }}
    )

    -- transformation
    , joined as (
        select
            orderdetail.order_item_sk
            , orders.customer_fk
            , orders.creditid_fk
            , orders.addressid_fk
            , orderdetail.product_fk
            , orders.order_date
            , orders.order_status
            , orderdetail.discount_pct
            , orderdetail.unit_price
            , orderdetail.quantity
        from orders
        inner join orderdetail
            on orders.order_pk = orderdetail.order_fk
    )

select *
from joined