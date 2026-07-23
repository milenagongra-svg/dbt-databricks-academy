with
    source_sales_customer as (
        select *
        from {{ source('adwork', 'sales_customer') }}
    )

    , renamed as (
        select
        cast(customerid as int) as customer_id_pk
        , cast(personid as int) as person_id_fk
        , cast(storeid as int) as store_id_fk
        , cast(territoryid as int) as territory_id_fk
        from source_sales_customer
    )

select *
from renamed