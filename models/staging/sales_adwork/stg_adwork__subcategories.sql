with
    source_production_productsubcategory as (
        select *
        from {{ source('adwork', 'production_productsubcategory') }}
    )

    , renamed as (
        select
            cast(productsubcategoryid as int) as product_subcategory_pk
            , cast(productcategoryid as int) as product_category_fk
            , cast(name as string) as subcategory_name
        from source_production_productsubcategory
    )

select *
from renamed