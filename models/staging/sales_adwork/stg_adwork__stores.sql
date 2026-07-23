with
    source_sales_store as (
        select *
        from {{ source('adwork', 'sales_store') }}
    )

    , renamed as (
        select
        cast(businessentityid as int) as store_id_pk
        , cast(name as string) as store_name
        from source_sales_store
    )

select *
from renamed