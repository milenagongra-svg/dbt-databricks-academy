with
    -- import models
    int_sales as (
        select *
        from {{ ref('int_sales__joined_orders') }}
    )
    , metrics as (
        select
       order_item_sk
       , customer_fk
       , creditid_fk
       , addressid_fk
       , product_fk
       , order_date
       , order_status
       , discount_pct
       , unit_price
       , quantity
       , unit_price * quantity as gross_total
       , unit_price * (1 - discount_pct) * quantity as net_total
        from int_sales
    )
select *
from metrics