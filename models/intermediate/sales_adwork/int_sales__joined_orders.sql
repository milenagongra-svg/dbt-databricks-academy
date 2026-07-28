with
    orders as (
        select *
        from {{ ref('stg_adwork__orders') }}
    )

    , orderdetail as (
        select *
        from {{ ref('stg_adwork__order_details') }}
    )

    , order_reasons as (
        select *
        from {{ ref('int_sales__joined_reasons') }}
    )

    , joined as (
        select
            orderdetail.order_item_sk
            , orders.order_pk
            , coalesce(orders.customer_fk, -1) as customer_fk
            , coalesce(orders.credit_card_fk, -1) as credit_card_fk
            , coalesce(orders.address_fk, -1) as address_fk
            , orderdetail.product_fk
            , orders.order_date
            , case orders.order_status
                when 1 then 'In Process'
                when 2 then 'Approved'
                when 3 then 'Backordered'
                when 4 then 'Rejected'
                when 5 then 'Shipped'
                when 6 then 'Cancelled'
                else 'Unknown'
            end as order_status
            , coalesce(order_reasons.sales_reason_name, 'Not Informed') as sales_reason_name
            , orderdetail.quantity
            , orderdetail.unit_price
            , orderdetail.discount_pct
            , (orderdetail.quantity * orderdetail.unit_price) as gross_amount
            , (
                (orderdetail.quantity * orderdetail.unit_price) * orderdetail.discount_pct
            ) as discount_amount
            , (
                (orderdetail.quantity * orderdetail.unit_price) * (1 - orderdetail.discount_pct)
            ) as net_amount
        from orders
        inner join orderdetail
            on orders.order_pk = orderdetail.order_fk
        left join order_reasons
            on orders.order_pk = order_reasons.order_fk
    )

select *
from joined