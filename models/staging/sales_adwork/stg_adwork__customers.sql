with
    source_sales_customer as (
        select *
        from {{ source('adwork', 'sales_customer') }}
    )

    , renamed as (
        select
            cast(customerid as int) as customer_pk
            , cast(personid as int) as person_fk
            , cast(storeid as int) as store_fk
            , cast(territoryid as int) as territory_fk
        from source_sales_customer
    )

select *
from renamed