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
            , quantity
            , unit_price
            , discount_pct
            , gross_total
            , discount_total
            , net_total
            , freight_allocated
            , tax_allocated
        from int_sales
    )

select *
from metrics