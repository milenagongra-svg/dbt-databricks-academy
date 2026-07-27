with
    int_sales as (
        select *
        from {{ ref('int_sales__joined_orders') }}
    )

    , metrics as (
        select
            order_item_sk
            , order_pk
            , customer_fk
            , credit_card_fk
            , address_fk
            , product_fk
            , order_date
            , order_status
            , sales_reason_name
            , quantity
            , unit_price
            , discount_pct
            , gross_amount as gross_total
            , discount_amount as discount_total
            , net_amount as net_total
        from int_sales
    )

select *
from metrics