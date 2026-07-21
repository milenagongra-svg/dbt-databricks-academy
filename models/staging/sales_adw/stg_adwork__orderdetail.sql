with
    source_sales_salesorderdetail as (
        select *
        from {{ source('adwork', 'sales_salesorderdetail') }}
    )

    , renamed as (
        select
            {{ dbt_utils.generate_surrogate_key(['salesorderid', 'productid']) }} as order_item_sk
            , cast(salesorderid as int) as order_fk
            , cast(productid as int) as product_fk
            , cast(unitpricediscount as numeric(18, 2)) as discount_pct
            , cast(unitprice as numeric(18, 2)) as unit_price
            , cast(orderqty as int) as quantity
        from source_sales_salesorderdetail
    )

select *
from renamed