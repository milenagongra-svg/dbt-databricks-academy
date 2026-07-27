with
    source_production_productcategory as (
        select *
        from {{ source('adwork', 'production_productcategory') }}
    )

    , renamed as (
        select
            cast(productcategoryid as int) as product_category_pk
            , cast(name as string) as category_name
        from source_production_productcategory
    )

select *
from renamed