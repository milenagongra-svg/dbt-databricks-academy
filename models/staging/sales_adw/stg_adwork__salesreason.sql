with
    source_sales_salesreason as (
        select *
        from {{ source('adwork', 'sales_salesreason') }}
    )

    , renamed as (
        select
            cast(salesreasonid as int) as sales_reason_pk
            , cast(name as string) as reason_name
            , cast(reasontype as string) as reason_type
        from source_sales_salesreason
    )

select *
from renamed