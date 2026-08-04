with
    source_sales_salesorderheader as (
        select *
        from {{ source('adwork', 'sales_salesorderheader') }}
    )

    , renamed as (
        select
            cast(salesorderid as int) as order_pk
            , cast(customerid as int) as customer_fk
            , cast(creditcardid as bigint) as credit_card_fk
            , cast(shiptoaddressid as int) as address_fk
            , cast(territoryid as int) as territory_fk
            , cast(orderdate as date) as order_date
            , cast(status as int) as order_status
            , cast(subtotal as numeric(18,4)) as subtotal
            , cast(taxamt as numeric(18,4)) as tax_amount
            , cast(freight as numeric(18,4)) as freight_amount
            , cast(totaldue as numeric(18,4)) as total_due
        from source_sales_salesorderheader
    )

select *
from renamed