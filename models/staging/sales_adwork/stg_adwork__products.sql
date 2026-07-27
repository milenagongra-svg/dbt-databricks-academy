with
    source_production_product as (
        select *
        from {{ source('adwork', 'production_product') }}
    )

    , renamed as (
        select
            cast(productid as int) as product_pk
            , cast(productsubcategoryid as int) as product_subcategory_fk
            , cast(productmodelid as int) as product_model_fk
            , cast(name as string) as product_name
            , cast(productnumber as string) as product_number
            , cast(standardcost as numeric(18, 2)) as standard_cost
            , cast(listprice as numeric(18, 2)) as list_price
        from source_production_product
    )

select *
from renamed