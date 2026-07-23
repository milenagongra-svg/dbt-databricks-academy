with
    source_sales_salesorderheadersalesreason as (
        select *
        from {{ source('adwork', 'sales_salesorderheadersalesreason') }}
    )

    , renamed as (
        select
            {{ dbt_utils.generate_surrogate_key(['salesorderid', 'salesreasonid']) }} as order_reason_sk
            , cast(salesorderid as int) as sales_order_fk
            , cast(salesreasonid as int) as sales_reason_fk
        from source_sales_salesorderheadersalesreason
    )

select *
from renamed